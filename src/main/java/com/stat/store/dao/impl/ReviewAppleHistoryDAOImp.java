package com.stat.store.dao.impl;

import com.stat.store.dao.AbstractDAO;
import com.stat.store.dao.ReviewAppleHistoryDAO;
import com.stat.store.entity.ReviewIOsHistory;

import javax.ejb.Stateless;
import java.util.List;

/**
 * Created by longnguyen on 4/18/15.
 */
@Stateless(name = "AppleHistoryEJB")
public class ReviewAppleHistoryDAOImp extends AbstractDAO<ReviewIOsHistory, Integer> implements ReviewAppleHistoryDAO {

    public ReviewAppleHistoryDAOImp() {
        super(ReviewIOsHistory.class);
    }

    @Override
    public List<ReviewIOsHistory> getByTrackId(String trackId) {
        return (List<ReviewIOsHistory>)getEm().createNamedQuery("iOS_History.GetByReviewTrackId")
                .setParameter("trackId", trackId).getResultList();
    }
}
