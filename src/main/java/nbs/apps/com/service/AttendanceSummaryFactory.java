package nbs.apps.com.service;

import nbs.apps.com.rest.model.AttendanceSummary;

public class AttendanceSummaryFactory {

    private static final AttendanceSummary defaultSummary = new AttendanceSummary(null, null,0D,0D,0D);
    public static AttendanceSummary getDefaultInstance() {
        return defaultSummary;
    }
}
