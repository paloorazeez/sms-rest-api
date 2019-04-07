package nbs.apps.com.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
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
@Table(name = "class")
public class SchoolClass implements Serializable {

    public SchoolClass()
    {

    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    private String name;

    @ManyToOne
    @JsonIgnoreProperties("schoolClassList")
    private Teacher classTeacher;

    @Column(name = "is_active")
    private boolean active;

    @Basic(optional = false)
    @Column(name = "created_date", insertable = false, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @JsonSerialize(using = JsonDateSerializer.class)
    @JsonDeserialize(using = JsonDateDeSerializer.class)
    private Date createdDate;

    @OneToMany(mappedBy = "schoolClass", cascade = CascadeType.ALL)
    //@JoinColumn(name = "school_class_id")
    private List<Subject> subjectList;

    @OneToMany(mappedBy = "schoolClass",cascade = CascadeType.ALL)
    //@JoinColumn(name = "school_class_id", referencedColumnName = "id")
    @JsonIgnoreProperties(value = {"schoolClass"}, allowSetters = true)
    private List<Student> studentsList;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Teacher getClassTeacher() {
        return classTeacher;
    }

    public void setClassTeacher(Teacher classTeacher) {
        this.classTeacher = classTeacher;
    }


    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Subject> getSubjectList() {
        return subjectList;
    }

    public void setSubjectList(List<Subject> subjectList) {
        this.subjectList = subjectList;
    }

    public List<Student> getStudentsList() {
        return studentsList;
    }

    public void setStudentsList(List<Student> studentsList) {
        this.studentsList = studentsList;
    }
}
