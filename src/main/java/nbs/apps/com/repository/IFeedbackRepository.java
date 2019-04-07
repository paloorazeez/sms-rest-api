package nbs.apps.com.repository;

import nbs.apps.com.model.Feedback;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface IFeedbackRepository extends CrudRepository<Feedback, Long> {

    List<Feedback> findByStudentId(Long id);

    List<Feedback> findByTeacherId(Long teacherId);
}
