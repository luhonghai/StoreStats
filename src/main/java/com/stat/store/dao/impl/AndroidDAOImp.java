package com.stat.store.dao.impl;

import com.gc.android.market.api.MarketSession;
import com.gc.android.market.api.model.Market;
import com.stat.store.constant.Common;
import com.stat.store.dao.AbstractDAO;
import com.stat.store.dao.AndroidDAO;
import com.stat.store.entity.AppAndroid;
import com.stat.store.util.AndroidUtil;

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
        final List<AppAndroid> list = new ArrayList<AppAndroid>();
        MarketSession session = new MarketSession();

        session.login(Common.USERNAME, Common.PASSWORD);
        session.getContext().setAndroidId(Common.ANDROID_ID);
        //for(int j = 0; j<10; j++) {
            Market.AppsRequest appsRequest = Market.AppsRequest.newBuilder()
                    .setQuery(name)
                    .setStartIndex(0)
                    .setEntriesCount(10)
                    .setWithExtendedInfo(true)
                    .setAppType(Market.AppType.APPLICATION)
                    .build();

            MarketSession.Callback<Market.AppsResponse> callback = new MarketSession.Callback<Market.AppsResponse>() {
                @Override
                public void onResult(Market.ResponseContext context, Market.AppsResponse response) {
                    //System.out.println(response);
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
                            app.setRating(response.getApp(i).getRating().substring(0, 3));
                            app.setRatingCount(response.getApp(i).getRatingsCount() + "");
                            app.setVersion(response.getApp(i).getVersion());
                            app.setDescription(response.getApp(i).getExtendedInfo().getDescription());
                            app.setDownloadCount(response.getApp(i).getExtendedInfo().getDownloadsCountText());
                            app.setPromotionText(response.getApp(i).getExtendedInfo().getPromoText());
                            app.setCategory(response.getApp(i).getExtendedInfo().getCategory());
                            app.setAppType(response.getApp(i).getAppType().name());
                            app.setArtworkUrl(AndroidUtil.getArtworkUrl(app.getPackageName()));

                            list.add(app);
                        }

                    }
                }
            };
            session.append(appsRequest, callback);
            session.flush();
        //}

        return list;
    }

    @Override
    public AppAndroid searchByPackageName(String package_name) {
        final List<AppAndroid> list = new ArrayList<AppAndroid>();
        MarketSession session = new MarketSession();

        session.login(Common.USERNAME, Common.PASSWORD);
        session.getContext().setAndroidId(Common.ANDROID_ID);

        String query = "pname:"+package_name;

        Market.AppsRequest appsRequest = Market.AppsRequest.newBuilder().setQuery(query)
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
                        app.setRating(response.getApp(i).getRating().substring(0,3));
                        app.setRatingCount(response.getApp(i).getRatingsCount() + "");
                        app.setVersion(response.getApp(i).getVersion());
                        app.setDescription(response.getApp(i).getExtendedInfo().getDescription());
                        app.setDownloadCount(response.getApp(i).getExtendedInfo().getDownloadsCountText());
                        app.setPromotionText(response.getApp(i).getExtendedInfo().getPromoText());
                        app.setCategory(response.getApp(i).getExtendedInfo().getCategory());
                        app.setAppType(response.getApp(i).getAppType().name());
                        app.setArtworkUrl(AndroidUtil.getArtworkUrl(app.getPackageName()));

                        List<String> screenshots = AndroidUtil.getScreenshots(app.getPackageName());
                        if(screenshots.size() == 1){
                            app.setScreenShot1(screenshots.get(0));
                        }else if(screenshots.size() == 2){
                            app.setScreenShot1(screenshots.get(0));
                            app.setScreenShot2(screenshots.get(1));
                        }else if(screenshots.size() == 3){
                            app.setScreenShot1(screenshots.get(0));
                            app.setScreenShot2(screenshots.get(1));
                            app.setScreenShot3(screenshots.get(2));
                        }else if(screenshots.size() == 4){
                            app.setScreenShot1(screenshots.get(0));
                            app.setScreenShot2(screenshots.get(1));
                            app.setScreenShot3(screenshots.get(2));
                            app.setScreenShot4(screenshots.get(3));
                        }else if(screenshots.size() >= 5){
                            app.setScreenShot1(screenshots.get(0));
                            app.setScreenShot2(screenshots.get(1));
                            app.setScreenShot3(screenshots.get(2));
                            app.setScreenShot4(screenshots.get(3));
                            app.setScreenShot5(screenshots.get(4));
                        }
                        list.add(app);
                    }

                }
            }
        };
        session.append(appsRequest, callback);
        session.flush();
        return list.get(0);
    }

    @Override
    public boolean checkExistedApp(String appId, int user_id) {
        try{
            AppAndroid app = (AppAndroid)getEm().createNamedQuery("Android.CheckExisted").setParameter("appId", appId)
                    .setParameter("userId", user_id).getSingleResult();
            return true;
        }catch(Exception e){
            return false;
        }
    }

    @Override
    public AppAndroid getAppById(String appId) {
        return (AppAndroid)getEm().createNamedQuery("Android.GetAppById")
                .setParameter("appId", appId).getSingleResult();
    }

    @Override
    public boolean deleteAppById(String appId, int user_id) {
        int result = getEm().createNamedQuery("Android.UnFollow").setParameter("appId", appId)
                .setParameter("userId", user_id).executeUpdate();
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
