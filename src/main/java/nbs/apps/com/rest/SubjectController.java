package nbs.apps.com.rest;

import nbs.apps.com.model.SchoolClass;
import nbs.apps.com.model.Subject;
import nbs.apps.com.repository.ISubjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/subjects")
public class SubjectController {

    @Autowired
    ISubjectRepository subjectRepository;

    @RequestMapping( method = RequestMethod.GET)
    public ResponseEntity<?> findAll()
    {
        List<Subject> subjectList = (List<Subject>) subjectRepository.findAll();
        if(subjectList == null || subjectList.size() <1)
        {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(subjectList);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public ResponseEntity<?> findById(@PathVariable("id") Long id)
    {
        Subject subject = subjectRepository.findOne(id);
        if(subject == null)
        {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(subject);
    }

    @RequestMapping( method = RequestMethod.POST)
    public ResponseEntity<?> save(@RequestBody Subject subject)
    {
        return new ResponseEntity<>(subjectRepository.save(subject), HttpStatus.CREATED);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    public ResponseEntity delete(@PathVariable("id") Long id)
    {
        try
        {
            subjectRepository.delete(id);
        }catch (EmptyResultDataAccessException e)
        {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().build();
    }
}
