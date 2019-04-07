package nbs.apps.com.rest.model;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import nbs.apps.com.util.DateDeSerializer;
import nbs.apps.com.util.DateSerializer;
import nbs.apps.com.util.JsonDateSerializer;

import java.io.Serializable;
import java.util.Date;

public class AttendanceSummary implements Serializable {

    @JsonSerialize(using = DateSerializer.class)
    @JsonDeserialize(using = DateDeSerializer.class)
    private Date fromDate;

    @JsonSerialize(using = DateSerializer.class)
    @JsonDeserialize(using = DateDeSerializer.class)
    private Date toDate;

    private Double totalDays;

    private Double presentDays;

    private Double abscentDays;

    public AttendanceSummary() {
    }

    public AttendanceSummary(Date fromDate, Date toDate, Double totalDays, Double presentDays, Double abscentDays) {
        this.fromDate = fromDate;
        this.toDate = toDate;
        this.totalDays = totalDays;
        this.presentDays = presentDays;
        this.abscentDays = abscentDays;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    public Double getTotalDays() {
        return totalDays;
    }

    public void setTotalDays(Double totalDays) {
        this.totalDays = totalDays;
    }

    public Double getPresentDays() {
        return presentDays;
    }

    public void setPresentDays(Double presentDays) {
        this.presentDays = presentDays;
    }

    public Double getAbscentDays() {
        return abscentDays;
    }

    public void setAbscentDays(Double abscentDays) {
        this.abscentDays = abscentDays;
    }
}
