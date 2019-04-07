package nbs.apps.com.repository;

import nbs.apps.com.model.Attendance;
import org.springframework.data.repository.CrudRepository;
import org.springframework.http.ResponseEntity;

import java.util.Date;
import java.util.List;

public interface IAttendanceRepository extends CrudRepository<Attendance,Long> {
    List<Attendance> findByStudentSchoolClassName(String className);

    List<Attendance> findByStudentId(Long stdId);

    List<Attendance> findByStudentIdAndDateBetween(Long stdId, Date startDate, Date endDate);

    List<Attendance> findByStudentIdAndDateGreaterThanEqual(Long stdId, Date startDate);

    List<Attendance> findByStudentIdAndDateLessThanEqual(Long stdId, Date endDate);

}
