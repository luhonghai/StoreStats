package com.stat.store.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by longnguyen on 4/5/15.
 */
@Entity
@Table(name = "Review_iOS", schema = "", catalog = "store_stats")
@NamedQueries({
        @NamedQuery(name = "ReviewIOS.GetReviewByTrackingId", query = "select r from ReviewIOs r where r.trackId = :trackId")
})
public class ReviewIOs implements Serializable {
    private int id;
    private String trackId;
    private String title;
    private String author;
    private String message;
    private String rating;
    private String version;
    private String updateDate;
    private String bundleId;

    @Id
    @Column(name = "Id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "TrackId")
    public String getTrackId() {
        return trackId;
    }

    public void setTrackId(String trackId) {
        this.trackId = trackId;
    }

    @Basic
    @Column(name = "Title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "Author")
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Basic
    @Column(name = "Message")
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Basic
    @Column(name = "Rating")
    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    @Basic
    @Column(name = "Version")
    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    @Basic
    @Column(name = "UpdateDate")
    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    @Basic
    @Column(name = "BundleId")
    public String getBundleId() {
        return bundleId;
    }

    public void setBundleId(String bundleId) {
        this.bundleId = bundleId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ReviewIOs reviewIOs = (ReviewIOs) o;

        if (id != reviewIOs.id) return false;
        if (author != null ? !author.equals(reviewIOs.author) : reviewIOs.author != null) return false;
        if (bundleId != null ? !bundleId.equals(reviewIOs.bundleId) : reviewIOs.bundleId != null) return false;
        if (message != null ? !message.equals(reviewIOs.message) : reviewIOs.message != null) return false;
        if (rating != null ? !rating.equals(reviewIOs.rating) : reviewIOs.rating != null) return false;
        if (title != null ? !title.equals(reviewIOs.title) : reviewIOs.title != null) return false;
        if (trackId != null ? !trackId.equals(reviewIOs.trackId) : reviewIOs.trackId != null) return false;
        if (updateDate != null ? !updateDate.equals(reviewIOs.updateDate) : reviewIOs.updateDate != null) return false;
        if (version != null ? !version.equals(reviewIOs.version) : reviewIOs.version != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (trackId != null ? trackId.hashCode() : 0);
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (author != null ? author.hashCode() : 0);
        result = 31 * result + (message != null ? message.hashCode() : 0);
        result = 31 * result + (rating != null ? rating.hashCode() : 0);
        result = 31 * result + (version != null ? version.hashCode() : 0);
        result = 31 * result + (updateDate != null ? updateDate.hashCode() : 0);
        result = 31 * result + (bundleId != null ? bundleId.hashCode() : 0);
        return result;
    }
}
