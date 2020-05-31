package com.example.springbootbase.dao;

import com.example.springbootbase.model.BBS;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
//next writable
@Mapper
public interface BBSDao {

    @Insert({"insert into BBS(susheid,bbstitle,bbscontent) values(#{susheid},#{bbstitle},#{bbscontent}) "})
    void insertBBS(BBS bbs);

    @Select("select * from BBS where susheid = #{susheid} or susheid = 0 limit #{pageindex},12")
    List<BBS> getBBSListBySusheid(@Param("susheid")Integer susheid, @Param("pageindex")Integer pageindex);

    @Select("select count(*) from BBS where susheid = #{susheid}")
    Integer getBBSCountBySusheId(Integer susheid);

    @Select("select * from BBS where bbstitle = #{bbstitle}")
    BBS getBBSByBbstitle(String bbstitle);

    @Select({"select * from BBS where susheid = #{susheid} and bbstitle like #{keyword} limit #{pageindex},12"})
    List<BBS> getBBSListByKeyword(@Param("keyword") String keyword,@Param("susheid") Integer susheid, @Param("pageindex")Integer pageindex);

    @Select({"select count(*) from BBS where susheid = #{susheid} and bbstitle like #{keyword}"})
    Integer getBBSListCountByKeyword(@Param("keyword") String keyword,@Param("susheid") Integer susheid);
}
