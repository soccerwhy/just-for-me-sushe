package com.example.springbootbase.learn;

/**
 * @author Mr Tang
 *
 */
public class DVDInfoData {
    private String dvdnum;
    private String dvdname;
    private String dvdstate;
    private String dvdtype;
    private String dvdphoto;
    /**
     *
     */

    public DVDInfoData() {
        super();
    }
    /**
     * @param dvdnum
     * @param dvdname
     * @param dvdstate
     * @param dvdtype
     * @param dvdphoto
     */
    public DVDInfoData(String dvdnum, String dvdname, String dvdstate, String dvdtype, String dvdphoto) {
        super();
        this.dvdnum = dvdnum;
        this.dvdname = dvdname;
        this.dvdstate = dvdstate;
        this.dvdtype = dvdtype;
        this.dvdphoto = dvdphoto;
    }
}