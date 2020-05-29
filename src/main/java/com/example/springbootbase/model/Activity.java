package com.example.springbootbase.model;

import lombok.Data;


@Data
public class Activity {
    private String activityid;
    private String name;
    private String location;
    private String time;
    private String content;
}
