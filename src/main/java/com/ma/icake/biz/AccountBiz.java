package com.ma.icake.biz;

import com.ma.icake.entity.Account;

public interface AccountBiz {
    Account login(String name, String password);
}
