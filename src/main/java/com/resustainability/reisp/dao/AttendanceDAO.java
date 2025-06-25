package com.resustainability.reisp.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import com.resustainability.reisp.model.AttendanceDto;
import com.resustainability.reisp.model.EmployeeDto;

public interface AttendanceDAO {
	List<AttendanceDto> fetchPaginatedAttendance(String empCode, String fromDate, String toDate, int start, int length);
    int fetchTotalAttendanceCount(String empCode, String fromDate, String toDate);
    List<EmployeeDto> fetchDistinctEmployees();
    void executeAttendanceReloadInsert(String fromDate, String toDate, String areaAlias) throws SQLException;
    List<AttendanceDto> findMissedPunches(String empCode, Date fromDate, Date toDate, String areaAlias, boolean onlyMissed);
}
