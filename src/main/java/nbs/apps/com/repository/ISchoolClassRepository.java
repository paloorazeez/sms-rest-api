package nbs.apps.com.repository;

import nbs.apps.com.model.SchoolClass;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ISchoolClassRepository extends CrudRepository<SchoolClass, Long> {
    List<SchoolClass> findByClassTeacherSchoolId(Long schoolId);
}
