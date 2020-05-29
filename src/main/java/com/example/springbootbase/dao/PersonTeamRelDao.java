package com.example.springbootbase.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface PersonTeamRelDao {
    @Insert({"insert into PersonTeamRel(teamid,personid) values(#{teamid},#{personid})"})
    void insertPersonTeamRel(@Param("teamid") Integer teamid, @Param("personid") Integer personid);


    @Select({"select teamid from personteamrel where personid = #{personid}"})
    Integer getTeamIdFromPersonteamrelByPersonId(Integer personid);

    @Select("select personid from personteamrel where teamid = #{teamid}")
    List<Integer> getPersonIdByTeamId(Integer teamid);


    @Select("select count(*) from personteamrel where teamid = #{teamid}")
    Integer getTeamNumberByTeamId(Integer teamid);

    @Select("select teamid from personteamrel where personid = #{personid}")
    Integer getTeamidByPersonId(Integer personid);

}
