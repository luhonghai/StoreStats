package com.stat.store.service;

import com.stat.store.dao.UserDAO;
import com.stat.store.entity.User;
import com.stat.store.exception.DAOException;
import com.stat.store.util.JNDILookUpClass;
import com.stat.store.util.MD5Helper;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;

/**
 * Created by longnguyen on 4/6/15.
 */
public class UserService {
    @EJB
    private UserDAO userDAO;

    public UserService(){
        Context context;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(UserDAO.class.getName(), "UserEJB");
            userDAO = (UserDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public User login(String email, String password) throws DAOException {
        return userDAO.login(email, MD5Helper.md5(password));
    }

    public User doRegister(User entity) throws DAOException{
        return userDAO.save(entity);
    }
}
