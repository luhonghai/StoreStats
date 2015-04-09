package com.stat.store.service;

import com.stat.store.dao.AppleDAO;
import com.stat.store.entity.AppIOs;
import com.stat.store.exception.DAOException;
import com.stat.store.util.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;
import java.util.List;

/**
 * Created by longnguyen on 4/6/15.
 */
public class AppleService {

    @EJB
    private AppleDAO appleDAO;

    public AppleService(){
        Context context;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(AppleDAO.class.getName(), "AppleEJB");
            appleDAO = (AppleDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public List<AppIOs> searchByKeyword(String keyword){
        String url = "https://itunes.apple.com/search?term="+keyword+"&country=tr&entity=software&limit=100";
        return appleDAO.getAppsFromService(url);
    }

    public AppIOs getAppDetail(String track_id){
        String url = "https://itunes.apple.com/lookup?id="+track_id;
        return appleDAO.getAppDetailService(url);
    }

    public AppIOs followApp(AppIOs app) throws DAOException{
        return appleDAO.save(app);
    }

    public boolean unfollowById(String track_id, int user_id){
        return appleDAO.deleteAppById(track_id, user_id);
    }

    public boolean checkExisted(String track_id, int user_id){
        return appleDAO.checkExistedApp(track_id, user_id);
    }

    public List<AppIOs> getFollowedAppsOfUser(int user_id){
        return appleDAO.getAppsByUserId(user_id);
    }
}
