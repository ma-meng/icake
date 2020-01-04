package com.ma.icake.dao;

import com.ma.icake.entity.Cake;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CakeDao {
    /*添加*/
    @Insert("insert into cake(title,cid,image_path,price,taste,sweetness,weight,size,material,status) values(#{title},#{cid},#{imagePath},#{price},#{taste},#{sweetness},#{weight},#{size},#{material},#{status})")
    @Options(useGeneratedKeys = true,keyProperty = "id")
    void insert(Cake cake);
    /*根据id修改*/
    @Update("update cake set title=#{title},cid=#{cid},image_path=#{imagePath},price=#{price},taste=#{taste},sweetness=#{sweetness},weight=#{weight},size=#{size},material=#{material},status=#{status} where id=#{id}")
    void update(Cake cake);
    /*根据id删除*/
    @Delete("delete from cake where id=#{id}")
    void delete(int id);
    /*根据id查询*/
    @Select("select c.*,ca.title ctitle from cake c left join catalog ca on c.cid=ca.id where c.id=#{id}")
    @Results(id="all",value = {
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "title",property = "title"),
            @Result(column = "cid",property = "cid"),
            @Result(column = "image_path",property = "imagePath"),
            @Result(column = "price",property = "price"),
            @Result(column = "taste",property = "taste"),
            @Result(column = "sweetness",property = "sweetness"),
            @Result(column = "weight",property = "weight"),
            @Result(column = "size",property = "size"),
            @Result(column = "material",property = "material"),
            @Result(column = "status",property = "status"),
            @Result(column = "ctitle",property = "catalog.title")
    })
    Cake select(int id);
    /*查询全部*/
    @Select("select c.*,ca.title ctitle from cake c left join catalog ca on c.cid=ca.id order by id desc")
    @ResultMap("all")
    List<Cake> selectAll();
    /*根据状态查询*/
    @Select("select c.*,ca.title ctitle from cake c left join catalog ca on c.cid=ca.id where c.status=#{status}")
    @ResultMap("all")
    List<Cake> selectByStatus(String status);
    /*根据分类id查询*/
    @Select("select c.*,ca.title ctitle from cake c left join catalog ca on c.cid=ca.id where c.cid=#{cid}")
    @ResultMap("all")
    List<Cake> selectByCid(int cid);
}
