package com.stat.store.service;

import com.stat.store.dao.ReviewAndroidHistoryDAO;
import com.stat.store.entity.ReviewAndroidHistory;
import com.stat.store.exception.DAOException;
import com.stat.store.util.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;
import java.util.List;

/**
 * Created by longnguyen on 4/18/15.
 */
public class AndroidHistoryService {

    @EJB
    private ReviewAndroidHistoryDAO androidHistoryDAO;

    public AndroidHistoryService(){
        Context context;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(ReviewAndroidHistoryDAO.class.getName(), "AndroidHistoryEJB");
            androidHistoryDAO = (ReviewAndroidHistoryDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public List<ReviewAndroidHistory> getReviewByPackageName(String packageName){
        return androidHistoryDAO.getByPackageName(packageName);
    }

    public ReviewAndroidHistory addReview(ReviewAndroidHistory review) throws DAOException {
        return androidHistoryDAO.save(review);
    }
}
