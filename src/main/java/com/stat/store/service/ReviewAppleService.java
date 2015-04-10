package com.stat.store.service;

import com.stat.store.dao.ReviewAppleDAO;
import com.stat.store.dao.UserDAO;
import com.stat.store.entity.AppIOs;
import com.stat.store.entity.ReviewIOs;
import com.stat.store.exception.DAOException;
import com.stat.store.util.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;
import java.util.List;

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

    public List<ReviewIOs> getReviewsFromService(String track_id){
        return reviewAppleDAO.getReviewFromService(track_id);
    }

    public List<ReviewIOs> getReviewByAppId(String track_id) throws DAOException{
        return reviewAppleDAO.getReviewByTrackId(track_id);
    }

    public ReviewIOs addReview(ReviewIOs rv) throws DAOException{
        return reviewAppleDAO.save(rv);
    }

    public List<ReviewIOs> getAllReview() throws DAOException{
        return (List<ReviewIOs>)reviewAppleDAO.findAll();
    }
}
