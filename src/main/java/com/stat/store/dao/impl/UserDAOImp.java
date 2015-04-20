package com.stat.store.dao.impl;

import com.stat.store.dao.AbstractDAO;
import com.stat.store.dao.UserDAO;
import com.stat.store.entity.User;

import javax.ejb.Stateless;
import javax.persistence.NoResultException;

/**
 * Created by longnguyen on 4/5/15.
 */
@Stateless(name = "UserEJB")
public class UserDAOImp extends AbstractDAO<User, Integer> implements UserDAO{

    public UserDAOImp() {
        super(User.class);
    }

    @Override
    public User login(String username, String password) {
        try {
            return (User) getEm().createNamedQuery("User.Login").setParameter("username", username)
                    .setParameter("password", password).getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
