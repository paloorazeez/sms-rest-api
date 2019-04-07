package nbs.apps.com.rest;

import nbs.apps.com.model.District;
import nbs.apps.com.repository.IDistrictRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/districts")
public class DistrictController {
    @Autowired
    IDistrictRepository districtRepository;
    @RequestMapping( method = RequestMethod.GET)
    public List<District> findAll()
    {
        return (List<District>) districtRepository.findAll();
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public ResponseEntity<District> findById(@PathVariable("id") Long id)
    {
        District district = districtRepository.findOne(id);
        if(district == null)
        {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(district);
    }

    @RequestMapping(value = "/findByStateName/{stateName}",method = RequestMethod.GET)
    public ResponseEntity<?> findByStateName(@PathVariable(value = "stateName")String stateName)
    {
        List<District> districtList = districtRepository.findByStateName(stateName);
        if(districtList == null)
        {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().header("Access-Control-Allow-Origin","*").body(districtList);
    }

    @RequestMapping( method = RequestMethod.POST)
    public ResponseEntity<?> save(@RequestBody District district)
    {
        return new ResponseEntity(districtRepository.save(district), HttpStatus.CREATED);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    public ResponseEntity delete(@PathVariable("id") Long id)
    {
        try
        {
            districtRepository.delete(id);
        }catch (EmptyResultDataAccessException e)
        {
            return ResponseEntity.notFound().build();
        }
        return new ResponseEntity(HttpStatus.OK);
    }

}
