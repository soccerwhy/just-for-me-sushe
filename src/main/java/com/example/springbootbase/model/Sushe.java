package com.example.springbootbase.model;

import lombok.Data;

import java.sql.Timestamp;

/**
 * 宿舍
 */
@Data
public class Sushe {
    private Integer susheid;
    private String number;
    private String location;
    private String clean;
    private String guaranteecontent;
    private Timestamp timestamp_name;
}
