package com.example.springbootbase.dao;

import com.example.springbootbase.model.Activity;
import com.example.springbootbase.model.Person;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ActivityDao {

    @Insert({"insert into Activity(name, location,time,content) values(#{name},#{location},#{time},#{content})"})
    void insertActivity(Activity activity);

    @Select("select count(*) from Activity")
    Integer getActivityListCount();


    @Select({"select * from Activity limit #{pageIndex},12"})
    List<Activity> activityList(Integer pageIndex);

    @Select({"select * from Activity where team is null limit #{pageindex},12"})
    List<Activity> activityListTeamIsNull(Integer pageIndex);

    @Select("select * from Activity where activityid = #{activityId}")
    List<Activity> getOneActivity(Integer activityId);

    @Select("select * from Activity where activityid = #{id}")
    Activity getActivityById(String id);

    @Update({"update Activity set name = #{name}, location = #{location},time = #{time}, content = #{content} where activityid = #{activityid}"})
    void updateActivity(Activity activity);

    @Update("update Activity set team = #{teamname} where name = #{activityname}")
    void updateTeamNameByActivityName(@Param("activityname") String activityname, @Param("teamname")String teamname);


    @Select("select activityid from Activity where name = #{name}")
    Integer getActivityIdByActivitynname(String name);

    /**
     * 模糊匹配
     */
//    @Select("select * from Activity where name like '%#{keyword}%' or location like '%#{keyword}%' or content like '%#{keyword}%'")
//    List<Activity> getActivityListObscureMatch(String keyword);



    /**
     * 模糊匹配
     */
    @Select("select * from Activity where name like #{keyword} or location like #{keyword} or content like #{keyword}")
    List<Activity> getActivityListObscureMatch(String keyword);


    /**
     * 模糊匹配个数
     */
//    @Select("select count(*) from Activity where name like '%#{keyword}%' or location like '%#{keyword}%' or content like '%#{keyword}%'")
//    Integer getActivityListObscureMatchCount(String keyword);

    @Select("select count(*) from Activity where name like #{keyword} or location like #{keyword} or content like #{keyword}")
    Integer getActivityListObscureMatchCount(String keyword);



}
