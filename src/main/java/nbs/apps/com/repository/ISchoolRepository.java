package nbs.apps.com.repository;
import nbs.apps.com.model.School;
import org.springframework.data.repository.CrudRepository;

import org.springframework.stereotype.Repository;

//@RestResource(path = "/schools")
@Repository
public interface ISchoolRepository extends CrudRepository<School,Long> {
}
