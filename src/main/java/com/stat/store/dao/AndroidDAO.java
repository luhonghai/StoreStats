package com.stat.store.dao;

import com.stat.store.entity.AppAndroid;

import javax.ejb.Remote;
import java.util.List;

/**
 * Created by longnguyen on 4/6/15.
 */
@Remote
public interface AndroidDAO extends IDAO<AppAndroid, Integer> {

    public List<AppAndroid> searchByName(String name);// from service

    public boolean checkExistedApp(String appId);

    public AppAndroid getAppById(String appId);

    public boolean deleteAppById(String appId);

    public List<AppAndroid> getAppsByUserId(int user_id);// from local
}
