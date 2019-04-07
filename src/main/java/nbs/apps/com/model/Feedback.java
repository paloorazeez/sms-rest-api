package nbs.apps.com.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import nbs.apps.com.util.JsonDateDeSerializer;
import nbs.apps.com.util.JsonDateSerializer;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


@Entity
@Table(name = "feedback")
public class Feedback implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "description")
    private String description;

    @Column(name = "message")
    private String message;

    @Basic(optional = false)
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_date", insertable = false, updatable = false)
    @JsonDeserialize(using = JsonDateDeSerializer.class)
    @JsonSerialize(using = JsonDateSerializer.class)
    private Date createdDate;

    @Column(name = "is_active")
    private boolean active;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "student_id")
    @JsonIgnoreProperties("feedbackList")
    private Student student;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "teacher_id")
    @JsonIgnoreProperties("feedbackList")
    private Teacher teacher;

    @OneToMany(mappedBy = "feedback", cascade = CascadeType.ALL)
    private List<FeedbackReply> feedbackReplyList;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public List<FeedbackReply> getFeedbackReplyList() {
        return feedbackReplyList;
    }

    public void setFeedbackReplyList(List<FeedbackReply> feedbackReplyList) {
        this.feedbackReplyList = feedbackReplyList;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", message='" + message + '\'' +
                ", createdDate=" + createdDate +
                ", active=" + active +
                ", student=" + student +
                ", teacher=" + teacher +
                ", feedbackReplyList=" + feedbackReplyList +
                '}';
    }
}
