package com.stat.store.dao.impl;

import com.stat.store.dao.AbstractDAO;
import com.stat.store.dao.AppleDAO;
import com.stat.store.entity.AppIOs;
import com.sun.syndication.feed.synd.SyndEntryImpl;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;
import org.jdom.Element;
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
        List<AppIOs> appList = new ArrayList<AppIOs>();

        try {
            URL url = new URL(uri);
            HttpURLConnection req = (HttpURLConnection) url.openConnection();
            req.connect();

            JSONParser jsonParser = new JSONParser();

            JSONObject jsonObject = (JSONObject) jsonParser.parse(new InputStreamReader((InputStream) req.getContent()));

            JSONArray jsonArray = (JSONArray) jsonObject.get("results");

            for (Iterator<JSONObject> i = jsonArray.iterator(); i.hasNext(); ) {
                JSONObject jsonApp = i.next();
                AppIOs app = new AppIOs();

                if (jsonApp.get("artworkUrl60") != null)
                    app.setArtworkUrl((String) jsonApp.get("artworkUrl512"));
                if (jsonApp.get("averageUserRating") != null)
                    app.setAverageUserRating(jsonApp.get("averageUserRating") + "");
                if (jsonApp.get("bundleId") != null)
                    app.setBundleId(jsonApp.get("bundleId") + "");
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
                    app.setTrackId(jsonApp.get("trackId") + "");
                if (jsonApp.get("artistId") != null)
                    app.setArtistId(jsonApp.get("artistId") + "");
                if (jsonApp.get("trackContentRating") != null)
                    app.setTrackContentRating((String) jsonApp.get("trackContentRating"));
                if (jsonApp.get("userRatingCount") != null)
                    app.setUserRatingCount(jsonApp.get("userRatingCount") + "");
                if (jsonApp.get("version") != null)
                    app.setVersion((String) jsonApp.get("version"));

                appList.add(app);
            }
        } catch (Exception e) {
            e.printStackTrace();

        }

        return appList;
    }

    @Override
    public AppIOs getAppDetailService(String url) {
        // Parse JSON - https://itunes.apple.com/lookup?id=track_id
        AppIOs app = null;
        try {
            URL http = new URL(url);
            HttpURLConnection req = (HttpURLConnection) http.openConnection();
            req.connect();

            JSONParser jsonParser = new JSONParser();

            JSONObject jsonObject = (JSONObject) jsonParser.parse(new InputStreamReader((InputStream) req.getContent()));

            JSONArray jsonArray = (JSONArray) jsonObject.get("results");
            if(jsonArray != null && jsonArray.size() > 0){
                app = new AppIOs();
                for (Iterator<JSONObject> i = jsonArray.iterator(); i.hasNext(); ) {
                    JSONObject jsonApp = i.next();

                    if (jsonApp.get("artworkUrl60") != null)
                        app.setArtworkUrl((String) jsonApp.get("artworkUrl512"));
                    if (jsonApp.get("averageUserRating") != null)
                        app.setAverageUserRating(jsonApp.get("averageUserRating") + "");
                    if (jsonApp.get("bundleId") != null)
                        app.setBundleId(jsonApp.get("bundleId") + "");
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
                        app.setTrackId(jsonApp.get("trackId") + "");
                    if (jsonApp.get("artistId") != null)
                        app.setArtistId(jsonApp.get("artistId") + "");
                    if (jsonApp.get("trackContentRating") != null)
                        app.setTrackContentRating((String) jsonApp.get("trackContentRating"));
                    if (jsonApp.get("userRatingCount") != null)
                        app.setUserRatingCount(jsonApp.get("userRatingCount") + "");
                    if (jsonApp.get("version") != null)
                        app.setVersion((String) jsonApp.get("version"));
                    if (jsonApp.get("screenshotUrls") != null) {
                        JSONArray screenshots = (JSONArray) jsonApp.get("screenshotUrls");
                        if (screenshots.size() == 1) {
                            app.setScreenShot1(screenshots.get(0) + "");
                        } else if (screenshots.size() == 2) {
                            app.setScreenShot1(screenshots.get(0) + "");
                            app.setScreenShot2(screenshots.get(1) + "");
                        } else if (screenshots.size() == 3) {
                            app.setScreenShot1(screenshots.get(0) + "");
                            app.setScreenShot2(screenshots.get(1) + "");
                            app.setScreenShot3(screenshots.get(2) + "");
                        } else if (screenshots.size() == 4) {
                            app.setScreenShot1(screenshots.get(0) + "");
                            app.setScreenShot2(screenshots.get(1) + "");
                            app.setScreenShot3(screenshots.get(2) + "");
                            app.setScreenShot4(screenshots.get(3) + "");
                        } else if (screenshots.size() == 5) {
                            app.setScreenShot1(screenshots.get(0) + "");
                            app.setScreenShot2(screenshots.get(1) + "");
                            app.setScreenShot3(screenshots.get(2) + "");
                            app.setScreenShot4(screenshots.get(3) + "");
                            app.setScreenShot5(screenshots.get(4) + "");
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return app;
    }

    @Override
    public AppIOs getAppByArtworkUrl(String artwork) {
        return (AppIOs) getEm().createNamedQuery("AppIOS.GetAppByArtwork")
                .setParameter("artworkUrl", artwork).getSingleResult();
    }

    @Override
    public AppIOs getAppByAppName(String appName) {
        return (AppIOs) getEm().createNamedQuery("AppIOS.GetAppByAppName")
                .setParameter("trackName", appName).getSingleResult();
    }

    @Override
    public AppIOs getAppByTrackId(String track_id) {
        return (AppIOs) getEm().createNamedQuery("AppIOS.GetAppByTrackID")
                .setParameter("trackId", track_id).getSingleResult();
    }

    @Override
    public List<AppIOs> getAppsBySeller(String artist_id) {
        return (List<AppIOs>) getEm().createNamedQuery("AppIOS.GetAppBySellerID")
                .setParameter("artistId", artist_id).getResultList();
    }

    @Override
    public boolean checkExistedApp(String track_id, int user_id) {
        try {
            AppIOs app = (AppIOs) getEm().createNamedQuery("AppIOS.CheckExisted").setParameter("track_id", track_id)
                    .setParameter("user_id", user_id).getSingleResult();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean deleteAppById(String track_id, int user_id) {
        int result = getEm().createNamedQuery("AppIOS.UnFollow").setParameter("trackId", track_id)
                .setParameter("user_id", user_id).executeUpdate();
        if (result > 0) {
            return true;
        }
        return false;
    }

    @Override
    public List<AppIOs> getAppsByUserId(int user_id) {
        return (List<AppIOs>) getEm().createNamedQuery("AppIOS.GetAppOfUser").setParameter("user_id", user_id).getResultList();
    }

    @Override
    public List<AppIOs> getTop10FreeApp() {
        String url = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topfreeapplications/limit=10/xml";
        List<AppIOs> iosList = new ArrayList<AppIOs>();
        SyndFeedInput syndFeedInput = new SyndFeedInput();
        SyndFeed syndFeed;

        try {
            XmlReader xmlReader = new XmlReader(new URL(url));
            syndFeed = syndFeedInput.build(xmlReader);

            Iterator it = syndFeed.getEntries().iterator();
            while (it.hasNext()) {
                SyndEntryImpl feed = (SyndEntryImpl) it.next();


                AppIOs app = getAppDetailService("https://itunes.apple.com/lookup?id="+feed.getLink().substring(feed.getLink().indexOf("id")+2, feed.getLink().indexOf("?")));

                iosList.add(app);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return iosList;
    }
}
