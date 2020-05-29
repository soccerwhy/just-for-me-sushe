package com.example.springbootbase.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SusheRelDao {

    @Select("select susheid from sushepersonrel where personid = #{personid}")
    Integer getSusheIdByPersonId(Integer personid);

    @Select("select personid from sushepersonrel where susheid = #{susheid}")
    List<Integer> getListPersonIdBySusheId(Integer susheid);



}
