package com.example.springbootbase.model;

import lombok.Data;

@Data
public class BBS {

    private Integer susheid;

    private String bbstitle;

    public Integer getSusheid() {
        return susheid;
    }

    public void setSusheid(Integer susheid) {
        this.susheid = susheid;
    }

    public String getBbstitle() {
        return bbstitle;
    }

    public void setBbstitle(String bbstitle) {
        this.bbstitle = bbstitle;
    }

    public String getBbscontent() {
        return bbscontent;
    }

    public void setBbscontent(String bbscontent) {
        this.bbscontent = bbscontent;
    }

    private String bbscontent;

}
