package com.example.springbootbase.dao;

import com.example.springbootbase.model.LateApply;
import com.example.springbootbase.model.LateApplyNew;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface WanguiNewDao {


    @Insert("Insert into lateapply_new(personid,personname,personmajor,persongrade,applycontent,applyreason,applyresult,sushelocation,sushenumber) values(#{personid},#{personname},#{personmajor},#{persongrade},#{applycontent},#{applyreason},#{applyresult},#{sushelocation},#{sushenumber})")
    void InsertWanguiNew(LateApplyNew lateApplyNew);

    @Select("select count(*) from lateapply_new")
    Integer getWanGuiNewListCount();

    @Select("select * from lateapply_new limit #{pageIndex},12")
    List<LateApplyNew> wanguiNewList(Integer pageIndex);

    @Update({"update lateapply_new set applyresult = #{pass} , applyreason = #{reason} where applyid = #{applyid}"})
    void updateResultFalseState(@Param("applyid") String applyid, @Param("reason") String reason, @Param("pass") String pass);

    @Update({"update lateapply_new set applyresult = #{pass} , applyreason = #{reason} where applyid = #{applyid}"})
    void updateResultState(@Param("applyid") String applyid, @Param("reason") String reason, @Param("pass") String pass);


    @Select("select * from lateapply_new where personmajor = #{personmajor}")
    List<LateApplyNew> getObscureMatchNewResult(String personmajor);

    @Select("select count(*) from lateapply_new where personmajor = #{personmajor}")
    Integer getLateApplyNewListObscureMatchCount(String personmajor);

    @Select({"select * from lateapply_new where personid = #{id} limit #{pageIndex},12"})
    List<LateApplyNew> lateApplyNewListById(@Param("pageIndex") Integer pageIndex, @Param("id") Integer id);

    @Select("select count(*) from lateapply_new where personid = #{id}")
    Integer lateApplyNewListCountById(Integer id);

    @Select("select * from lateapply_new where applyid = #{applyid}")
    List<LateApplyNew> selectOneLateApplyNewById(Integer applyid);



}
