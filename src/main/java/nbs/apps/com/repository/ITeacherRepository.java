package nbs.apps.com.repository;

import nbs.apps.com.model.Teacher;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ITeacherRepository extends CrudRepository<Teacher,Long> {

    List<Teacher> findBySchoolId(Long shoolId);
}
