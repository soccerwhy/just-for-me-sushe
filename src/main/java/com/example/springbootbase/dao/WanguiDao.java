package com.example.springbootbase.dao;

import com.example.springbootbase.model.LateApply;
import com.example.springbootbase.model.TeamApply;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface WanguiDao {

    @Insert("Insert into lateapply(personid,personname,personmajor,persongrade,applycontent,applyreason,applyresult) values(#{personid},#{personname},#{personmajor},#{persongrade},#{applycontent},#{applyreason},#{applyresult})")
    void InsertWangui(LateApply lateApply);

    @Select("select count(*) from lateapply")
    Integer getWanGuiListCount();

    @Select("select * from lateapply limit #{pageIndex},12")
    List<LateApply> wanguiList(Integer pageIndex);

    @Update({"update lateapply set applyresult = #{pass} , applyreason = #{reason} where applyid = #{applyid}"})
    void updateResultFalseState(@Param("applyid") String applyid, @Param("reason") String reason, @Param("pass") String pass);

    @Update({"update lateapply set applyresult = #{pass} , applyreason = #{reason} where applyid = #{applyid}"})
    void updateResultState(@Param("applyid") String applyid, @Param("reason") String reason, @Param("pass") String pass);


    @Select("select * from lateapply where persongrade = #{grade}")
    List<LateApply> getObscureMatchResult(String grade);

    @Select("select count(*) from lateapply where persongrade = #{grade}")
    Integer getLateApplyListObscureMatchCount(String grade);

    @Select({"select * from lateapply where personid = #{id} limit #{pageIndex},12"})
    List<LateApply> lateApplyListById(@Param("pageIndex") Integer pageIndex, @Param("id") Integer id);

    @Select("select count(*) from lateapply where personid = #{id}")
    Integer lateApplyListCountById(Integer id);

    @Select("select * from lateapply where applyid = #{applyid}")
    List<LateApply> selectOneLateApplyById(Integer applyid);



}
