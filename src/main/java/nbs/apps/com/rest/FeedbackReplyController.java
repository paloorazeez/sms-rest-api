package nbs.apps.com.rest;

import nbs.apps.com.model.Feedback;
import nbs.apps.com.model.FeedbackReply;
import nbs.apps.com.repository.IFeedbackReplyRepository;
import nbs.apps.com.repository.IFeedbackRepository;
import nbs.apps.com.repository.IUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/feedbacks/replys")
public class FeedbackReplyController {

    @Autowired
    private IFeedbackReplyRepository replyRepository;

    @Autowired
    private  IFeedbackRepository feedbackRepository;

    @Autowired
    private IUserRepository userRepository;

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> save(@RequestBody FeedbackReply reply)
    {
        if(reply != null)
        {
            if(reply.getFeedback()!= null)
            {
                Feedback feedback = feedbackRepository.findOne(reply.getFeedback().getId());
                System.out.println(feedback);
            }
        }
        return ResponseEntity.noContent().build();
    }
}
