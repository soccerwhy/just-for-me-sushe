package com.example.springbootbase.model;

import lombok.Data;

@Data
public class SushePersonRel {
    private Integer sushepersonid;

    public Integer getSushepersonid() {
        return sushepersonid;
    }

    public void setSushepersonid(Integer sushepersonid) {
        this.sushepersonid = sushepersonid;
    }

    public Integer getPersonid() {
        return personid;
    }

    public void setPersonid(Integer personid) {
        this.personid = personid;
    }

    public Integer getSusheid() {
        return susheid;
    }

    public void setSusheid(Integer susheid) {
        this.susheid = susheid;
    }

    private Integer personid;
    private Integer susheid;
}
