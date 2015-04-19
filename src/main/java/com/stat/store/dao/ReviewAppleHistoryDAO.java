package com.stat.store.dao;

import com.stat.store.entity.ReviewIOsHistory;

import javax.ejb.Remote;
import java.util.List;

/**
 * Created by longnguyen on 4/18/15.
 */
@Remote
public interface ReviewAppleHistoryDAO extends IDAO<ReviewIOsHistory, Integer> {
    public List<ReviewIOsHistory> getByTrackId(String trackId);
}
