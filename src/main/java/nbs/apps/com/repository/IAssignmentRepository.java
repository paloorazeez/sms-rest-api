package nbs.apps.com.repository;

import nbs.apps.com.model.Assignment;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface IAssignmentRepository extends CrudRepository<Assignment,Long> {

    List<Assignment> findBySubjectSchoolClassId(Long id);
}
