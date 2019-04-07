package nbs.apps.com.rest.model;

import java.io.Serializable;

public class SubjectUIModel implements Serializable {
    public SubjectUIModel() {
    }

    private Long id;

    private String name;

    private Long teacherId;

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

    public Long getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Long teacherId) {
        this.teacherId = teacherId;
    }
}
