package nbs.apps.com.rest;

import nbs.apps.com.model.Student;
import nbs.apps.com.model.Teacher;
import nbs.apps.com.model.UserDetail;
import nbs.apps.com.repository.IStudentRepository;
import nbs.apps.com.repository.ITeacherRepository;
import nbs.apps.com.repository.IUserRepository;
import nbs.apps.com.rest.model.LoggedInUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {

    public static final String USERTYPE_TEACHER = "teacher";
    public static final String USERTYPE_STUDENT = "student";
    @Autowired
    private IUserRepository userRepository;

    @Autowired
    private IStudentRepository studentRepository;

    @Autowired
    private ITeacherRepository teacherRepository;

    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public UserController(IUserRepository userRepository,
                          BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userRepository = userRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @PostMapping("/sign-up")
    public void signUp(@RequestBody UserDetail userDetail) {
        userDetail.setPassword(bCryptPasswordEncoder.encode(userDetail.getPassword()));
        userRepository.save(userDetail);
    }

    @GetMapping("")
    public List<UserDetail> getUsers()
    {
        return  userRepository.findAll();
    }

    @RequestMapping(method = RequestMethod.GET,value = "/{username}")
    public ResponseEntity<?> findUserByUsername(@PathVariable("username") String username)
    {

        if(StringUtils.isEmpty(username))
        {
           return ResponseEntity.badRequest().build();
        }


        UserDetail userDetail = userRepository.findByUsername(username);
        if(userDetail == null)
        {
            return ResponseEntity.notFound().build();
        }
        LoggedInUser loggedInUser = new LoggedInUser();
        loggedInUser.setUsername(userDetail.getUsername());
        loggedInUser.setUserType(userDetail.getUserType());
        loggedInUser.setId(userDetail.getId());
        if(USERTYPE_STUDENT.equals(userDetail.getUserType()))
        {
            if(userDetail.getLinkId() != null && userDetail.getLinkId() >0)
            {
                Student student = studentRepository.findOne(userDetail.getLinkId());
                if(student != null)
                {
                    loggedInUser.setName(student.getName());
                    loggedInUser.setUserId(student.getId());
                    loggedInUser.setSchoolId(student.getSchoolClass().getClassTeacher().getSchool().getId());
                    loggedInUser.setClassId(student.getSchoolClass().getId());


                }
            }
            else {
                System.out.println("LinkId should not be null for user:"+username);
            }

        }
        else if(USERTYPE_TEACHER.equals(userDetail.getUserType()))
        {
            if(userDetail.getLinkId() != null && userDetail.getLinkId() >0)
            {
                Teacher teacher = teacherRepository.findOne(userDetail.getLinkId());
                if(teacher != null)
                {
                    loggedInUser.setName(teacher.getName());
                    loggedInUser.setUserId(teacher.getId());
                    loggedInUser.setSchoolId(teacher.getSchool().getId());
                }
            }
            else {
                System.out.println("LinkId should not be null for user:"+username);
            }
        }
        else {
            return ResponseEntity.notFound().build();
        }

        return new ResponseEntity<>(loggedInUser, HttpStatus.OK);
    }



}
