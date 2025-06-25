package com.resustainability.reisp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import javax.ws.rs.QueryParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.resustainability.reisp.model.AttendanceDto;
import com.resustainability.reisp.model.EmployeeDto;

import org.springframework.stereotype.Repository;
@Repository
public class AttendanceDAOImpl  implements AttendanceDAO {
	@Autowired
	DataSource dataSource;
	
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<AttendanceDto> fetchPaginatedAttendance(String empCode, String fromDate, String toDate, int start, int length) {
        StringBuilder sql = new StringBuilder();
        sql.append("WITH Filtered AS ( ");
        sql.append("  SELECT *, ");
        sql.append("  ROW_NUMBER() OVER (ORDER BY work_date DESC) AS rn ");
        sql.append("  FROM [INOPSETPDB].[dbo].[att_attendanceRe] ");
        sql.append("  WHERE CAST(work_date AS DATE) BETWEEN ? AND ?  ");
        if (empCode != null && !empCode.isEmpty()) {
            sql.append(" AND emp_code = ? ");
        }
        sql.append(") ");
        sql.append("SELECT * FROM Filtered WHERE rn BETWEEN ? AND ?");

        List<Object> params = new ArrayList<>();
        params.add(fromDate);
        params.add(toDate);
        if (empCode != null && !empCode.isEmpty()) {
            params.add(empCode);
        }
        params.add(start + 1);              // for pagination start index (1-based)
        params.add(start + length);         // for pagination end index

        return jdbcTemplate.query(sql.toString(), params.toArray(), (rs, rowNum) -> {
            AttendanceDto dto = new AttendanceDto();
            dto.setWorkDate(rs.getString("work_date"));
            dto.setEmpCode(rs.getString("emp_code"));
            dto.setEmployeeName(rs.getString("employee_name")); // correct column
            dto.setCheckIn(rs.getString("day_start"));
            dto.setCheckOut(rs.getString("day_end"));
            dto.setShiftType(rs.getString("shift_type"));
            dto.setTotalHours(rs.getInt("total_hours") + ":" + rs.getInt("total_minutes"));
            dto.setTotalWorkingHours(rs.getString("total_working_hours"));
            dto.setAttendanceStatus(rs.getString("attendance_status"));
            dto.setHolidayReason(rs.getString("holiday_reason"));
            dto.setIsHoliday(rs.getInt("is_holiday"));
            dto.setOvertime(rs.getInt("overtime_hours") + ":" + rs.getInt("overtime_minutes"));
            dto.setFinalOT(rs.getString("final_OT"));
            dto.setRemarks(rs.getString("remarks"));
            return dto;
        });
    }


    @Override
    public int fetchTotalAttendanceCount(String empCode, String fromDate, String toDate) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM att_attendanceRe WHERE CAST(work_date AS DATE) BETWEEN ? AND ? ");
        List<Object> params = new ArrayList<>();
        params.add(fromDate);
        params.add(toDate);
        if (empCode != null && !empCode.isEmpty()) {
            sql.append(" AND emp_code = ? ");
            params.add(empCode);
        }
        return jdbcTemplate.queryForObject(sql.toString(), params.toArray(), Integer.class);
    }

    @Override
    public List<EmployeeDto> fetchDistinctEmployees() {
        String sql = "SELECT DISTINCT emp_code, first_name FROM personnel_employee ORDER BY first_name";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            EmployeeDto emp = new EmployeeDto();
            emp.setEmpCode(rs.getString("emp_code"));
            emp.setFirstName(rs.getString("first_name"));
            return emp;
        });
    }
    @Override
    public void executeAttendanceReloadInsert(String fromDate, String toDate, String areaAlias) throws SQLException {
        try (Connection con = dataSource.getConnection()) {

            // Attempt to create indexes for better performance (ignore failures if index exists)
            try (Statement indexStmt = con.createStatement()) {
                indexStmt.execute("CREATE NONCLUSTERED INDEX IX_iclock_transaction_punch_time ON iclock_transaction (punch_time);");
                indexStmt.execute("CREATE NONCLUSTERED INDEX IX_iclock_transaction_emp_code ON iclock_transaction (emp_code);");
                indexStmt.execute("CREATE NONCLUSTERED INDEX IX_iclock_transaction_area_alias ON iclock_transaction (area_alias);");
            } catch (SQLException e) {
                // Log or ignore index errors
            }

            StringBuilder qry = new StringBuilder();

            qry.append("DECLARE @fromDate DATE = ?;\n");
            qry.append("DECLARE @toDate DATE = ?;\n");
            qry.append("DECLARE @areaAlias VARCHAR(100) = ?;\n");
            qry.append("WITH Calendar AS (\n");
            qry.append("    SELECT DATEADD(DAY, number, @fromDate) AS work_date\n");
            qry.append("    FROM master..spt_values\n");
            qry.append("    WHERE type = 'P' AND number BETWEEN 0 AND DATEDIFF(DAY, @fromDate, @toDate)\n");
            qry.append("), RawPunches AS (\n");
            qry.append("    SELECT it.emp_code, CAST(it.punch_time AS DATE) AS work_date, it.punch_time, it.punch_state, it.emp_id,\n");
            qry.append("           pe.first_name, pa.area_name, pp.position_name, ssd.site_name\n");
            qry.append("    FROM iclock_transaction it\n");
            qry.append("    INNER JOIN personnel_employee pe ON it.emp_id = pe.id\n");
            qry.append("    LEFT JOIN personnel_area pa ON UPPER(it.area_alias) = UPPER(pa.area_code)\n");
            qry.append("    LEFT JOIN personnel_position pp ON pe.position_id = pp.id\n");
            qry.append("    LEFT JOIN site_shift_details_re ssd ON UPPER(it.area_alias) = UPPER(ssd.site_name)\n");
            qry.append("    WHERE it.punch_time BETWEEN @fromDate AND DATEADD(DAY, 1, @toDate)\n");
            qry.append("      AND (@areaAlias IS NULL OR it.area_alias = @areaAlias)\n");
            qry.append("), FirstPunch AS (\n");
            qry.append("    SELECT emp_code, work_date, MIN(punch_time) AS check_in\n");
            qry.append("    FROM RawPunches WHERE punch_state = 0 GROUP BY emp_code, work_date\n");
            qry.append("), SecondPunch AS (\n");
            qry.append("    SELECT emp_code, work_date, MIN(punch_time) AS check_out\n");
            qry.append("    FROM RawPunches WHERE punch_state = 1 GROUP BY emp_code, work_date\n");
            qry.append("), EmployeeData AS (\n");
            qry.append("    SELECT emp_id, emp_code, first_name, area_name, position_name, site_name, work_date FROM (\n");
            qry.append("        SELECT it.emp_id, it.emp_code, pe.first_name, pa.area_name, pp.position_name, ssd.site_name,\n");
            qry.append("               CAST(it.punch_time AS DATE) AS work_date,\n");
            qry.append("               ROW_NUMBER() OVER (PARTITION BY it.emp_id, CAST(it.punch_time AS DATE)\n");
            qry.append("                              ORDER BY it.punch_time DESC) AS rn\n");
            qry.append("        FROM iclock_transaction it\n");
            qry.append("        INNER JOIN personnel_employee pe ON it.emp_id = pe.id\n");
            qry.append("        LEFT JOIN personnel_area pa ON UPPER(it.area_alias) = UPPER(pa.area_code)\n");
            qry.append("        LEFT JOIN personnel_position pp ON pe.position_id = pp.id\n");
            qry.append("        LEFT JOIN site_shift_details_re ssd ON UPPER(it.area_alias) = UPPER(ssd.site_name)\n");
            qry.append("        WHERE it.punch_time BETWEEN @fromDate AND DATEADD(DAY, 1, @toDate)\n");
            qry.append("          AND (@areaAlias IS NULL OR it.area_alias = @areaAlias)\n");
            qry.append("    ) x WHERE x.rn = 1\n");
            qry.append("), HolidayData AS (\n");
            qry.append("    SELECT CAST(start_date AS DATE) AS holiday_date, alias AS holiday_reason FROM att_holiday\n");
            qry.append("), Combined AS (\n");
            qry.append("    SELECT c.work_date, ed.emp_code, ed.first_name AS employee_name, ed.area_name, ed.position_name, ed.site_name,\n");
            qry.append("           FORMAT(fp.check_in, 'HH:mm') AS day_start, FORMAT(sp.check_out, 'HH:mm') AS day_end,\n");
            qry.append("           CASE WHEN fp.check_in IS NOT NULL AND sp.check_out IS NOT NULL\n");
            qry.append("                THEN DATEDIFF(SECOND, fp.check_in, sp.check_out) ELSE 0 END AS total_seconds,\n");
            qry.append("           CASE WHEN fp.check_in IS NOT NULL THEN\n");
            qry.append("               CASE\n");
            qry.append("                   WHEN CAST(fp.check_in AS TIME) BETWEEN '03:45:00' AND '08:44:59' THEN 'Shift A'\n");
            qry.append("                   WHEN CAST(fp.check_in AS TIME) BETWEEN '08:45:00' AND '12:44:59' THEN 'General Shift'\n");
            qry.append("                   WHEN CAST(fp.check_in AS TIME) BETWEEN '12:45:00' AND '21:14:59' THEN 'Shift B'\n");
            qry.append("                   ELSE 'Shift C' END ELSE 'Unknown' END AS shift_type,\n");
            qry.append("           FORMAT(DATEADD(SECOND, CASE WHEN sp.check_out > fp.check_in\n");
            qry.append("                                     THEN DATEDIFF(SECOND, fp.check_in, sp.check_out) ELSE 0 END, 0), 'HH:mm:ss') AS total_working_hours,\n");
            qry.append("           hd.holiday_reason, fp.check_in, sp.check_out\n");
            qry.append("    FROM Calendar c\n");
            qry.append("    LEFT JOIN FirstPunch fp ON c.work_date = fp.work_date\n");
            qry.append("    LEFT JOIN SecondPunch sp ON c.work_date = sp.work_date AND sp.emp_code = fp.emp_code\n");
            qry.append("    LEFT JOIN EmployeeData ed ON ed.emp_code = fp.emp_code AND ed.work_date = c.work_date\n");
            qry.append("    LEFT JOIN HolidayData hd ON c.work_date = hd.holiday_date\n");
            qry.append("), Final AS (\n");
            qry.append("    SELECT work_date, emp_code, employee_name, position_name, area_name, site_name, day_start, day_end, shift_type,\n");
            qry.append("           total_working_hours, total_seconds / 3600 AS total_hours, (total_seconds % 3600) / 60 AS total_minutes,\n");
            qry.append("           CASE WHEN total_seconds > 28800 THEN (total_seconds - 28800) / 3600 ELSE 0 END AS overtime_hours,\n");
            qry.append("           CASE WHEN total_seconds > 28800 THEN ((total_seconds - 28800) % 3600) / 60 ELSE 0 END AS overtime_minutes,\n");
            qry.append("           CASE\n");
            qry.append("               WHEN check_in IS NULL AND check_out IS NULL AND holiday_reason IS NOT NULL THEN 'Leave'\n");
            qry.append("                WHEN total_seconds <= 3600 AND work_date = CAST(GETDATE() AS DATE) THEN 'Present' WHEN total_seconds <= 3600 THEN 'Missed OUT' ELSE 'OK' END AS attendance_status,\n");
            qry.append("           CASE WHEN holiday_reason IS NOT NULL THEN 1 ELSE 0 END AS is_holiday,\n");
            qry.append("           ISNULL(holiday_reason, '') AS holiday_reason\n");
            qry.append("    FROM Combined\n");
            qry.append(")\n");
            qry.append("INSERT INTO att_attendanceRe\n");
            qry.append("(emp_code, employee_name, position_name, area_name, site_name, work_date, day_start, day_end, shift_type,\n");
            qry.append(" total_working_hours, total_hours, total_minutes, overtime_hours, overtime_minutes, attendance_status,\n");
            qry.append(" is_holiday, holiday_reason)\n");
            qry.append("SELECT emp_code, employee_name, position_name, area_name, site_name, work_date, day_start, day_end, shift_type,\n");
            qry.append("       total_working_hours, total_hours, total_minutes, overtime_hours, overtime_minutes, attendance_status,\n");
            qry.append("       is_holiday, holiday_reason FROM Final;\n");

            try (PreparedStatement ps = con.prepareStatement(qry.toString())) {
                ps.setString(1, fromDate);
                ps.setString(2, toDate);
                ps.setString(3, areaAlias);
                ps.executeUpdate();
            }
        }
    }





    @Override
    public List<AttendanceDto> findMissedPunches( String empCode, 
    		Date fromDate, 
    		Date toDate, String areaAlias, 
            boolean onlyMissed) {
        List<AttendanceDto> results = new ArrayList<>();
        String sql = "SELECT a.emp_code, e.first_name, e.last_name, " +
                     "a.work_date, a.day_start, a.day_end, " +
                     "a.total_working_hours, a.attendance_status, a.holiday_reason " +
                     "FROM [INOPSETPDB].[dbo].[att_attendanceRe] a JOIN [INOPSETPDB].[dbo].[personnel_employee] e ON a.emp_code = e.emp_code " +
                     "WHERE (? IS NULL OR a.work_date >= ?) " +
                     "AND (? IS NULL OR a.work_date <= ?) " +
                     "AND (a.day_start IS NULL OR a.day_end IS NULL " +
                     "OR a.attendance_status = 'Absent' OR a.attendance_status = 'Missed OUT')";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            // Set parameters
            stmt.setDate(1, fromDate);
            stmt.setDate(2, fromDate);
            stmt.setDate(3, toDate);
            stmt.setDate(4, toDate);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AttendanceDto dto = new AttendanceDto();
                    dto.setEmpCode(rs.getString("emp_code"));
                    dto.setEmployeeName(rs.getString("first_name") + " " + rs.getString("last_name"));
                    dto.setWorkDate(rs.getString("work_date"));
                    dto.setCheckIn(rs.getString("day_start"));
                    dto.setCheckOut(rs.getString("day_end"));
                    dto.setTotalHours(rs.getString("total_working_hours"));
                    dto.setAttendanceStatus(rs.getString("attendance_status"));
                    dto.setHolidayReason(rs.getString("holiday_reason"));
                    
                    results.add(dto);
                }
            }
        } catch (SQLException e) {
        	e.printStackTrace();
            throw new RuntimeException("Error fetching missed punches", e);
        }
        return results;
    }
	

}
