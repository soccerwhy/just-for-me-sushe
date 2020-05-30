package com.example.springbootbase.model;

import lombok.Data;

@Data
public class LateApply {
    private Integer applyid;
    private  Integer personid;
    private String personname;
    private String persongrade;
    private String personmajor;

    public Integer getApplyid() {
        return applyid;
    }

    public void setApplyid(Integer applyid) {
        this.applyid = applyid;
    }

    public Integer getPersonid() {
        return personid;
    }

    public void setPersonid(Integer personid) {
        this.personid = personid;
    }

    public String getPersonname() {
        return personname;
    }

    public void setPersonname(String personname) {
        this.personname = personname;
    }

    public String getPersongrade() {
        return persongrade;
    }

    public void setPersongrade(String persongrade) {
        this.persongrade = persongrade;
    }

    public String getPersonmajor() {
        return personmajor;
    }

    public void setPersonmajor(String personmajor) {
        this.personmajor = personmajor;
    }

    public String getApplycontent() {
        return applycontent;
    }

    public void setApplycontent(String applycontent) {
        this.applycontent = applycontent;
    }

    public String getApplyresult() {
        return applyresult;
    }

    public void setApplyresult(String applyresult) {
        this.applyresult = applyresult;
    }

    public String getApplyreason() {
        return applyreason;
    }

    public void setApplyreason(String applyreason) {
        this.applyreason = applyreason;
    }

    private String applycontent;
    private String applyresult;
    private String applyreason;
}
