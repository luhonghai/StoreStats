package com.stat.store.dao;

import com.stat.store.entity.AppAndroid;

import java.util.List;

/**
 * Created by longnguyen on 4/6/15.
 */
public interface AndroidDAO extends IDAO<AppAndroid, Integer> {

    public List<AppAndroid> searchByName(String name);

}
