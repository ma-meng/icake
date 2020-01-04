package com.ma.icake.entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class Catalog {
    /*分类id*/
    private int id;
   /* 分类名称*/
    private String title;
    /* 分类的父id*/
    private int pid;
    /* 分类的信息*/
    private String info;
    /*包含的子分类集合*/
    private List<Catalog> children = new ArrayList<Catalog>();

    public List<Catalog> getChildren() {
        return children;
    }

    public void setChildren(List<Catalog> children) {
        this.children = children;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }
}
