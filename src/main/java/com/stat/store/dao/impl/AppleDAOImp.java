package com.stat.store.dao.impl;

import com.stat.store.dao.AbstractDAO;
import com.stat.store.dao.AppleDAO;
import com.stat.store.entity.AppIOs;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import javax.ejb.Stateless;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by longnguyen on 4/5/15.
 */
@Stateless(name = "AppleEJB")
public class AppleDAOImp extends AbstractDAO<AppIOs, Integer> implements AppleDAO {

    public AppleDAOImp() {
        super(AppIOs.class);
    }

    @Override
    public List<AppIOs> getAppsFromService(String uri) {
        // Parse JSON - https://itunes.apple.com/search?term=keyword&country=tr&entity=software&limit=100
        List<AppIOs> appList=new ArrayList<AppIOs>();

        try {
            URL url = new URL(uri);
            HttpURLConnection req = (HttpURLConnection) url.openConnection();
            req.connect();

            JSONParser jsonParser = new JSONParser();

            JSONObject jsonObject = (JSONObject) jsonParser.parse(new InputStreamReader((InputStream) req.getContent()));

            JSONArray jsonArray = (JSONArray) jsonObject.get("results");

            for(Iterator<JSONObject> i = jsonArray.iterator(); i.hasNext(); ) {
                JSONObject jsonApp = i.next();
                AppIOs app = new AppIOs();

                if (jsonApp.get("artworkUrl60") != null)
                    app.setArtworkUrl((String) jsonApp.get("artworkUrl512"));
                if (jsonApp.get("averageUserRating") != null)
                    app.setAverageUserRating(jsonApp.get("averageUserRating")+"");
                if (jsonApp.get("bundleId") != null)
                    app.setBundleId(jsonApp.get("bundleId")+"");
                if (jsonApp.get("description") != null)
                    app.setDescription((String) jsonApp.get("description"));
                if (jsonApp.get("price") != null)
                    app.setPrice((Double) jsonApp.get("price"));
                if (jsonApp.get("releaseDate") != null)
                    app.setReleaseDate((String) jsonApp.get("releaseDate"));
                if (jsonApp.get("releaseNotes") != null)
                    app.setReleaseNotes((String) jsonApp.get("releaseNotes"));
                if (jsonApp.get("trackName") != null)
                    app.setTrackName((String) jsonApp.get("trackName"));
                if (jsonApp.get("sellerName") != null)
                    app.setSellerName((String) jsonApp.get("sellerName"));
                if (jsonApp.get("trackId") != null)
                    app.setTrackId(jsonApp.get("trackId")+"");
                if (jsonApp.get("artistId") != null)
                    app.setArtistId(jsonApp.get("artistId")+"");
                if (jsonApp.get("trackContentRating") != null)
                    app.setTrackContentRating((String) jsonApp.get("trackContentRating"));
                if (jsonApp.get("userRatingCount") != null)
                    app.setUserRatingCount(jsonApp.get("userRatingCount")+"");
                if (jsonApp.get("version") != null)
                    app.setVersion((String) jsonApp.get("version"));

                appList.add(app);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }

        return appList;
    }

    @Override
    public AppIOs getAppDetailService(String url) {
        // Parse JSON - https://itunes.apple.com/lookup?id=track_id
        AppIOs app = new AppIOs();
        try {
            URL http = new URL(url);
            HttpURLConnection req = (HttpURLConnection) http.openConnection();
            req.connect();

            JSONParser jsonParser = new JSONParser();

            JSONObject jsonObject = (JSONObject) jsonParser.parse(new InputStreamReader((InputStream) req.getContent()));

            JSONArray jsonArray = (JSONArray) jsonObject.get("results");

            for(Iterator<JSONObject> i = jsonArray.iterator(); i.hasNext(); ) {
                JSONObject jsonApp = i.next();

                if (jsonApp.get("artworkUrl60") != null)
                    app.setArtworkUrl((String) jsonApp.get("artworkUrl512"));
                if (jsonApp.get("averageUserRating") != null)
                    app.setAverageUserRating(jsonApp.get("averageUserRating")+"");
                if (jsonApp.get("bundleId") != null)
                    app.setBundleId(jsonApp.get("bundleId")+"");
                if (jsonApp.get("description") != null)
                    app.setDescription((String) jsonApp.get("description"));
                if (jsonApp.get("price") != null)
                    app.setPrice((Double) jsonApp.get("price"));
                if (jsonApp.get("releaseDate") != null)
                    app.setReleaseDate((String) jsonApp.get("releaseDate"));
                if (jsonApp.get("releaseNotes") != null)
                    app.setReleaseNotes((String) jsonApp.get("releaseNotes"));
                if (jsonApp.get("trackName") != null)
                    app.setTrackName((String) jsonApp.get("trackName"));
                if (jsonApp.get("sellerName") != null)
                    app.setSellerName((String) jsonApp.get("sellerName"));
                if (jsonApp.get("trackId") != null)
                    app.setTrackId(jsonApp.get("trackId")+"");
                if (jsonApp.get("artistId") != null)
                    app.setArtistId(jsonApp.get("artistId")+"");
                if (jsonApp.get("trackContentRating") != null)
                    app.setTrackContentRating((String) jsonApp.get("trackContentRating"));
                if (jsonApp.get("userRatingCount") != null)
                    app.setUserRatingCount(jsonApp.get("userRatingCount")+"");
                if (jsonApp.get("version") != null)
                    app.setVersion((String) jsonApp.get("version"));
                if (jsonApp.get("screenshotUrls") != null){
                    JSONArray screenshots = (JSONArray) jsonApp.get("screenshotUrls");
                    if(screenshots.size() == 1){
                        app.setScreenShot1(((JSONArray)jsonApp.get("screenshotUrls")).get(0)+"");
                    }else if(screenshots.size() == 2){
                        app.setScreenShot1(((JSONArray)jsonApp.get("screenshotUrls")).get(0)+"");
                        app.setScreenShot2(((JSONArray)jsonApp.get("screenshotUrls")).get(1)+"");
                    }else if(screenshots.size() == 3){
                        app.setScreenShot1(((JSONArray)jsonApp.get("screenshotUrls")).get(0)+"");
                        app.setScreenShot2(((JSONArray)jsonApp.get("screenshotUrls")).get(1)+"");
                        app.setScreenShot3(((JSONArray)jsonApp.get("screenshotUrls")).get(2)+"");
                    }else if(screenshots.size() == 4){
                        app.setScreenShot1(((JSONArray)jsonApp.get("screenshotUrls")).get(0)+"");
                        app.setScreenShot2(((JSONArray)jsonApp.get("screenshotUrls")).get(1)+"");
                        app.setScreenShot3(((JSONArray)jsonApp.get("screenshotUrls")).get(2)+"");
                        app.setScreenShot4(((JSONArray)jsonApp.get("screenshotUrls")).get(3)+"");
                    }else if(screenshots.size() == 5){
                        app.setScreenShot1(((JSONArray)jsonApp.get("screenshotUrls")).get(0)+"");
                        app.setScreenShot2(((JSONArray)jsonApp.get("screenshotUrls")).get(1)+"");
                        app.setScreenShot3(((JSONArray)jsonApp.get("screenshotUrls")).get(2)+"");
                        app.setScreenShot4(((JSONArray)jsonApp.get("screenshotUrls")).get(3)+"");
                        app.setScreenShot5(((JSONArray)jsonApp.get("screenshotUrls")).get(4)+"");
                    }
                }

            }
        }catch (Exception e) {
            e.printStackTrace();
        }

        return app;
    }

    @Override
    public AppIOs getAppByArtworkUrl(String artwork) {
        return (AppIOs)getEm().createNamedQuery("AppIOS.GetAppByArtwork")
                .setParameter("artworkUrl", artwork).getSingleResult();
    }

    @Override
    public AppIOs getAppByAppName(String appName) {
        return (AppIOs)getEm().createNamedQuery("AppIOS.GetAppByAppName")
                .setParameter("trackName", appName).getSingleResult();
    }

    @Override
    public AppIOs getAppByTrackId(String track_id) {
        return (AppIOs)getEm().createNamedQuery("AppIOS.GetAppByTrackID")
                .setParameter("trackId", track_id).getSingleResult();
    }

    @Override
    public List<AppIOs> getAppsBySeller(String artist_id) {
        return (List<AppIOs>)getEm().createNamedQuery("AppIOS.GetAppBySellerID")
                .setParameter("artistId", artist_id).getResultList();
    }

    @Override
    public boolean checkExistedApp(String track_id) {
        if(getAppByTrackId(track_id) != null){
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteAppById(String track_id) {
        int result = getEm().createNamedQuery("AppIOS.UnFollow").setParameter("trackId", track_id).executeUpdate();
        if(result > 0){
            return true;
        }
        return false;
    }

    @Override
    public List<AppIOs> getAppsByUserId(int user_id) {
        return (List<AppIOs>)getEm().createNamedQuery("AppIOS.GetAppOfUser").setParameter("user_id", user_id).getResultList();
    }
}
