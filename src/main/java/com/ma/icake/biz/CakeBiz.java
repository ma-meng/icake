package com.ma.icake.biz;

import com.ma.icake.entity.Cake;

import java.util.List;

public interface CakeBiz {
    void add(Cake cake);
    void edit(Cake cake);
    void remove(int id);
    Cake get(int id);
    List<Cake> getAll();
    Cake getSpecial();
    List<Cake> getForIndex();
    List<Cake> getForCatalog(int cid);
}
