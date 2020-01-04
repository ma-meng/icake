package com.ma.icake.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ma.icake.biz.CakeBiz;
import com.ma.icake.biz.CatalogBiz;
import com.ma.icake.biz.impl.CakeBizImpl;
import com.ma.icake.biz.impl.CatalogBizImpl;
import com.ma.icake.entity.Cake;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

public class CakeController {

    private CakeBiz cakeBiz = new CakeBizImpl();
    private CatalogBiz catalogBiz = new CatalogBizImpl();
    /*后台蛋糕列表*/
    //  /admin/Cake/list.do
    public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*获取页面传过来的当前页码*/
        String pageNum = request.getParameter("pageNum");
        /*如果第一次查询时没有分页页面，默认是第一页*/
        if(pageNum==null) pageNum="1";
       /* 设置起始查询页码，以及每页条数*/
        PageHelper.startPage(Integer.parseInt(pageNum),20);
       /* 查询蛋糕*/
        List<Cake> list = cakeBiz.getAll();
        /*把查询的结果封装到PageInfo中*/
        PageInfo pageInfo = PageInfo.of(list);
       /* 把pageInfo放到域中并转发到蛋糕列表页中*/
        request.setAttribute("pageInfo",pageInfo);
        request.getRequestDispatcher("/WEB-INF/pages/admin/cake_list.jsp").forward(request,response);
    }
   /* 跳转到添加页面*/
    //  /admin/Cake/toAdd.do
    public void toAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/admin/cake_add.jsp").forward(request,response);
    }
    /*添加蛋糕*/
    //  /admin/Cake/add.do
    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, FileUploadException {
        Cake cake = builderCake(request);
        cakeBiz.add(cake);
        response.sendRedirect("list.do");
    }
   /* 跳转到修改页面*/
    //  /admin/Cake/toEdit.do
    public void toEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cake cake = cakeBiz.get(id);
        request.setAttribute("cake",cake);
        request.getRequestDispatcher("/WEB-INF/pages/admin/cake_edit.jsp").forward(request,response);
    }
    /*修改*/
    //  /admin/Cake/edit.do
    public void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, FileUploadException {
        Cake cake = builderCake(request);
        cakeBiz.edit(cake);
        response.sendRedirect("list.do");
    }
    /*封装Cake*/
    private Cake builderCake(HttpServletRequest request) throws FileUploadException, UnsupportedEncodingException {
        Cake cake = new Cake();
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> list = upload.parseRequest(request);
       /* 如果是普通表单项，则设置到对应的属性中*/
        for(FileItem item:list){
            if(item.isFormField()){
                if(item.getFieldName().equals("title"))
                    cake.setTitle(item.getString("UTF-8"));
                if(item.getFieldName().equals("status"))
                    cake.setStatus(item.getString("UTF-8"));
                if(item.getFieldName().equals("cid"))
                    cake.setCid(Integer.parseInt(item.getString("UTF-8")));
                if(item.getFieldName().equals("taste"))
                    cake.setTaste(item.getString("UTF-8"));
                if(item.getFieldName().equals("sweetness"))
                    cake.setSweetness(Integer.parseInt(item.getString("UTF-8")));
                if(item.getFieldName().equals("price"))
                    cake.setPrice(Double.parseDouble(item.getString("UTF-8")));
                if(item.getFieldName().equals("weight"))
                    cake.setWeight(Double.parseDouble(item.getString("UTF-8")));
                if(item.getFieldName().equals("size"))
                    cake.setSize(Integer.parseInt(item.getString("UTF-8")));
                if(item.getFieldName().equals("material"))
                    cake.setMaterial(item.getString("UTF-8"));
                if(item.getFieldName().equals("id"))
                    cake.setId(Integer.parseInt(item.getString("UTF-8")));
                if(item.getFieldName().equals("imagePath")&&cake.getImagePath()==null)
                    cake.setImagePath(item.getString("UTF-8"));
            }else{
               /* 如果是文件项，则获取文件后缀名，创建新的文件名，并写入文件*/
                if(item.getFieldName().equals("image")){
                    if(item.getSize()<=100) continue;
                    String rootPath = request.getServletContext().getRealPath("/");
                    String path = item.getName();
                    String type = ".jpg";
                    if(path.indexOf(".")!=-1){
                        type = path.substring(path.lastIndexOf("."));
                    }
                    path = "/download/images/"+System.currentTimeMillis()+type;
                    try {
                        item.write(new File(rootPath+path));
                        cake.setImagePath(path);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return cake;
    }
   /* 根据id删除*/
    //  /admin/Cake/remove.do
    public void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        cakeBiz.remove(id);
        response.sendRedirect("list.do");
    }
   /* 根据id获取蛋糕详情*/
    //  /admin/Cake/detail.do
    public void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cake cake = cakeBiz.get(id);
        request.setAttribute("cake",cake);
        request.getRequestDispatcher("/WEB-INF/pages/admin/cake_detail.jsp").forward(request,response);
    }
}
