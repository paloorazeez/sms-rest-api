package nbs.apps.com.model;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import nbs.apps.com.util.DateDeSerializer;
import nbs.apps.com.util.DateSerializer;
import nbs.apps.com.util.TimeDeSerializer;
import nbs.apps.com.util.TimeSerializer;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@Table(name = "attendance")
public class Attendance implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "student_id")
    private Student student;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "teacher_id")
    private Teacher teacher;

    @Temporal(TemporalType.DATE)
    @Column(name = "date")
    @JsonSerialize(using = DateSerializer.class)
    @JsonDeserialize(using = DateDeSerializer.class)
    private Date date;

    @Temporal(TemporalType.TIME)
    @Column(name = "time_from")
    @JsonSerialize(using = TimeSerializer.class)
    @JsonDeserialize(using = TimeDeSerializer.class)
    private Date timeFrom;

    @Temporal(TemporalType.TIME)
    @Column(name = "time_to")
    @JsonSerialize(using = TimeSerializer.class)
    @JsonDeserialize(using = TimeDeSerializer.class)
    private Date timeTo;

    @Column(name = "present")
    private boolean present;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getTimeFrom() {
        return timeFrom;
    }

    public void setTimeFrom(Date timeFrom) {
        this.timeFrom = timeFrom;
    }

    public Date getTimeTo() {
        return timeTo;
    }

    public void setTimeTo(Date timeTo) {
        this.timeTo = timeTo;
    }

    public boolean isPresent() {
        return present;
    }

    public void setPresent(boolean present) {
        this.present = present;
    }
}
