package nbs.apps.com.repository;

import nbs.apps.com.model.Parent;
import org.springframework.data.repository.CrudRepository;

public interface IParentRepository extends CrudRepository<Parent, Long> {
}
