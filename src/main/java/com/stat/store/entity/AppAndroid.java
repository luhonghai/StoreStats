package com.stat.store.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by longnguyen on 4/5/15.
 */
@Entity
@Table(name = "App_Android", schema = "", catalog = "store_stats")
@NamedQueries({
        @NamedQuery(name = "Android.CheckExisted", query = "select a from AppAndroid a where a.appId = :appId and a.userId = :userId"),
        @NamedQuery(name = "Android.UnFollow", query = "delete from AppAndroid a where a.appId = :appId and a.userId = :userId"),
        @NamedQuery(name = "Android.GetAppOfUser", query = "select a from AppAndroid a where a.userId = :user_id"),
        @NamedQuery(name = "Android.GetAppById", query = "select a from AppAndroid a where a.appId = :appId")
})
public class AppAndroid implements Serializable{
    private int id;
    private int userId;
    private String title;
    private String creator;
    private String creatorId;
    private String appId;
    private String packageName;
    private String price;
    private String rating;
    private String ratingCount;
    private String version;
    private String description;
    private String downloadCount;
    private String promotionText;
    private String category;
    private String appType;

    @Id
    @Column(name = "Id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "User_Id")
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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
    @Column(name = "Creator")
    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    @Basic
    @Column(name = "CreatorId")
    public String getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(String creatorId) {
        this.creatorId = creatorId;
    }

    @Basic
    @Column(name = "AppId")
    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    @Basic
    @Column(name = "PackageName")
    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    @Basic
    @Column(name = "Price")
    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
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
    @Column(name = "RatingCount")
    public String getRatingCount() {
        return ratingCount;
    }

    public void setRatingCount(String ratingCount) {
        this.ratingCount = ratingCount;
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
    @Column(name = "Description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "DownloadCount")
    public String getDownloadCount() {
        return downloadCount;
    }

    public void setDownloadCount(String downloadCount) {
        this.downloadCount = downloadCount;
    }

    @Basic
    @Column(name = "PromotionText")
    public String getPromotionText() {
        return promotionText;
    }

    public void setPromotionText(String promotionText) {
        this.promotionText = promotionText;
    }

    @Basic
    @Column(name = "Category")
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Basic
    @Column(name = "AppType")
    public String getAppType() {
        return appType;
    }

    public void setAppType(String appType) {
        this.appType = appType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AppAndroid that = (AppAndroid) o;

        if (id != that.id) return false;
        if (userId != that.userId) return false;
        if (appId != null ? !appId.equals(that.appId) : that.appId != null) return false;
        if (appType != null ? !appType.equals(that.appType) : that.appType != null) return false;
        if (category != null ? !category.equals(that.category) : that.category != null) return false;
        if (creator != null ? !creator.equals(that.creator) : that.creator != null) return false;
        if (creatorId != null ? !creatorId.equals(that.creatorId) : that.creatorId != null) return false;
        if (description != null ? !description.equals(that.description) : that.description != null) return false;
        if (downloadCount != null ? !downloadCount.equals(that.downloadCount) : that.downloadCount != null)
            return false;
        if (packageName != null ? !packageName.equals(that.packageName) : that.packageName != null) return false;
        if (price != null ? !price.equals(that.price) : that.price != null) return false;
        if (promotionText != null ? !promotionText.equals(that.promotionText) : that.promotionText != null)
            return false;
        if (rating != null ? !rating.equals(that.rating) : that.rating != null) return false;
        if (ratingCount != null ? !ratingCount.equals(that.ratingCount) : that.ratingCount != null) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (version != null ? !version.equals(that.version) : that.version != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + userId;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (creator != null ? creator.hashCode() : 0);
        result = 31 * result + (creatorId != null ? creatorId.hashCode() : 0);
        result = 31 * result + (appId != null ? appId.hashCode() : 0);
        result = 31 * result + (packageName != null ? packageName.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (rating != null ? rating.hashCode() : 0);
        result = 31 * result + (ratingCount != null ? ratingCount.hashCode() : 0);
        result = 31 * result + (version != null ? version.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (downloadCount != null ? downloadCount.hashCode() : 0);
        result = 31 * result + (promotionText != null ? promotionText.hashCode() : 0);
        result = 31 * result + (category != null ? category.hashCode() : 0);
        result = 31 * result + (appType != null ? appType.hashCode() : 0);
        return result;
    }
}
