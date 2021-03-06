package com.stat.store.service;

import com.stat.store.dao.AndroidDAO;
import com.stat.store.dao.AppleDAO;
import com.stat.store.entity.AppAndroid;
import com.stat.store.exception.DAOException;
import com.stat.store.util.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;
import java.util.List;

/**
 * Created by longnguyen on 4/6/15.
 */
public class AndroidService {

    @EJB
    private AndroidDAO androidDAO;

    public AndroidService(){
        Context context;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(AndroidDAO.class.getName(), "AndroidEJB");
            androidDAO = (AndroidDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public List<AppAndroid> getAppsFromService(String keyword){
        return androidDAO.searchByName(keyword);
    }

    public AppAndroid getAppFromServiceByPackageName(String package_name){
        return androidDAO.searchByPackageName(package_name);
    }

    public AppAndroid followApp(AppAndroid app) throws DAOException{
        return androidDAO.save(app);
    }

    public void unfollowApp(AppAndroid app) throws DAOException{
        androidDAO.delete(app);
    }

    public boolean unfollowAppById(String appId, int user_id){
        return androidDAO.deleteAppById(appId, user_id);
    }

    public boolean checkExisted(String appId, int user_id){
        return androidDAO.checkExistedApp(appId, user_id);
    }

    public List<AppAndroid> getFollowedAppsOfUser(int user_id){
        return androidDAO.getAppsByUserId(user_id);
    }

    public List<AppAndroid> getAllFolloweddApp(){
        return (List<AppAndroid>) androidDAO.findAll();
    }

}
