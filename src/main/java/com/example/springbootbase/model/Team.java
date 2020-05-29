package com.example.springbootbase.model;

import lombok.Data;

@Data
public class Team {
    private String teamid;
    private String name;
    private String location;
    private Integer number;
    private String slogan;
}
