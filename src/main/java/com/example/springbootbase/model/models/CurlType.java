package com.example.springbootbase.model.models;

public enum CurlType {

    HTTP("HTTP",0),

    TCP_REFUSE("TCP_REFUSE",1),

    TCP_TIMEOUT("TCP_TIMEOUT",2);

    private String name;
    private int index;

    public Integer getIndex() {
        return index;
    }
    public String getName(){
        return name;
    }

    CurlType(String name, int index){
        this.name = name;
        this.index = index;
    }
}
