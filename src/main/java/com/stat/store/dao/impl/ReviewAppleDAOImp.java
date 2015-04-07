package com.stat.store.dao.impl;

import com.stat.store.dao.AbstractDAO;
import com.stat.store.dao.ReviewAppleDAO;
import com.stat.store.entity.AppIOs;
import com.stat.store.entity.ReviewIOs;
import com.sun.syndication.feed.synd.SyndContentImpl;
import com.sun.syndication.feed.synd.SyndEntryImpl;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;
import org.jdom.Element;

import javax.ejb.Stateless;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by longnguyen on 4/5/15.
 */
@Stateless(name = "ReviewAppleEJB")
public class ReviewAppleDAOImp extends AbstractDAO<ReviewIOs, Integer> implements ReviewAppleDAO{

    public ReviewAppleDAOImp() {
        super(ReviewIOs.class);
    }

    @Override
    public List<ReviewIOs> getReviewFromService(String url, AppIOs app) {
        //Parse XML - "http://itunes.apple.com/tr/rss/customerreviews/id=496489138/xml";
        List<ReviewIOs> reviewIOsList = new ArrayList<ReviewIOs>();
        SyndFeedInput syndFeedInput = new SyndFeedInput();
        SyndFeed syndFeed;

        try{
            XmlReader xmlReader = new XmlReader(new URL(url));
            syndFeed = syndFeedInput.build(xmlReader);

            Iterator it = syndFeed.getEntries().iterator();
            while(it.hasNext()){
                SyndEntryImpl feed = (SyndEntryImpl)it.next();

                SyndContentImpl content = (SyndContentImpl)feed.getContents().get(0);

                if(feed.getAuthor()!=null&&!feed.getAuthor().equals("")) {

                    ReviewIOs review = new ReviewIOs();
                    review.setAuthor(feed.getAuthor());
                    review.setMessage(content.getValue());
                    review.setTitle(feed.getTitleEx().getValue());
                    review.setUpdateDate(feed.getUpdatedDate().toString());
                    review.setTrackId(app.getTrackId());
                    review.setBundleId(app.getBundleId());


                    List<Element> foreignMarkups = (List<Element>) feed.getForeignMarkup();
                    for (Element foreignMarkup : foreignMarkups) {
                        // if (foreignMarkup.getNamespaceURI().equals("im")) {
                        // we got our custom module, now parse it
                        if (foreignMarkup.getName().equals("rating")) {
                            review.setRating(foreignMarkup.getValue());

                        } else if (foreignMarkup.getName().equals("version")) {
                            review.setVersion(foreignMarkup.getValue());

                        }
                    }

                    reviewIOsList.add(review);
                }
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return reviewIOsList;
    }

    @Override
    public List<ReviewIOs> getReviewByTrackId(String track_id) {
        return (List<ReviewIOs>)getEm().createNamedQuery("ReviewIOS.GetReviewByTrackingId")
                .setParameter("trackId", track_id).getResultList();
    }
}
