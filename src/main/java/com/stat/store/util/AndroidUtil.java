package com.stat.store.util;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by longnguyen on 4/10/15.
 */
public class AndroidUtil {

    public static String getArtworkUrl(String package_name){
        Document doc;
        String imageUrl="";
        try {
            //get icon
            doc = Jsoup.connect("https://market.android.com/details?id="+package_name).get();
            Elements images = doc.select("img.cover-image");
            for (int i=0; i<images.size(); i++) {
                imageUrl = images.get(0).absUrl("src");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return imageUrl;
    }

    public static List<String> getScreenshots(String package_name){
        Document doc;
        List<String> list= new ArrayList<String>();
        try {
            //get screenshot
            doc = Jsoup.connect("https://market.android.com/details?id="+package_name).get();
            Elements images = doc.select("img.screenshot");
            for (int i=0; i<images.size(); i++) {
                list.add(images.get(i).absUrl("src"));
                //System.out.println(images.get(i).absUrl("src"));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }
}
