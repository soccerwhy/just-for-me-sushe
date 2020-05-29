package com.example.springbootbase.model.models;

import lombok.Data;
import org.apache.jasper.tagplugins.jstl.core.Url;

import java.util.List;

@Data
public class ProbeData {

    private String appId;

    private String areaId;

    private List<Url> urlList;
}
