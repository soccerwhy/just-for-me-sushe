package com.example.springbootbase.dao;

import com.example.springbootbase.model.TeamApply;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ApplyDao {

    @Insert({"insert into teamapply(personId, personName,personJob,personAge,personSex,teamId,teamName,type,result,reason) values(#{personId},#{personName},#{personJob},#{personAge},#{personSex},#{teamId},#{teamName},#{type},#{result},#{reason})"})
    void insertApply(TeamApply teamApply);


    @Select({"select * from teamapply limit #{pageIndex},12"})
    List<TeamApply> applyList(Integer pageIndex);

    @Select({"select * from teamapply where personid = #{id} limit #{pageIndex},12"})
    List<TeamApply> applyListById(@Param("pageIndex") Integer pageIndex, @Param("id") Integer id);

    @Select("select count(*) from teamapply")
    Integer getApplyListCount();


    @Update({"update teamapply set result = #{pass} , reason = #{reason} where id = #{id}"})
    void updateResultState(@Param("id") String id, @Param("reason") String reason, @Param("pass") String pass);



    @Update({"update teamapply set result = #{pass} , reason = #{reason} where id = #{id}"})
    void updateResultFalseState(@Param("id") String id, @Param("reason") String reason, @Param("pass") String pass);


    @Select("select * from teamapply where personsex = #{sex} and personage > #{agelower} and personage < #{ageupper}")
    List<TeamApply> getObscureMatchResult(@Param("sex") String sex, @Param("agelower") String agelower, @Param("ageupper") String ageupper);

    @Select("select count(*) from teamapply where personsex = #{sex} and personage > #{agelower} and personage < #{ageupper}")
    Integer getApplyListObscureMatchCount(@Param("sex") String sex, @Param("agelower") String agelower, @Param("ageupper") String ageupper);

    @Update({"delete from teamapply where personName = #{personName} and result = '' "})
    void deleteApplyInfo(@Param("personName") String personName);


}
