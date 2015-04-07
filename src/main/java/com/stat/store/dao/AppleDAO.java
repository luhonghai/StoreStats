package com.stat.store.dao;

import com.stat.store.entity.AppIOs;

import javax.ejb.Remote;
import java.util.List;

/**
 * Created by longnguyen on 4/5/15.
 */

@Remote
public interface AppleDAO extends IDAO<AppIOs, Integer>{

    public List<AppIOs> getAppsFromService(String uri);

    public AppIOs getAppDetailService(String url);

    public AppIOs getAppByArtworkUrl(String artwork);

    public AppIOs getAppByAppName(String appName);

    public AppIOs getAppByTrackId(String track_id);

    public List<AppIOs> getAppsBySeller(String artist_id);

}
