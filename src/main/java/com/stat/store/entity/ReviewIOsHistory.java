package com.stat.store.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

/**
 * Created by longnguyen on 4/18/15.
 */
@Entity
@Table(name = "Review_iOS_History", schema = "", catalog = "store_stats")
@NamedQueries({
        @NamedQuery(name = "iOS_History.GetByReviewTrackId", query = "select i from ReviewIOsHistory i where i.trackId = :trackId")
})
public class ReviewIOsHistory implements Serializable {
    private int id;
    private String rating;
    private Date updatedDate;
    private String trackId;

    @Id
    @Column(name = "Id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "UpdatedDate")
    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    @Basic
    @Column(name = "TrackId")
    public String getTrackId() {
        return trackId;
    }

    public void setTrackId(String trackId) {
        this.trackId = trackId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ReviewIOsHistory that = (ReviewIOsHistory) o;

        if (id != that.id) return false;
        if (rating != null ? !rating.equals(that.rating) : that.rating != null) return false;
        if (trackId != null ? !trackId.equals(that.trackId) : that.trackId != null) return false;
        if (updatedDate != null ? !updatedDate.equals(that.updatedDate) : that.updatedDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (rating != null ? rating.hashCode() : 0);
        result = 31 * result + (updatedDate != null ? updatedDate.hashCode() : 0);
        result = 31 * result + (trackId != null ? trackId.hashCode() : 0);
        return result;
    }
}
