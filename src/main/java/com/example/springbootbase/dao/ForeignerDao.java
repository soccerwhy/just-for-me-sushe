package com.example.springbootbase.dao;

import com.example.springbootbase.model.Foreigner;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ForeignerDao {

    @Insert("insert into foreigner(name,job,sushenumber,cometime,lefttime) values(#{name},#{job},#{sushenumber},#{cometime},#{lefttime})")
    void insertForeigner(Foreigner foreigner);


    @Select("select * from foreigner limit #{pageIndex},12")
    List<Foreigner> foreignerList(Integer pageIndex);

    @Select("select count(*) from foreigner")
    Integer getForeignerListCount();


    @Select("select * from foreigner where foreignid = #{id}")
    List<Foreigner> getOneForeign(String id);


}
