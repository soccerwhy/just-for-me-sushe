package com.example.springbootbase.dao;

import com.example.springbootbase.model.Team;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface TeamDao {

    @Insert({"insert into Team(name,location,number,slogan) values(#{name},#{location},#{number},#{slogan})"})
    void insertTeam(Team team);

    @Update({"update Team set name = #{name}, location = #{location},number = #{number}, slogan = #{slogan} where teamid = #{teamid}"})
    void updateTeam(Team team);

    @Select("select * from Team limit #{pageIndex},12")
    List<Team> teamList(Integer pageIndex);

    @Select("select * from Team where teamid = #{id}")
    List<Team> getOneTeam(String id);

    @Delete("delete from Team where teamid = #{id}")
    void deleteTeam(String id);


    @Select("select count(*) from Team")
    Integer getTeamListCount();

    @Select("select name from Team where teamid = #{id}")
    String getTeamNameById(Integer id);


    @Select("select * from Team where leader = #{name}")
    Team getTeamByName(String name);


    @Select("select teamid from Team where name = #{name}")
    Integer getTeamIdByTeamname(String name);



    @Select("select name from Team where leader = #{username}")
    String getTeamNameByUserName(String username);

    @Select("select * from Team where teamid = #{teamid}")
    Team getTeamByTeamid(Integer teamid);

    @Update("update team set number = #{teamnumber} where teamid = #{teamid}")
    void updateTeamNumberByTeamId(@Param("teamid") Integer teamid, @Param("teamnumber") Integer teamnumber);

    @Update("update team set leader = #{leader} where teamid = #{teamid}")
    void updateTeamLeaderByTeamId(@Param("teamid") Integer teamid, @Param("leader") String leader);
}
