package com.example.springbootbase.dao;

import com.example.springbootbase.model.Person;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface LoginDao {


    @Select("select * from Person where username = #{username} and password = #{password} and role = #{role}")
    Person loginPerson(@Param("username") String username, @Param("password") String password, @Param("role") String role);


}
