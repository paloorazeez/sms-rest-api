package nbs.apps.com.repository;

import nbs.apps.com.model.FeedbackReply;
import org.springframework.data.repository.CrudRepository;

public interface IFeedbackReplyRepository extends CrudRepository<FeedbackReply,Long> {
}
