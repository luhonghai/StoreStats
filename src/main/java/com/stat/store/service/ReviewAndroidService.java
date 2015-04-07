package com.stat.store.service;

import com.stat.store.dao.ReviewAndroidDAO;
import com.stat.store.dao.ReviewAppleDAO;
import com.stat.store.util.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;

/**
 * Created by longnguyen on 4/6/15.
 */
public class ReviewAndroidService {

    @EJB
    private ReviewAndroidDAO reviewAndroidDAO;

    public ReviewAndroidService(){
        Context context;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(ReviewAndroidDAO.class.getName(), "ReviewAndroidEJB");
            reviewAndroidDAO = (ReviewAndroidDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

}
