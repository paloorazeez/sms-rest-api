package nbs.apps.com.repository;

import nbs.apps.com.model.Subject;
import org.springframework.data.repository.CrudRepository;

public interface ISubjectRepository extends CrudRepository<Subject,Long> {
}
