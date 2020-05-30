package com.example.springbootbase.model;

import lombok.Data;

@Data
public class VolunteerAndAdmin {
    public Integer getPersonid() {
        return personid;
    }

    public void setPersonid(Integer personid) {
        this.personid = personid;
    }

    private Integer personid;
}
