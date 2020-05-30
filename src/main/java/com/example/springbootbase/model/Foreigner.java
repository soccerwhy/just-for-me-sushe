package com.example.springbootbase.model;

import lombok.Data;

@Data
public class Foreigner {
    private Integer foreignid;
    private String name;
    private String job;
    private String sushenumber;

    public Integer getForeignid() {
        return foreignid;
    }

    public void setForeignid(Integer foreignid) {
        this.foreignid = foreignid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getSushenumber() {
        return sushenumber;
    }

    public void setSushenumber(String sushenumber) {
        this.sushenumber = sushenumber;
    }

    public String getCometime() {
        return cometime;
    }

    public void setCometime(String cometime) {
        this.cometime = cometime;
    }

    public String getLefttime() {
        return lefttime;
    }

    public void setLefttime(String lefttime) {
        this.lefttime = lefttime;
    }

    private String cometime;
    private String lefttime;
}
