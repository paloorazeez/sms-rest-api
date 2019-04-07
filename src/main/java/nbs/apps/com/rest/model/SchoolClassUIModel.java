package nbs.apps.com.rest.model;

import java.io.Serializable;
import java.util.List;

public class SchoolClassUIModel implements Serializable {
    public SchoolClassUIModel() {
    }

    private Long classId;

    private String className;

    private Long classTeacherId;

    public Long getClassTeacherId() {
        return classTeacherId;
    }

    public void setClassTeacherId(Long classTeacherId) {
        this.classTeacherId = classTeacherId;
    }

    private List<SubjectUIModel> subjectList;

    public Long getClassId() {
        return classId;
    }

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }



    public List<SubjectUIModel> getSubjectList() {
        return subjectList;
    }

    public void setSubjectList(List<SubjectUIModel> subjectList) {
        this.subjectList = subjectList;
    }
}
