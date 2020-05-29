package com.example.springbootbase.model.models;

import lombok.Data;

@Data
public class Info {

    private Long time;

    private ProbeType probeType;

    private Integer code;

    private CurlType curlType;

    private String log;
}
