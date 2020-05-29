package com.example.springbootbase.dao;

import com.example.springbootbase.model.Person;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper  //指定这是一个操作数据库的方法
public interface PersonDao {

    @Insert({"insert into Person(username,password,name,sex,telephone,email,grade,major,role) values(#{username},#{password},#{name},#{sex},#{telephone},#{email},#{grade},#{major},#{role})"})
    void insertPerson(Person person);

    @Select({"select * from Person limit #{pageIndex},12"})
    List<Person> personList(Integer pageIndex);

    @Select("select * from Person where personid = #{id}")
    List<Person> getOnePerson(String id);

    @Select("select * from Person where personid = #{id}")
    Person getPersonById(String id);

    @Select("select count(*) from Person")
    Integer getPersonListCount();

    @Update({"update Person set username = #{username}, password = #{password},name = #{name}, sex = #{sex}, telephone = #{telephone}, email = #{email},grade = #{grade}, major = #{major} where personid = #{personid}"})
    void updatePerson(Person person);

    @Delete("delete from Person where personid = #{id}")
    void deletePerson(String id);

    @Select("select personid from person where name = #{name}")
    Integer getPersonIdByPersonname(String name);

    @Update("update person set role = #{role} where name = #{username}")
    void updateRoleByUsername(@Param("username") String username, @Param("role") String role);

    @Select("select name from person_new where personid = #{personid}")
    String getNameByPersonId(Integer personid);



}
