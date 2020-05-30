package com.example.springbootbase.model;

import lombok.Data;

@Data
public class ActivityApply {

    private Integer id;

    private String username;

    private String teamname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTeamname() {
        return teamname;
    }

    public void setTeamname(String teamname) {
        this.teamname = teamname;
    }

    public String getTeamlocation() {
        return teamlocation;
    }

    public void setTeamlocation(String teamlocation) {
        this.teamlocation = teamlocation;
    }

    public Integer getTeamnumber() {
        return teamnumber;
    }

    public void setTeamnumber(Integer teamnumber) {
        this.teamnumber = teamnumber;
    }

    public String getActivityname() {
        return activityname;
    }

    public void setActivityname(String activityname) {
        this.activityname = activityname;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    private String teamlocation;

    private Integer teamnumber;

    private String activityname;

    private String result;

    private String reason;

}
