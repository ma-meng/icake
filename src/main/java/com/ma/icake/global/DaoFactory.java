package com.ma.icake.global;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;

public class DaoFactory {
    private static DaoFactory daoFactory;
    private SqlSessionFactory sessionFactory;
    private DaoFactory(){
       /* 加载配置文件，获取sessionFactory*/
        SqlSessionFactoryBuilder sessionFactoryBuilder = new SqlSessionFactoryBuilder();
        try {
            sessionFactory = sessionFactoryBuilder.build(Resources.getResourceAsReader("/mybatis.xml"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
   /* 使用单例模式创建该类的实例对象*/
    public static DaoFactory getInstence(){
        if(daoFactory==null)
            daoFactory = new DaoFactory();
        return daoFactory;
    }
    /*创建一个传入泛型类Dao的实例对象*/
    public <T> T getDao(Class<T> tClass){
        return sessionFactory.openSession(true).getMapper(tClass);
    }

}
