package nbs.apps.com.rest;

import nbs.apps.com.model.School;
import nbs.apps.com.model.Teacher;
import nbs.apps.com.repository.ISchoolRepository;
import nbs.apps.com.repository.ITeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/api/teachers")
public class TeacherController {

    @Autowired
    ITeacherRepository teacherRepository;

    @RequestMapping( method = RequestMethod.GET)
    public ResponseEntity<List<Teacher>> findAll()
    {
        List<Teacher> teachers = (List<Teacher>) teacherRepository.findAll();
        if(teachers == null || teachers.size() <1)
        {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(teachers);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public ResponseEntity<Teacher> findById(@PathVariable("id") Long id)
    {
        Teacher teacher = teacherRepository.findOne(id);
        if(teacher == null)
        {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(teacher);
    }

    @RequestMapping( method = RequestMethod.POST)
    public ResponseEntity<?> save(@RequestBody Teacher teacher)
    {
        Teacher existingTeacher = null;
        if(teacher.getId() != null && teacher.getId() != 0)
        {
            existingTeacher = teacherRepository.findOne(teacher.getId());
        }

        if(existingTeacher != null)
        {
            if(existingTeacher.getSchoolClassList() != null)
            {
                teacher.setSchoolClassList(existingTeacher.getSchoolClassList());
            }
            if(existingTeacher.getSubjectList() != null)
            {
                teacher.setSubjectList(existingTeacher.getSubjectList());
            }
        }
        return new ResponseEntity<>(teacherRepository.save(teacher), HttpStatus.CREATED);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    public ResponseEntity delete(@PathVariable("id") Long id)
    {
        try
        {
            teacherRepository.delete(id);
        }catch (EmptyResultDataAccessException e)
        {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().build();
    }

    @RequestMapping( method = RequestMethod.GET,value = "/findBySchool/{schoolId}")
    public ResponseEntity<List<Teacher>> findTeachersBySchool(@PathVariable("schoolId") Long schoolId)
    {
        List<Teacher> teachers = (List<Teacher>) teacherRepository.findBySchoolId(schoolId);
        if(teachers == null || teachers.size() <1)
        {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(teachers);
    }
}
