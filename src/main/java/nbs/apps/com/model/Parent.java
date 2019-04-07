package nbs.apps.com.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import nbs.apps.com.enums.Sex;
import nbs.apps.com.util.DateDeSerializer;
import nbs.apps.com.util.DateSerializer;
import nbs.apps.com.util.JsonDateDeSerializer;
import nbs.apps.com.util.JsonDateSerializer;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "parent")
public class Parent implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private Integer age;

    @JsonDeserialize(using = DateDeSerializer.class)
    @JsonSerialize(using = DateSerializer.class)
    private Date dob;

    @Enumerated(EnumType.STRING)
    private Sex sex;

    private String phoneNumber1;

    private String phoneNumber2;

    private String email;

    private String address;

    @Column(name = "is_active")
    private boolean active;

    @Basic(optional = false)
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_date",insertable = false,updatable = false)
    @JsonDeserialize(using = JsonDateDeSerializer.class)
    @JsonSerialize(using = JsonDateSerializer.class)
    private Date createdDate;

    @OneToMany(mappedBy = "parent1", cascade = CascadeType.ALL)
   // @JoinColumn(name = "parent1_id")
    @JsonIgnoreProperties("parent1")
    private List<Student> parent1StudentList;

    @OneToMany(cascade = CascadeType.ALL,mappedBy = "parent2")
    //@JoinColumn(name = "parent2_id")
    @JsonIgnoreProperties("parent2")
    private List<Student> parent2StudentList;

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

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Sex getSex() {
        return sex;
    }

    public void setSex(Sex sex) {
        this.sex = sex;
    }

    public String getPhoneNumber1() {
        return phoneNumber1;
    }

    public void setPhoneNumber1(String phoneNumber1) {
        this.phoneNumber1 = phoneNumber1;
    }

    public String getPhoneNumber2() {
        return phoneNumber2;
    }

    public void setPhoneNumber2(String phoneNumber2) {
        this.phoneNumber2 = phoneNumber2;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public List<Student> getParent1StudentList() {
        return parent1StudentList;
    }

    public void setParent1StudentList(List<Student> parent1StudentList) {
        this.parent1StudentList = parent1StudentList;
    }

    public List<Student> getParent2StudentList() {
        return parent2StudentList;
    }

    public void setParent2StudentList(List<Student> parent2StudentList) {
        this.parent2StudentList = parent2StudentList;
    }
}
