package com.example.springbootbase.model;

import lombok.Data;

@Data
public class PersonTeamRel {

    private Integer personteamid;

    private Integer personid;

    private Integer teamid;
}
