package com.example.springbootbase.dao;

import com.example.springbootbase.learn.DVD;
import com.example.springbootbase.model.TeamApply;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DvdDao {

    @Insert({"insert into dvd(dvdnum, dvdname,dvdstate,dvdtype,dvdphoto) values(#{dvdnum},#{dvdname},#{dvdstate},#{dvdtype},#{dvdphoto})"})
    void insertDVD(DVD dvd);

    @Select("select * from DVD")
    List<DVD> getDVDList();

}
