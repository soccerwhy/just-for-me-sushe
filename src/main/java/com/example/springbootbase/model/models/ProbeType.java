package com.example.springbootbase.model.models;

public enum ProbeType {

    CURL("CURL",0),

    TRACE_ROUTE("TRACE_ROUTE",1),

    WEB_LOGIN("WEB_LOGIN",2);

    private String name;
    private int index;

    public Integer getIndex() {
        return index;
    }
    public String getName(){
        return name;
    }

    ProbeType(String name, int index){
        this.name = name;
        this.index = index;
    }

}
