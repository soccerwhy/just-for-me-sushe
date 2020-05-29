package com.example.springbootbase.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
// i wang to go to new branch
@Mapper
public interface ActivityTeamRelDao {

    @Insert({"insert into ActivityTeamRel(teamid,activityid) values(#{teamid},#{activityid})"})
    void insertActivityTeamRel(@Param("teamid") Integer teamid,@Param("activityid") Integer activityid);



}
