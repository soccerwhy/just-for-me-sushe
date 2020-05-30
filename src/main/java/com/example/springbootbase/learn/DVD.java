package com.example.springbootbase.learn;

import lombok.Data;

@Data
public class DVD {

    String dvdnum;

    String dvdname;

    String dvdstate;

    public String getDvdnum() {
        return dvdnum;
    }

    public void setDvdnum(String dvdnum) {
        this.dvdnum = dvdnum;
    }

    public String getDvdname() {
        return dvdname;
    }

    public void setDvdname(String dvdname) {
        this.dvdname = dvdname;
    }

    public String getDvdstate() {
        return dvdstate;
    }

    public void setDvdstate(String dvdstate) {
        this.dvdstate = dvdstate;
    }

    public String getDvdtype() {
        return dvdtype;
    }

    public void setDvdtype(String dvdtype) {
        this.dvdtype = dvdtype;
    }

    public String getDvdphoto() {
        return dvdphoto;
    }

    public void setDvdphoto(String dvdphoto) {
        this.dvdphoto = dvdphoto;
    }

    String dvdtype;

    String dvdphoto;

}
