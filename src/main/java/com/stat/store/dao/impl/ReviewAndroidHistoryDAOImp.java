package com.stat.store.dao.impl;

import com.stat.store.dao.AbstractDAO;
import com.stat.store.dao.ReviewAndroidHistoryDAO;
import com.stat.store.entity.ReviewAndroidHistory;

import javax.ejb.Stateless;
import java.util.List;

/**
 * Created by longnguyen on 4/18/15.
 */
@Stateless(name = "AndroidHistoryEJB")
public class ReviewAndroidHistoryDAOImp extends AbstractDAO<ReviewAndroidHistory, Integer> implements ReviewAndroidHistoryDAO{

    protected ReviewAndroidHistoryDAOImp() {
        super(ReviewAndroidHistory.class);
    }

    @Override
    public List<ReviewAndroidHistory> getByPackageName(String packageName) {
        return (List<ReviewAndroidHistory>)getEm().createNamedQuery("Android_History.GetReviewByPackageName")
                .setParameter("packageName", packageName).getResultList();
    }
}
