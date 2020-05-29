package com.example.springbootbase.dao;

import com.example.springbootbase.model.BBS;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BBSAdminDao {

    @Insert({"insert into BBS(susheid,bbstitle,bbscontent) values(#{susheid},#{bbstitle},#{bbscontent}) "})
    void insertBBS(BBS bbs);

    @Select("select * from BBS limit #{pageindex},12")
    List<BBS> getBBSListByAdmin(Integer pageindex);

    @Select("select count(*) from BBS")
    Integer getBBSCountByAdmin();

    @Select("select * from BBS where bbstitle = #{bbstitle}")
    BBS getBBSByBbstitle(String bbstitle);

    @Select({"select * from BBS where bbstitle like #{keyword} limit #{pageindex},12"})
    List<BBS> getBBSListByKeywordAdmin(@Param("keyword") String keyword, @Param("pageindex")Integer pageindex);

    @Select({"select count(*) from BBS where bbstitle like #{keyword}"})
    Integer getBBSListCountByKeywordAdmin(String keyword);

    @Delete("delete from BBS where bbstitle = #{bbstitle}")
    void deleteByBBSTitle(String bbstitle);


}
