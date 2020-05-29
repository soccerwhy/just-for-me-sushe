package com.example.springbootbase.model;

import lombok.Data;

@Data
public class TeamApply {
    private  Integer id;
    private  Integer personId;
    private  String personName;
    private  String personJob;
    private  Integer personAge;
    private  String personSex;
    private  Integer teamId;
    private  String teamName;
    private  String type;
    private  String result;
    private  String reason;

}
