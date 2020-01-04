package com.ma.icake.global;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

public class GlobalController extends GenericServlet {


    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        /*
        .do
        /login.do           DefaultController   login
        /Cake/detail.do     CakeController      detail
        /admin/Cake/add.do  CakeController      add
         */
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        String path = request.getServletPath();
        /*如果请求是/admin开头的，则先截取/admin以后的字符，如果不是，则截取/后的字符*/
        if(path.indexOf("admin")!=-1){
            path = path.substring(7);
        }else{
            path = path.substring(1);
        }
        /*
        login.do           DefaultController   login
        Cake/detail.do     CakeController      detail
        Cake/add.do  CakeController      add
         */
        int index = path.indexOf("/");
        String className =null;
        String methodName =null;
        /*
         以/为分割线，截取/之前的字符，
         例如Cake/add.do 截取的是例如Cake，
         并拼接上Controller，以及包路径
         如果没有/,则进入到默认的DefaultController中
         */
        if(index!=-1){
            className = "com.ma.icake.controller."+path.substring(0,index)+"Controller";
           /* 从/后边的字符串，截止到.do 之前的字符串，该字符串为方法名*/
            methodName = path.substring(index+1,path.indexOf(".do"));
        }else{
            className = "com.ma.icake.controller.DefaultController";
            methodName = path.substring(0,path.indexOf(".do"));
        }
        try {
            /*使用反射获取到Class对象*/
            Class cla = Class.forName(className);
           /* 创建该对象的实例对象*/
            Object object = cla.getDeclaredConstructor().newInstance();
           /* 通过反射的方式执行方法*/
            Method method = cla.getMethod(methodName,HttpServletRequest.class, HttpServletResponse.class);
            method.invoke(object,request,response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }
}
