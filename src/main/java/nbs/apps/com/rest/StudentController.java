package nbs.apps.com.rest;

import nbs.apps.com.model.Student;
import nbs.apps.com.repository.IStudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/students")
public class StudentController {

    @Autowired
    IStudentRepository studentRepository;
    @RequestMapping( method = RequestMethod.GET)
    public List<Student> findAll()
    {
        return (List<Student>) studentRepository.findAll();
    }

    @CrossOrigin
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public ResponseEntity<Student> findById(@PathVariable("id") Long id)
    {
        Student student = studentRepository.findOne(id);
        if(student == null)
        {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(student);
    }

    @CrossOrigin
    @RequestMapping( method = RequestMethod.POST)
    public ResponseEntity<?> save(@RequestBody Student student)
    {
        return new ResponseEntity(studentRepository.save(student), HttpStatus.CREATED);
    }

    @CrossOrigin
    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    public ResponseEntity delete(@PathVariable("id") Long id)
    {
        try
        {
            studentRepository.delete(id);
        }catch (EmptyResultDataAccessException e)
        {
            return ResponseEntity.notFound().build();
        }
        return new ResponseEntity(HttpStatus.OK);
    }

    @CrossOrigin
    @RequestMapping( method = RequestMethod.GET,value = "/findBySchool/{schoolId}")
    public ResponseEntity<List<Student>> findStudentsBySchool(@PathVariable("schoolId") Long schoolId)
    {
        List<Student> students = (List<Student>) studentRepository.findBySchoolClassClassTeacherSchoolId(schoolId);
        if(students == null || students.size() <1)
        {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(students);
    }

    @CrossOrigin
    @RequestMapping( method = RequestMethod.GET,value = "/findByClass/{classId}")
    public ResponseEntity<List<Student>> findStudentsByClass(@PathVariable("classId") Long classId)
    {
        List<Student> students = (List<Student>) studentRepository.findBySchoolClassId(classId);
        if(students == null || students.size() <1)
        {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(students);
    }

}
