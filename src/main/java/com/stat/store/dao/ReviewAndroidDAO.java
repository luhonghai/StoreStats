package com.stat.store.dao;

import com.stat.store.entity.ReviewAndroid;

import javax.ejb.Remote;
import java.util.List;

/**
 * Created by longnguyen on 4/6/15.
 */
@Remote
public interface ReviewAndroidDAO extends IDAO<ReviewAndroid,Integer> {

    public List<ReviewAndroid> getCommentByAppId(String app_id); //get from service

    public List<ReviewAndroid> getReviewsByAppid(String app_id);  //get from local

}
