package com.ma.icake.controller;

import com.ma.icake.biz.CatalogBiz;
import com.ma.icake.biz.impl.CatalogBizImpl;
import com.ma.icake.entity.Catalog;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CatalogController {
    private CatalogBiz catalogBiz = new CatalogBizImpl();
    //      /admin/Catalog/list.do
     /* 查询根目录下的所有分类，存放到request域中，
           并转发到catalog_list页面上*/
    public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Catalog root = catalogBiz.getRoot();
        request.getServletContext().setAttribute("root",root);
        request.getRequestDispatcher("/WEB-INF/pages/admin/catalog_list.jsp").forward(request,response);
    }
    /*查询根目录下的所有分类，存放到request域中，
      并转发到catalog_add页面上*/
    //      /admin/Catalog/toAdd.do
    public void toAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Catalog root = catalogBiz.getRoot();
        request.setAttribute("root",root);
        request.getRequestDispatcher("/WEB-INF/pages/admin/catalog_add.jsp").forward(request,response);
    }
   /* 添加分类信息，并重定向到list页面*/
    //      /admin/Catalog/add.do
    public void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String[] titles = request.getParameterValues("title");
        String[] pids = request.getParameterValues("pid");
        String[] infos = request.getParameterValues("info");
        List<Catalog> list = new ArrayList<Catalog>();
        for(int i=0;i<titles.length;i++){
            Catalog catalog = new Catalog();
            catalog.setTitle(titles[i]);
            catalog.setPid(Integer.parseInt(pids[i]));
            catalog.setInfo(infos[i]);
            list.add(catalog);
        }
        catalogBiz.add(list);
        response.sendRedirect("list.do");
    }
   /* 删除分类信息*/
    //      /admin/Catalog/remove.do
    public void remove(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        catalogBiz.remove(id);
        response.sendRedirect("list.do");
    }

}
