package nbs.apps.com.repository;

import nbs.apps.com.model.Event;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface IEventRepository extends CrudRepository<Event,Long> {
    List<Event> findBySchoolIdOrderByIdDesc(Long id);
}
