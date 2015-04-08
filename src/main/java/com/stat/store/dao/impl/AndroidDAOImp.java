package com.stat.store.dao.impl;

import com.gc.android.market.api.MarketSession;
import com.gc.android.market.api.model.Market;
import com.stat.store.constant.Common;
import com.stat.store.dao.AbstractDAO;
import com.stat.store.dao.AndroidDAO;
import com.stat.store.entity.AppAndroid;

import javax.ejb.Stateless;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by longnguyen on 4/6/15.
 */
@Stateless(name = "AndroidEJB")
public class AndroidDAOImp extends AbstractDAO<AppAndroid, Integer> implements AndroidDAO{

    public AndroidDAOImp() {
        super(AppAndroid.class);
    }

    @Override
    public List<AppAndroid> searchByName(String name) {
        List<AppAndroid> list = new ArrayList<AppAndroid>();
        MarketSession session = new MarketSession();

        session.login(Common.USERNAME, Common.PASSWORD);
        session.getContext().setAndroidId(Common.ANDROID_ID);

        Market.AppsRequest appsRequest = Market.AppsRequest.newBuilder().setQuery(name)
                .setStartIndex(0).setEntriesCount(10).setWithExtendedInfo(true)
                .setAppType(Market.AppType.APPLICATION).build();

        MarketSession.Callback<Market.AppsResponse> callback = new MarketSession.Callback<Market.AppsResponse>() {
            @Override
            public void onResult(Market.ResponseContext context, Market.AppsResponse response) {

                if (response != null) {
                    AppAndroid app;
                    for (int i = 0; i < response.getAppCount(); i++) {
                        app = new AppAndroid();
                        app.setTitle(response.getApp(i).getTitle());
                        app.setCreator(response.getApp(i).getCreator());
                        app.setCreatorId(response.getApp(i).getCreatorId());
                        app.setAppId(response.getApp(i).getId());
                        app.setPackageName(response.getApp(i).getPackageName());
                        app.setPrice(response.getApp(i).getPrice());
                        app.setRating(response.getApp(i).getRating());
                        app.setRatingCount(response.getApp(i).getRatingsCount() + "");
                        app.setVersion(response.getApp(i).getVersion());
                        app.setDescription(response.getApp(i).getExtendedInfo().getDescription());
                        app.setDownloadCount(response.getApp(i).getExtendedInfo().getDownloadsCountText());
                        app.setPromotionText(response.getApp(i).getExtendedInfo().getPromoText());
                        app.setCategory(response.getApp(i).getExtendedInfo().getCategory());
                        app.setAppType(response.getApp(i).getAppType().name());
                    }

                }
            }
        };
        session.append(appsRequest, callback);
        session.flush();
        return list;
    }

    @Override
    public boolean checkExistedApp(String appId) {
        if(getAppById(appId) != null){
            return true;
        }
        return false;
    }

    @Override
    public AppAndroid getAppById(String appId) {
        return (AppAndroid)getEm().createNamedQuery("Android.CheckExisted")
                .setParameter("appId", appId).getSingleResult();
    }

    @Override
    public boolean deleteAppById(String appId) {
        int result = getEm().createNamedQuery("Android.UnFollow").setParameter("appId", appId).executeUpdate();
        if(result > 0){
            return true;
        }
        return false;
    }

    @Override
    public List<AppAndroid> getAppsByUserId(int user_id) {
        return (List<AppAndroid>)getEm().createNamedQuery("Android.GetAppOfUser").setParameter("user_id", user_id).getResultList();
    }
}
