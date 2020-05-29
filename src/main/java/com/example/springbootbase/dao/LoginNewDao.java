package com.example.springbootbase.dao;

import com.example.springbootbase.model.Person_New;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface LoginNewDao {

    @Select("select * from Person_new where studentid = #{studentid} and password = #{password} and role = #{role}")
    Person_New loginPersonNew(@Param("studentid") String studentid, @Param("password") String password, @Param("role") String role);


}
