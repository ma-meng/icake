package com.ma.icake.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ma.icake.biz.AccountBiz;
import com.ma.icake.biz.CakeBiz;
import com.ma.icake.biz.CatalogBiz;
import com.ma.icake.biz.impl.AccountBizImpl;
import com.ma.icake.biz.impl.CakeBizImpl;
import com.ma.icake.biz.impl.CatalogBizImpl;
import com.ma.icake.entity.Account;
import com.ma.icake.entity.Cake;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class DefaultController {
    private AccountBiz accountBiz = new AccountBizImpl();
    private CatalogBiz catalogBiz = new CatalogBizImpl();
    private CakeBiz cakeBiz = new CakeBizImpl();
   /* 跳转到登录页面*/
    //  /toLogin.do
    public void toLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/admin/login.jsp").forward(request,response);
    }
    /*登录*/
    //  /login.do
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("account");
        String password = request.getParameter("password");
        Account account = accountBiz.login(name,password);
        if(account==null)
            response.sendRedirect("toLogin.do");
        else{
            request.getSession().setAttribute("ACCOUNT",account);
            response.sendRedirect("/admin/Cake/list.do");
        }
    }
   /* 退出登录*/
    //  /quit.do
    public void quit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("ACCOUNT",null);
        response.sendRedirect("toLogin.do");
    }
    /*首页*/
    //  /index.do
    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cake cake = cakeBiz.getSpecial();
        request.setAttribute("cake",cake);
        List<Cake> list = cakeBiz.getForIndex();
        request.setAttribute("list",list);
        request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request,response);
    }
   /* 前台蛋糕列表*/
    //  /list.do
    public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        String pageNum = request.getParameter("pageNum");
        if(pageNum==null) pageNum="1";
        PageHelper.startPage(Integer.parseInt(pageNum),12);
        List<Cake> list = cakeBiz.getForCatalog(cid);
        PageInfo pageInfo = PageInfo.of(list);
        request.setAttribute("pageInfo",pageInfo);
        request.setAttribute("cid",cid);
        request.getRequestDispatcher("/WEB-INF/pages/list.jsp").forward(request,response);
    }
    /*蛋糕详情*/
    //  /detail.do
    public void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cake cake = cakeBiz.get(id);
        request.setAttribute("cake",cake);
        List<Cake> list = cakeBiz.getForIndex();
        request.setAttribute("list",list);
        request.getRequestDispatcher("/WEB-INF/pages/detail.jsp").forward(request,response);
    }
}
