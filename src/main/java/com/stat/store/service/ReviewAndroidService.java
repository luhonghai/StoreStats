package com.stat.store.service;

import com.stat.store.dao.ReviewAndroidDAO;
import com.stat.store.dao.ReviewAppleDAO;
import com.stat.store.entity.ReviewAndroid;
import com.stat.store.exception.DAOException;
import com.stat.store.util.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;
import java.util.List;

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

    public List<ReviewAndroid> getReviewsByAppId(String appId){
        return reviewAndroidDAO.getReviewsByAppid(appId); //from local
    }

    public List<ReviewAndroid> getCommentsFromServiceByAppId(String appId){
        return reviewAndroidDAO.getCommentByAppId(appId); //from service
    }

    public ReviewAndroid addReview(ReviewAndroid rv) throws DAOException{
        return reviewAndroidDAO.save(rv);
    }

    public List<ReviewAndroid> getAllReview() throws DAOException{
        return (List<ReviewAndroid>)reviewAndroidDAO.findAll();
    }

}
