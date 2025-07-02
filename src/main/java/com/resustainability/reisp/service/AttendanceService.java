package com.resustainability.reisp.service;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.resustainability.reisp.model.AttendanceDto;
import com.resustainability.reisp.model.AttendanceRegularizationDTO;
import com.resustainability.reisp.model.EmployeeDto;

public interface AttendanceService {
	  List<AttendanceDto> getPaginatedAttendance(String empCode, String fromDate, String toDate, int start, int length);
	    int getTotalAttendanceCount(String empCode, String fromDate, String toDate);
	    List<EmployeeDto> getEmployeeFilterList();
		void reloadAndInsertAttendance(String fromDate, String toDate, String areaAlias) throws SQLException;
		List<AttendanceDto> getAllMissedPunches(String empCode, LocalDate fromDate, LocalDate toDate, 
                String areaAlias, boolean onlyMissed);
		void downloadMissedPunches(List<AttendanceDto> missedPunches, HttpServletResponse response) throws IOException;

//	void regularizeAttendance(AttendanceRegularizationDTO data);
}
