package com.stat.store.dao;

import com.stat.store.entity.ReviewIOs;

import javax.ejb.Remote;
import java.util.List;

/**
 * Created by longnguyen on 4/5/15.
 */

@Remote
public interface ReviewAppleDAO extends IDAO<ReviewIOs, Integer>{

    public List<ReviewIOs> getReviewFromService(String track_id);// get from service

    public List<ReviewIOs> getReviewByTrackId(String track_id);//get from local

}
