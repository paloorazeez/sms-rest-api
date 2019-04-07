package nbs.apps.com.repository;

import nbs.apps.com.model.State;
import org.springframework.data.repository.CrudRepository;

public interface IStateRepository extends CrudRepository<State,Long> {
}
