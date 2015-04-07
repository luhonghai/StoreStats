package com.stat.store.dao;

import com.stat.store.entity.ReviewAndroid;

import java.util.List;

/**
 * Created by longnguyen on 4/6/15.
 */
public interface ReviewAndroidDAO extends IDAO<ReviewAndroid,Integer> {

    public List<ReviewAndroid> getCommentByAppId(String app_id);

}
