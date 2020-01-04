package com.ma.icake.global;

import com.ma.icake.biz.CatalogBiz;
import com.ma.icake.biz.impl.CatalogBizImpl;
import com.ma.icake.entity.Catalog;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class CatalogTreeListener implements ServletContextListener {
    private CatalogBiz catalogBiz = new CatalogBizImpl();
    public void contextInitialized(ServletContextEvent sce) {
        //从数据库中取出蛋糕分类下的所有子分类，并添加到域中
        Catalog root = catalogBiz.getRoot();
        sce.getServletContext().setAttribute("root",root);
    }
}
