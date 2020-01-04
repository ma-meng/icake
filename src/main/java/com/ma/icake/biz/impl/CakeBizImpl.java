package com.ma.icake.biz.impl;

import com.ma.icake.biz.CakeBiz;
import com.ma.icake.dao.CakeDao;
import com.ma.icake.entity.Cake;
import com.ma.icake.global.DaoFactory;

import java.util.List;

public class CakeBizImpl implements CakeBiz {
    private CakeDao cakeDao = DaoFactory.getInstence().getDao(CakeDao.class);
    /*添加蛋糕*/
    public void add(Cake cake) {
        cakeDao.insert(cake);
    }
    /*修改*/
    public void edit(Cake cake) {
        cakeDao.update(cake);
    }
   /* 删除*/
    public void remove(int id) {
        cakeDao.delete(id);
    }
    /*通过id获取蛋糕*/
    public Cake get(int id) {
        return cakeDao.select(id);
    }
    /*查询全部*/
    public List<Cake> getAll() {
        return cakeDao.selectAll();
    }

    public Cake getSpecial() {
        List<Cake> list = cakeDao.selectByStatus("特卖");
        if(list.size()>0)
            return list.get(0);
        return null;
    }
    /*根据索引查询*/
    public List<Cake> getForIndex() {
        return cakeDao.selectByStatus("推荐");
    }

    /*根据分类查找*/
    public List<Cake> getForCatalog(int cid) {
        return cakeDao.selectByCid(cid);
    }
}
