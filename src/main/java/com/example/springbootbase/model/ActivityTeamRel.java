package com.example.springbootbase.model;


import lombok.Data;

@Data
public class ActivityTeamRel {

    private Integer activityteamid;

    private Integer activityid;

    public Integer getActivityteamid() {
        return activityteamid;
    }

    public void setActivityteamid(Integer activityteamid) {
        this.activityteamid = activityteamid;
    }

    public Integer getActivityid() {
        return activityid;
    }

    public void setActivityid(Integer activityid) {
        this.activityid = activityid;
    }

    public Integer getTeamid() {
        return teamid;
    }

    public void setTeamid(Integer teamid) {
        this.teamid = teamid;
    }

    private Integer teamid;

}
