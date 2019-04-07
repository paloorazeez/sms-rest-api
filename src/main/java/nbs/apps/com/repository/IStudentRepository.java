package nbs.apps.com.repository;

import nbs.apps.com.model.Student;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface IStudentRepository extends CrudRepository<Student, Long> {

    List<Student> findBySchoolClassClassTeacherSchoolId(Long schoolId);

    List<Student> findBySchoolClassId(Long classId);
}
