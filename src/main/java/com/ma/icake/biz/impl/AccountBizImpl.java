package com.ma.icake.biz.impl;

import com.ma.icake.biz.AccountBiz;
import com.ma.icake.dao.AccountDao;
import com.ma.icake.entity.Account;
import com.ma.icake.global.DaoFactory;

import java.util.List;

public class AccountBizImpl implements AccountBiz {
    /* 获取对应dao的实例对象*/
    private AccountDao accountDao = DaoFactory.getInstence().getDao(AccountDao.class);
    /*登录验证*/
    public Account login(String name, String password) {
        List<Account> list = accountDao.selectByName(name);
        for(Account account:list)
            if(account.getPassword().equals(password))
                return account;
        return null;
    }
}
