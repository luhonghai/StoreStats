package com.stat.store.service;

import com.stat.store.dao.ReviewAppleDAO;
import com.stat.store.dao.UserDAO;
import com.stat.store.util.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;

/**
 * Created by longnguyen on 4/6/15.
 */
public class ReviewAppleService {
    @EJB
    private ReviewAppleDAO reviewAppleDAO;

    public ReviewAppleService(){
        Context context;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(ReviewAppleDAO.class.getName(), "ReviewAppleEJB");
            reviewAppleDAO = (ReviewAppleDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
}
