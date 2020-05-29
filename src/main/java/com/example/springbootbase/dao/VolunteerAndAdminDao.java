package com.example.springbootbase.dao;

import com.example.springbootbase.model.VolunteerAndAdmin;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface VolunteerAndAdminDao {

    @Insert({"insert into volunteerandadmin(personid) values(#{personid})"})
    void insertvolunteerandadmin(VolunteerAndAdmin volunteerAndAdmin);

    @Select("select personid from VolunteerAndAdmin")
    List<Integer> selectIntegerList();
}
