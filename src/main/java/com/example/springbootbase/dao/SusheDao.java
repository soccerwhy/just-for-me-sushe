package com.example.springbootbase.dao;

import com.example.springbootbase.model.Sushe;
import com.example.springbootbase.model.Team;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface SusheDao {

    @Insert("insert into sushe(number,location,guaranteecontent,clean) values(#{number},#{location},#{guaranteecontent},#{clean})")
    void InsertSusheInfo(Sushe sushe);



    @Select("select * from sushe where susheid = #{susheid}")
    Sushe getSusheBySusheId(Integer susheid);

    @Update("update sushe set guaranteecontent = #{guaranteecontent}, clean = #{susheclean} where susheid = #{susheid}")
    void updateGuaranteeContentBySusheid(@Param("susheid") Integer susheid,@Param("guaranteecontent") String guaranteecontent,@Param("susheclean") String susheclean);

    @Select("select count(*) from sushe")
    Integer getSusheListCount();

    @Select("select * from sushe limit #{pageIndex},12")
    List<Sushe> susheList(Integer pageIndex);


    @Select("select * from sushe where susheid = #{id}")
    List<Sushe> getOneSushe(String id);

    @Update({"update sushe set number = #{number}, location = #{location},clean = #{clean}, guaranteecontent = #{guaranteecontent} where susheid = #{susheid}"})
    void updateSushe(Sushe sushe);


    @Delete("delete from sushe where susheid = #{id}")
    void deletesushe(String id);

    @Select("select number from sushe")
    List<Integer> getSusheNumberFromSushe();

}
