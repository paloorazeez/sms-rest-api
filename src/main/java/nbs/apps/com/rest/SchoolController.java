package nbs.apps.com.rest;

import nbs.apps.com.model.School;
import nbs.apps.com.model.UserDetail;
import nbs.apps.com.repository.ISchoolRepository;
import nbs.apps.com.repository.IUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/schools")
public class SchoolController {

    @Autowired
    ISchoolRepository schoolRepository;
    @Autowired
    IUserRepository userRepository;

    @RequestMapping( method = RequestMethod.GET)
    public List<School> findAll()
    {
        return (List<School>) schoolRepository.findAll();
    }

    @RequestMapping(value = "/findByUsername/{username}",method = RequestMethod.GET)
    public ResponseEntity<School> findByUserName(@PathVariable("username") String username)
    {
        UserDetail user = userRepository.findByUsername(username);
        School school = schoolRepository.findOne(user.getSchoolId());
        if(school == null)
        {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().header("Access-Control-Allow-Origin","*").body(school);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public ResponseEntity<School> findById(@PathVariable("id") Long id)
    {
        School school = schoolRepository.findOne(id);
        if(school == null)
        {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().header("Access-Control-Allow-Origin","*").body(school);
    }

    @CrossOrigin
    @RequestMapping( method = RequestMethod.POST)
    public ResponseEntity<School> save(@RequestBody School school)
    {
        School oldSchool = null;
        if(school.getId() != null && school.getId() >0)
        {
            oldSchool = schoolRepository.findOne(school.getId());
        }
        if(oldSchool != null)
        {
            school.setTeachers(oldSchool.getTeachers());

        }
        school = schoolRepository.save(school);
        HttpHeaders headers = new HttpHeaders();
        return ResponseEntity.ok().headers(headers).body(school);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    public ResponseEntity delete(@PathVariable("id") Long id)
    {
        try
        {
            schoolRepository.delete(id);
        }catch (EmptyResultDataAccessException e)
        {
            return ResponseEntity.notFound().build();
        }
        return new ResponseEntity(HttpStatus.OK);
    }


}
