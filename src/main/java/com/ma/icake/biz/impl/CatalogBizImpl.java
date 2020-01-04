package com.ma.icake.biz.impl;

import com.ma.icake.biz.CatalogBiz;
import com.ma.icake.dao.CatalogDao;
import com.ma.icake.entity.Catalog;
import com.ma.icake.global.DaoFactory;

import java.util.List;

public class CatalogBizImpl implements CatalogBiz {
   /* 获取对应dao的实例对象*/
    private CatalogDao catalogDao = DaoFactory.getInstence().getDao(CatalogDao.class);
   /* 批量添加分类*/
    public void add(List<Catalog> list) {
        catalogDao.batchInsert(list);
    }
   /* 根据id删除分类*/
    public void remove(int id) {
        catalogDao.delete(id);
    }
    /*获取id是10000的分类信息*/
    public Catalog getRoot() {
        return catalogDao.select(10000);
    }
}
