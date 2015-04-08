package com.stat.store.dao.impl;

import com.gc.android.market.api.MarketSession;
import com.gc.android.market.api.model.Market;
import com.stat.store.constant.Common;
import com.stat.store.dao.AbstractDAO;
import com.stat.store.dao.ReviewAndroidDAO;
import com.stat.store.entity.ReviewAndroid;

import javax.ejb.Stateless;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by longnguyen on 4/6/15.
 */
@Stateless(name = "ReviewAndroidEJB")
public class ReviewAndroidDAOImp extends AbstractDAO<ReviewAndroid, Integer> implements ReviewAndroidDAO {

    public ReviewAndroidDAOImp() {
        super(ReviewAndroid.class);
    }

    @Override
    public List<ReviewAndroid> getCommentByAppId(final String app_id) {
        List<ReviewAndroid> list = new ArrayList<ReviewAndroid>();
        MarketSession session = new MarketSession();

        session.login(Common.USERNAME, Common.PASSWORD);
        session.getContext().setAndroidId(Common.ANDROID_ID);

        Market.CommentsRequest commentsRequest = Market.CommentsRequest.newBuilder()
                .setAppId(app_id)
                .setStartIndex(0)
                .setEntriesCount(10)
                .build();

        MarketSession.Callback<Market.CommentsResponse> callback = new MarketSession.Callback<Market.CommentsResponse>(){

            @Override
            public void onResult(Market.ResponseContext arg0, Market.CommentsResponse response) {
                ReviewAndroid reviewAndroid;
                for(int i=0; i<response.getCommentsCount(); i++){
                    reviewAndroid= new ReviewAndroid();
                    reviewAndroid.setId(i+1);
                    reviewAndroid.setDescription(response.getComments(i).getText());
                    reviewAndroid.setAppId(app_id);
                    reviewAndroid.setAuthorName(response.getComments(i).getAuthorName());
                    reviewAndroid.setRating(response.getComments(i).getRating()+"");
                    reviewAndroid.setCreationTime(response.getComments(i).getCreationTime()+"");
                }
            }
        };

        session.append(commentsRequest, callback);
        session.flush();
        return list;
    }

    @Override
    public List<ReviewAndroid> getReviewsByAppid(String app_id) {
        return (List<ReviewAndroid>)getEm().createNamedQuery("Review.GetByAppId")
                .setParameter("appId", app_id).getResultList();
    }
}
