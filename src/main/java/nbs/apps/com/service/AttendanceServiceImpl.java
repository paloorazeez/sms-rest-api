package nbs.apps.com.service;


import nbs.apps.com.model.Attendance;
import nbs.apps.com.repository.IAttendanceRepository;
import nbs.apps.com.rest.model.AttendanceSummary;
import nbs.apps.com.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

@Service
public class AttendanceServiceImpl implements IAttendanceService {


    public static final int WORKING_HOURS = 7;
    @Autowired
    private IAttendanceRepository attendanceRepository;

    @Override
    public AttendanceSummary getAttendanceSummaryByStudent(String fromDate, String toDate, Long studentId) {
        AttendanceSummary summary = null;

        Date fromDt = DateUtil.stringToDate(fromDate, DateUtil.YYYY_MM_DD);
        Date toDt = DateUtil.stringToDate(toDate, DateUtil.YYYY_MM_DD);
        List<Attendance> attendanceList = null;
        if(fromDt != null && toDt != null)
        {
            attendanceList = attendanceRepository.findByStudentIdAndDateBetween(studentId, fromDt, toDt);
        }
        else if(fromDt != null)
        {
            attendanceList = attendanceRepository.findByStudentIdAndDateGreaterThanEqual(studentId, fromDt);

        }
        else if(toDate != null)
        {
            attendanceList = attendanceRepository.findByStudentIdAndDateLessThanEqual(studentId,toDt);
        }
        else {
            attendanceList = attendanceRepository.findByStudentId(studentId);
        }

        summary = createSummary(attendanceList);
        summary.setFromDate(fromDt);
        summary.setToDate(toDt);

        return summary;
    }

    private AttendanceSummary createSummary(List<Attendance> attendanceList) {


        if(attendanceList == null)
        {
            return AttendanceSummaryFactory.getDefaultInstance();
        }
        Double totalDaysPresent = 0D;
        Double totalDaysAbsent = 0D;
        AttendanceSummary summary = new AttendanceSummary();
        Map<String,List<Attendance>> attendanceByDate = createAttendanceMap(attendanceList);
        for(Map.Entry<String,List<Attendance>> entry : attendanceByDate.entrySet())
        {
            Double hrsPresent = 0D;
            Double hrsAbsent = 0D;
            List<Attendance> attendances = entry.getValue();
            if(attendances != null && attendances.size()>0)
            {

                for(Attendance attendance: attendances)
                {
                   if(attendance.isPresent())
                   {
                       hrsPresent += DateUtil.getHours(attendance.getTimeFrom() , attendance.getTimeTo());
                   }
                   else {
                       hrsAbsent += DateUtil.getHours(attendance.getTimeFrom() , attendance.getTimeTo());
                   }

                }
            }
            hrsPresent = Math.min(hrsPresent, WORKING_HOURS);
            hrsAbsent = Math.min(hrsAbsent, WORKING_HOURS);

            if(hrsPresent > 0)
            {
                double totalHourPresentPerDay = new BigDecimal(WORKING_HOURS).divide(new BigDecimal(hrsPresent)).doubleValue();
                totalDaysPresent += totalHourPresentPerDay;
            }

            if(hrsAbsent > 0)
            {
                double totalHourAbsentPerDay = new BigDecimal(WORKING_HOURS).divide(new BigDecimal(hrsAbsent)).doubleValue();
                totalDaysAbsent += totalHourAbsentPerDay;
            }


        }

        summary.setAbscentDays(totalDaysAbsent);
        summary.setTotalDays(totalDaysAbsent+totalDaysPresent);
        summary.setPresentDays(totalDaysPresent);
        return summary;
    }

    private Map<String, List<Attendance>> createAttendanceMap(List<Attendance> attendanceList) {

        Map<String,List<Attendance>> attendanceByDate = new HashMap<>();
        if(attendanceList != null && attendanceList.size() >0)
        {
            for (Attendance attendance:attendanceList) {

                String dateStr = DateUtil.dateToString(attendance.getDate(), DateUtil.YYYY_MM_DD);
                List<Attendance> list = attendanceByDate.get(dateStr);
                if(list == null)
                {
                    list = new ArrayList<>();
                }
                list.add(attendance);
                attendanceByDate.put(dateStr, list);
            }
        }
        return attendanceByDate;
    }
}
