package com.example.springbootbase.dao;

import com.example.springbootbase.model.Person_New;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper  //指定这是一个操作数据库的方法
public interface PersonNewDao {

    @Insert({"insert into Person_New(studentid,password,name,sex,telephone,email,classes,major,role) values(#{studentid},#{password},#{name},#{sex},#{telephone},#{email},#{classes},#{major},#{role})"})
    void insertPerson_New(Person_New person_New);

    @Select({"select * from Person_New where role = '学生' limit #{pageIndex},12"})
    List<Person_New> person_NewList(Integer pageIndex);

    @Select("select * from Person_New where studentid = #{id}")
    List<Person_New> getOnePerson_New(String id);

    @Select("select * from Person_New where personid = #{id}")
    Person_New getPerson_NewById(String id);

    @Select("select count(*) from Person_New where role = '学生' ")
    Integer getPerson_NewListCount();

    @Update({"update Person_New set studentid = #{studentid}, password = #{password},name = #{name}, sex = #{sex}, telephone = #{telephone}, email = #{email},classes = #{classes}, major = #{major} where personid = #{personid}"})
    void updatePerson_New(Person_New person_New);

    @Delete("delete from Person_New where personid = #{id}")
    void deletePerson_New (String id);

    @Select("select personid from person_New where name = #{name}")
    Integer getPerson_NewIdByPerson_Newname(String name);

    @Select("select name from person_New where personid = #{personid}")
    String getNameByPerson_NewId(Integer personid);


}
