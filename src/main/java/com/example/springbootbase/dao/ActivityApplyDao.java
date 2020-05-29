package com.example.springbootbase.dao;


import com.example.springbootbase.model.Activity;
import com.example.springbootbase.model.ActivityApply;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ActivityApplyDao {

    @Insert({"insert into ActivityApply(username, teamname,teamlocation,teamnumber,activityname,result,reason) values(#{username},#{teamname},#{teamlocation},#{teamnumber},#{activityname},#{result},#{reason})"})
    void insertActivityApply(ActivityApply activityApply);


    @Select("select count(*) from ActivityApply")
    Integer getActivityApplyListCount();


    @Select({"select * from ActivityApply limit #{pageIndex},12"})
    List<ActivityApply> activityApplyList(Integer pageIndex);

    @Select("select * from ActivityApply where id = #{activityApplyId}")
    List<ActivityApply> getOneActivityApply(Integer activityApplyId);

    @Select({"select * from ActivityApply where teamname = #{teamname} limit #{pageIndex},12"})
    List<ActivityApply> getActivityApplyListByTeamName(@Param("teamname") String teamname,@Param("pageIndex") Integer pageIndex);


    @Select("select * from ActivityApp where id = #{id}")
    ActivityApply getActivityApplyById(String id);




    @Update({"update ActivityApp set username = #{username}, teamname = #{teamname},teamlocation = #{teamlocation}, teamnumber = #{teamnumber} , result = #{result}, reason = #{reason} where id = #{id}"})
    void updateActivityApply(ActivityApply activityApply);



    @Update({"update ActivityApply set result = #{pass} , reason = #{reason} where id = #{id}"})
    void updateResultState(@Param("id") String id, @Param("reason") String reason, @Param("pass") String pass);



    @Update({"update ActivityApply set result = #{pass} , reason = #{reason} where id = #{id}"})
    void updateResultFalseState(@Param("id") String id, @Param("reason") String reason, @Param("pass") String pass);


}
