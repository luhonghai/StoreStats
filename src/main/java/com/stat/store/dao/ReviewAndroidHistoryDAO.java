package com.stat.store.dao;

import com.stat.store.entity.ReviewAndroidHistory;

import javax.ejb.Remote;
import java.util.List;

/**
 * Created by longnguyen on 4/18/15.
 */
@Remote
public interface ReviewAndroidHistoryDAO extends IDAO<ReviewAndroidHistory, Integer>{
    public List<ReviewAndroidHistory> getByPackageName(String packageName);
}
