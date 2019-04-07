package nbs.apps.com.service;

import nbs.apps.com.rest.model.AttendanceSummary;

import java.util.List;

public interface IAttendanceService {
    AttendanceSummary getAttendanceSummaryByStudent(String fromDate, String toDate, Long studentId);
}
