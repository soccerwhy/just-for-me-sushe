package com.example.springbootbase.model;

import lombok.Data;

/**
 * 学生与管理员
 */
@Data
public class Person {
    private String personid;
    private String username;
    private String password;
    private String name;
    private String sex;
    private String grade;
    private String major;
    private String telephone;
    private String email;
    private String role;
}
