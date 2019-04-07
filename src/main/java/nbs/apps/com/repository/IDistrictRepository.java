package nbs.apps.com.repository;

import nbs.apps.com.model.District;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface IDistrictRepository extends CrudRepository<District,Long> {

    List<District> findByStateName(String stateName);
}
