package com.stat.store.service;

import com.stat.store.dao.AndroidDAO;
import com.stat.store.dao.AppleDAO;
import com.stat.store.util.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;

/**
 * Created by longnguyen on 4/6/15.
 */
public class AndroidService {

    @EJB
    private AndroidDAO androidDAO;

    public AndroidService(){
        Context context;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(AndroidDAO.class.getName(), "AndroidEJB");
            androidDAO = (AndroidDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

}
