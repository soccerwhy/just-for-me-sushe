package com.example.springbootbase.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface PerponSusheRelDao {

    @Select("select susheid from sushepersonrel where personid = #{personid}")
    Integer getSusheIdBypersonId(Integer personid);
}
