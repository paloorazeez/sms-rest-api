package nbs.apps.com.rest;

import nbs.apps.com.model.*;
import nbs.apps.com.repository.IFeedbackRepository;
import nbs.apps.com.repository.IStudentRepository;
import nbs.apps.com.repository.ITeacherRepository;
import nbs.apps.com.repository.IUserRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/api/feedbacks")
public class FeedbackController {

    @Autowired
    private IFeedbackRepository feedbackRepository;

    @Autowired
    private IStudentRepository studentRepository;

    @Autowired
    private ITeacherRepository teacherRepository;

    @Autowired
    private IUserRepository userRepository;

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> save(@RequestBody Feedback feedback)
    {
        if(feedback.getStudent() != null && feedback.getStudent().getId()!= null)
        {
            Student student = studentRepository.findOne(feedback.getStudent().getId());
            if(student != null)
                feedback.setStudent(student);
        }

        if(feedback.getTeacher() != null && feedback.getTeacher().getId() != null)
        {

            Teacher teacher = teacherRepository.findOne(feedback.getTeacher().getId());
            if(teacher != null)
                feedback.setTeacher(teacher);
        }
        if(feedback.getFeedbackReplyList() != null && feedback.getFeedbackReplyList().size() >0)
        {
            for(FeedbackReply reply : feedback.getFeedbackReplyList())
            {
                reply.setFeedback(feedback);
                if(reply.getUser() != null && reply.getUser().getId() != null )
                {
                    UserDetail user = userRepository.findOne(reply.getUser().getId());
                    if(user != null)
                    {
                        reply.setUser(user);
                    }
                }

            }
        }
        return new ResponseEntity<>(feedbackRepository.save(feedback), HttpStatus.CREATED);
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Feedback> findAll()
    {
        List<Feedback> list = (List<Feedback>) feedbackRepository.findAll();
        return  list;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public ResponseEntity<Feedback> findById(@PathVariable("id") Long id)
    {
        Feedback feedback = feedbackRepository.findOne(id);
        if(feedback == null)
        {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(feedback);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/findByStudent/{stdId}")
    public List<Feedback> findByStudentId(@PathVariable("stdId") Long stdId)
    {
        List<Feedback> feedbackList = feedbackRepository.findByStudentId(stdId);
        if(feedbackList != null && feedbackList.size() >0)
        {
            for(Feedback feedback : feedbackList)
            {
                if(feedback.getFeedbackReplyList() != null && feedback.getFeedbackReplyList().size()>0)
                {
                    for(FeedbackReply reply : feedback.getFeedbackReplyList())
                    {
                        UserDetail user = reply.getUser();
                        if(user != null && !StringUtils.isEmpty(user.getUserType()))
                        {
                            if(UserController.USERTYPE_STUDENT.equals(user.getUserType()))
                            {
                                Student student = studentRepository.findOne(user.getLinkId());
                                if(student != null)
                                user.setUsername(student.getName());
                            }
                            else if(UserController.USERTYPE_TEACHER.equals(user.getUserType()))
                            {
                                Teacher teacher = teacherRepository.findOne(user.getLinkId());
                                if(teacher != null)
                                user.setUsername(teacher.getName());
                            }
                        }
                    }
                }
            }
        }
        return feedbackList;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/findByTeacher/{teacherId}")
    public List<Feedback> findByTeacherId(@PathVariable("teacherId") Long teacherId)
    {
        List<Feedback> feedbackList = feedbackRepository.findByTeacherId(teacherId);
        if(feedbackList != null && feedbackList.size() >0)
        {
            for(Feedback feedback : feedbackList)
            {
                if(feedback.getFeedbackReplyList() != null && feedback.getFeedbackReplyList().size()>0)
                {
                    for(FeedbackReply reply : feedback.getFeedbackReplyList())
                    {
                        UserDetail user = reply.getUser();
                        if(user != null && !StringUtils.isEmpty(user.getUserType()))
                        {
                            if(UserController.USERTYPE_STUDENT.equals(user.getUserType()))
                            {
                                Student student = studentRepository.findOne(user.getLinkId());
                                if(student != null)
                                    user.setUsername(student.getName());
                            }
                            else if(UserController.USERTYPE_TEACHER.equals(user.getUserType()))
                            {
                                Teacher teacher = teacherRepository.findOne(user.getLinkId());
                                if(teacher != null)
                                    user.setUsername(teacher.getName());
                            }
                        }
                    }
                }
            }
        }
        return feedbackList;
    }
}
