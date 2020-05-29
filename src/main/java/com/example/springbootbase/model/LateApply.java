package com.example.springbootbase.model;

import lombok.Data;

@Data
public class LateApply {
    private Integer applyid;
    private  Integer personid;
    private String personname;
    private String persongrade;
    private String personmajor;
    private String applycontent;
    private String applyresult;
    private String applyreason;
}
