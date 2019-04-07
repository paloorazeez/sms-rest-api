package nbs.apps.com.rest;

import nbs.apps.com.model.Parent;
import nbs.apps.com.repository.IParentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/parents")
public class ParentController {

    @Autowired
    IParentRepository parentRepository;
    @RequestMapping( method = RequestMethod.GET)
    public List<Parent> findAll()
    {
        return (List<Parent>) parentRepository.findAll();
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public ResponseEntity<Parent> findById(@PathVariable("id") Long id)
    {
        Parent parent = parentRepository.findOne(id);
        if(parent == null)
        {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(parent);
    }

    @RequestMapping( method = RequestMethod.POST)
    public ResponseEntity<?> save(@RequestBody Parent parent)
    {
        return new ResponseEntity(parentRepository.save(parent), HttpStatus.CREATED);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    public ResponseEntity delete(@PathVariable("id") Long id)
    {
        try
        {
            parentRepository.delete(id);
        }catch (EmptyResultDataAccessException e)
        {
            return ResponseEntity.notFound().build();
        }
        return new ResponseEntity(HttpStatus.OK);
    }


}
