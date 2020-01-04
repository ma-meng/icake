package com.ma.icake.dao;

import com.ma.icake.entity.Catalog;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CatalogDao {
    /*批量插入*/
    @Insert("<script>" +
            "insert into catalog(title,pid,info) values" +
            "<foreach collection='list' item='catalog' separator=','>" +
            "(#{catalog.title},#{catalog.pid},#{catalog.info})" +
            "</foreach>" +
            "</script>")
    @Options(useGeneratedKeys = true,keyProperty = "id")
    void batchInsert(List<Catalog> list);
   /* 根据分类id删除*/
    @Delete("delete from catalog where id=#{id}")
    void delete(int id);
    /*根据分类id查询分类*/
    @Select("select * from catalog where id=#{id}")
    @Results(id = "all",value = {
            @Result(column = "id",property = "id",id = true),
            @Result(column = "title",property = "title"),
            @Result(column = "pid",property = "pid"),
            @Result(column = "info",property = "info"),
            @Result(column = "id",property = "children",many = @Many(select = "selectByPid"))
    })
    Catalog select(int id);
    /*根据分类的父id查询分类*/
    @Select("select * from catalog where pid=#{pid}")
    @ResultMap("all")
    List<Catalog> selectByPid(int pid);
}
