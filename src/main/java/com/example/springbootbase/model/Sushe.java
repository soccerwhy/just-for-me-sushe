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

    public Integer getSusheid() {
        return susheid;
    }

    public void setSusheid(Integer susheid) {
        this.susheid = susheid;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getClean() {
        return clean;
    }

    public void setClean(String clean) {
        this.clean = clean;
    }

    public String getGuaranteecontent() {
        return guaranteecontent;
    }

    public void setGuaranteecontent(String guaranteecontent) {
        this.guaranteecontent = guaranteecontent;
    }

    public Timestamp getTimestamp_name() {
        return timestamp_name;
    }

    public void setTimestamp_name(Timestamp timestamp_name) {
        this.timestamp_name = timestamp_name;
    }

    private String clean;
    private String guaranteecontent;
    private Timestamp timestamp_name;
}
