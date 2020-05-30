package com.example.springbootbase.model;

import lombok.Data;

@Data
public class PersonTeamRel {

    private Integer personteamid;

    private Integer personid;

    public Integer getPersonteamid() {
        return personteamid;
    }

    public void setPersonteamid(Integer personteamid) {
        this.personteamid = personteamid;
    }

    public Integer getPersonid() {
        return personid;
    }

    public void setPersonid(Integer personid) {
        this.personid = personid;
    }

    public Integer getTeamid() {
        return teamid;
    }

    public void setTeamid(Integer teamid) {
        this.teamid = teamid;
    }

    private Integer teamid;
}
