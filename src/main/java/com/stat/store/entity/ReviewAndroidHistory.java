package com.stat.store.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

/**
 * Created by longnguyen on 4/18/15.
 */
@Entity
@Table(name = "Review_Android_History", schema = "", catalog = "store_stats")
@NamedQueries({
        @NamedQuery(name = "Android_History.GetReviewByPackageName", query = "select a from ReviewAndroidHistory a where a.packageName = :packageName")
})
public class ReviewAndroidHistory implements Serializable {
    private int id;
    private String rating;
    private Date updatedDate;
    private String packageName;

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
    @Column(name = "PackageName")
    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ReviewAndroidHistory that = (ReviewAndroidHistory) o;

        if (id != that.id) return false;
        if (packageName != null ? !packageName.equals(that.packageName) : that.packageName != null) return false;
        if (rating != null ? !rating.equals(that.rating) : that.rating != null) return false;
        if (updatedDate != null ? !updatedDate.equals(that.updatedDate) : that.updatedDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (rating != null ? rating.hashCode() : 0);
        result = 31 * result + (updatedDate != null ? updatedDate.hashCode() : 0);
        result = 31 * result + (packageName != null ? packageName.hashCode() : 0);
        return result;
    }
}
