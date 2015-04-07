package com.stat.store.dao;

import com.stat.store.entity.User;

import javax.ejb.Remote;

/**
 * Created by longnguyen on 4/5/15.
 */

@Remote
public interface UserDAO  extends IDAO<User, Integer>{

    public User login(String username, String password);

}
