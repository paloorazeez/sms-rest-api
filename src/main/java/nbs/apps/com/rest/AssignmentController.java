package nbs.apps.com.rest;

import nbs.apps.com.model.Assignment;
import nbs.apps.com.model.Subject;
import nbs.apps.com.repository.IAssignmentRepository;
import nbs.apps.com.repository.ISubjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/assignments")
public class AssignmentController {

    @Autowired
    private IAssignmentRepository assignmentRepository;

    @Autowired
    private ISubjectRepository subjectRepository;

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> save(@RequestBody Assignment assignment)
    {
        if(assignment != null)
        {
            if(assignment.getSubject() != null && assignment.getSubject().getId() != null)
            {
                Subject subject = subjectRepository.findOne(assignment.getSubject().getId());
                if(subject != null)
                {
                    assignment.setSubject(subject);
                }
                return new ResponseEntity<>(assignmentRepository.save(assignment), HttpStatus.CREATED);
            }
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Assignment> findAll()
    {
        return (List<Assignment>) assignmentRepository.findAll();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public ResponseEntity<Assignment> findById(@PathVariable("id") Long id)
    {
        Assignment assignment = assignmentRepository.findOne(id);
        if(assignment == null)
        {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(assignment,HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/findByClass/{classId}")
    public List<Assignment> findByClass(@PathVariable Long classId)
    {
       return assignmentRepository.findBySubjectSchoolClassId(classId);
    }
}
