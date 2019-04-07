package nbs.apps.com.rest;

import nbs.apps.com.model.Parent;
import nbs.apps.com.model.State;
import nbs.apps.com.repository.IStateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/states")
public class StateController {
    @Autowired
    IStateRepository stateRepository;
    @RequestMapping( method = RequestMethod.GET)
    public ResponseEntity<?> findAll()
    {

        List<State> list = (List<State>) stateRepository.findAll();
        return ResponseEntity.ok().header("Access-Control-Allow-Origin","*").body(list);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public ResponseEntity<State> findById(@PathVariable("id") Long id)
    {
        State state = stateRepository.findOne(id);
        if(state == null)
        {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(state);
    }

    @RequestMapping( method = RequestMethod.POST)
    public ResponseEntity<?> save(@RequestBody State state)
    {
        return new ResponseEntity(stateRepository.save(state), HttpStatus.CREATED);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    public ResponseEntity delete(@PathVariable("id") Long id)
    {
        try
        {
            stateRepository.delete(id);
        }catch (EmptyResultDataAccessException e)
        {
            return ResponseEntity.notFound().build();
        }
        return new ResponseEntity(HttpStatus.OK);
    }

}
