package nbs.apps.com.rest;

import nbs.apps.com.model.Attendance;
import nbs.apps.com.model.Student;
import nbs.apps.com.model.Teacher;
import nbs.apps.com.repository.IAttendanceRepository;
import nbs.apps.com.repository.IStudentRepository;
import nbs.apps.com.repository.ITeacherRepository;
import nbs.apps.com.rest.model.AttendanceSummary;
import nbs.apps.com.service.IAttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/attendances")
@CrossOrigin
public class AttendanceController {

    @Autowired
    private IAttendanceRepository attendanceRepository;

    @Autowired
    private IStudentRepository studentRepository;


    @Autowired
    private ITeacherRepository teacherRepository;

    @Autowired
    private IAttendanceService attendanceService;

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> save(@RequestBody Attendance attendance)
    {
        if(attendance != null)
        {
            if(attendance.getStudent() != null && attendance.getStudent().getId() != null)
            {
                Student student = studentRepository.findOne(attendance.getStudent().getId());
                if(student != null)
                {
                    attendance.setStudent(student);
                }
            }
            if(attendance.getTeacher() != null && attendance.getTeacher().getId() != null)
            {
                Teacher teacher = teacherRepository.findOne(attendance.getTeacher().getId());
                if(teacher != null)
                {
                    attendance.setTeacher(teacher);
                }
            }
            return new ResponseEntity(attendanceRepository.save(attendance), HttpStatus.CREATED);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @RequestMapping(method = RequestMethod.GET,value = "/findByStudent/{stdId}")
    public List<Attendance> findByStudentId(@PathVariable("stdId") Long stdId)
    {
        List<Attendance> attendanceList = attendanceRepository.findByStudentId(stdId);
        return attendanceList;
    }

    /*@RequestMapping(method = RequestMethod.GET, value = "/findBySchool/{className}")
    public List<Attendance> findByClassId(@PathVariable("className") String className)
    {

        List<Attendance> attendanceList = attendanceRepository.findByStudentSchoolClassName(className);
        return attendanceList;
    }*/

    @RequestMapping(method = RequestMethod.GET)
    public List<Attendance> findAll()
    {
        return (List<Attendance>) attendanceRepository.findAll();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/summaryByStudent/{stdId}")
    public ResponseEntity<?> getAttendanceSummaryByStudent(@RequestParam(value = "fromDate",required = false) String fromDate,
                                                           @RequestParam(value = "toDate",required = false) String toDate, @PathVariable("stdId") Long studentId)
    {
            if(studentId != null && studentId >0)
            {
                AttendanceSummary summary = attendanceService.getAttendanceSummaryByStudent(fromDate, toDate, studentId);
                return new ResponseEntity<>(summary,HttpStatus.OK);
            }
            return ResponseEntity.badRequest().body(null);
    }
}
