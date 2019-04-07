package nbs.apps.com.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import nbs.apps.com.enums.Sex;
import nbs.apps.com.util.DateDeSerializer;
import nbs.apps.com.util.DateSerializer;
import nbs.apps.com.util.JsonDateDeSerializer;
import nbs.apps.com.util.JsonDateSerializer;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "student")
public class Student implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private  Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "roll_number")
    private String rollNumber;

    @Column(name = "age")
    private Integer age;

    @Enumerated(EnumType.STRING)
    private Sex sex;

    @JsonDeserialize(using = DateDeSerializer.class)
    @JsonSerialize(using = DateSerializer.class)
    private Date dob;

    @Column(name = "address")
    private String address;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "email")
    private String email;

    @Column(name = "is_active")
    private boolean active;

    @Basic(optional = false)
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_date", insertable = false, updatable = false)
    @JsonDeserialize(using = JsonDateDeSerializer.class)
    @JsonSerialize(using = JsonDateSerializer.class)
    private Date createdDate;


    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "parent1_id")
    @JsonIgnoreProperties("parent1StudentList")
    private Parent parent1;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "parent2_id")
    @JsonIgnoreProperties("parent2StudentList")
    private Parent parent2;

    @ManyToOne
    @JoinColumn(name = "school_class_id")
    @JsonIgnoreProperties("studentsList")
    private SchoolClass schoolClass;

    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL)
    //@JsonIgnoreProperties("student")
    @JsonIgnore
    private List<Feedback> feedbackList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Sex getSex() {
        return sex;
    }

    public void setSex(Sex sex) {
        this.sex = sex;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public Parent getParent1() {
        return parent1;
    }

    public void setParent1(Parent parent1) {
        this.parent1 = parent1;
    }

    public Parent getParent2() {
        return parent2;
    }

    public void setParent2(Parent parent2) {
        this.parent2 = parent2;
    }

    public SchoolClass getSchoolClass() {
        return schoolClass;
    }

    public void setSchoolClass(SchoolClass schoolClass) {
        this.schoolClass = schoolClass;
    }

    public List<Feedback> getFeedbackList() {
        return feedbackList;
    }

    public void setFeedbackList(List<Feedback> feedbackList) {
        this.feedbackList = feedbackList;
    }
}
