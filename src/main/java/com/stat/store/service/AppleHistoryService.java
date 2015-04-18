package com.stat.store.service;

import com.stat.store.dao.ReviewAppleHistoryDAO;
import com.stat.store.entity.ReviewIOsHistory;
import com.stat.store.exception.DAOException;
import com.stat.store.util.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;
import java.util.List;

/**
 * Created by longnguyen on 4/18/15.
 */
public class AppleHistoryService {

    @EJB
    private ReviewAppleHistoryDAO appleHistoryDAO;

    public AppleHistoryService(){
        Context context;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(ReviewAppleHistoryDAO.class.getName(), "AppleHistoryEJB");
            appleHistoryDAO = (ReviewAppleHistoryDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public List<ReviewIOsHistory> geReviewHistoryByTrackId(String trackId){
        return appleHistoryDAO.getByTrackId(trackId);
    }

    public ReviewIOsHistory addReview(ReviewIOsHistory review) throws DAOException {
        return appleHistoryDAO.save(review);
    }
}
