package com.example.springbootbase.dao;

import com.example.springbootbase.model.WordCount;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface WordCountDao {

    @Insert({"insert into WordCount(name, value) values(#{name},#{value})"})
    void insertWordCount(WordCount wordCount);


    /**
     * 如果搜索的参数过多 可以选用第一个select
     * @return
     */
    //@Select({"select * from WordCount limit 0,6}")
    @Select("select * from WordCount order by value desc limit 0,5")
    List<WordCount> getWordCountList();

    @Delete("delete from WordCount")
    void deleteAllWordCountData();



}
