package com.stat.store.schedule;

import com.stat.store.entity.AppAndroid;
import com.stat.store.entity.AppIOs;
import com.stat.store.entity.ReviewAndroidHistory;
import com.stat.store.entity.ReviewIOsHistory;
import com.stat.store.exception.DAOException;
import com.stat.store.service.AndroidHistoryService;
import com.stat.store.service.AndroidService;
import com.stat.store.service.AppleHistoryService;
import com.stat.store.service.AppleService;
import com.stat.store.util.DateUtil;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import java.util.List;

/**
 * Created by longnguyen on 4/18/15.
 */
public class ReviewHistoryCron implements Job{
    AndroidService androidService;
    AppleService appleService;
    AndroidHistoryService androidHistoryService;
    AppleHistoryService appleHistoryService;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        System.out.println("Start Job");
        androidService = new AndroidService();
        appleService = new AppleService();
        androidHistoryService = new AndroidHistoryService();
        appleHistoryService = new AppleHistoryService();
        List<AppIOs> listFollowedIOs;
        List<AppAndroid> listFollowedAndroid;

        try{
            //Check rating of all followed app ios
            listFollowedIOs = appleService.getAllFollowedApp();
            AppIOs tempApp;
            ReviewIOsHistory tempHistory;
            if(listFollowedIOs != null && listFollowedIOs.size() > 0){
                for(AppIOs app: listFollowedIOs){
                    tempApp = appleService.getAppDetail(app.getTrackId());

                    tempHistory = new ReviewIOsHistory();
                    tempHistory.setRating(tempApp.getAverageUserRating());
                    tempHistory.setTrackId(tempApp.getTrackId());
                    tempHistory.setUpdatedDate(DateUtil.getCurrentDate());

                    appleHistoryService.addReview(tempHistory);
                }
            }


            //Check rating of all followed app android
            listFollowedAndroid = androidService.getAllFolloweddApp();
            AppAndroid tempAndroid;
            ReviewAndroidHistory tempAndroidHistory;
            if(listFollowedAndroid != null && listFollowedAndroid.size() > 0){
                for(AppAndroid app: listFollowedAndroid){
                    tempAndroid = androidService.getAppFromServiceByPackageName(app.getPackageName());

                    tempAndroidHistory = new ReviewAndroidHistory();
                    tempAndroidHistory.setRating(tempAndroid.getRating());
                    tempAndroidHistory.setPackageName(tempAndroid.getPackageName());
                    tempAndroidHistory.setUpdatedDate(DateUtil.getCurrentDate());

                    androidHistoryService.addReview(tempAndroidHistory);
                }
            }
        }catch(DAOException ex){
            ex.printStackTrace();
        }
        System.out.println("End Job");
    }
}
