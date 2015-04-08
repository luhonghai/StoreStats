package com.stat.store.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by longnguyen on 4/5/15.
 */
@Entity
@Table(name = "App_iOS", schema = "", catalog = "store_stats")
@NamedQueries({
        @NamedQuery(name = "AppIOS.GetAppByArtwork", query = "select a from AppIOs a where a.artworkUrl = :artworkUrl"),
        @NamedQuery(name = "AppIOS.GetAppByAppName", query = "select a from AppIOs a where a.trackName = :trackName"),
        @NamedQuery(name = "AppIOS.GetAppByTrackID", query = "select a from AppIOs a where a.trackId = :trackId"),
        @NamedQuery(name = "AppIOS.GetAppBySellerID",query = "select a from AppIOs a where a.artistId = :artistId"),
        @NamedQuery(name = "AppIOS.UnFollow", query = "delete from AppIOs a where a.trackId = :trackId"),
        @NamedQuery(name = "AppIOS.GetAppOfUser", query = "select a from AppIOs a where a.userId = :user_id")
})
public class AppIOs implements Serializable {
    private int id;
    private int userId;
    private String artworkUrl;
    private String sellerName;
    private Double price;
    private String version;
    private String description;
    private String releaseDate;
    private String bundleId;
    private String trackId;
    private String releaseNotes;
    private String trackContentRating;
    private String averageUserRating;
    private String userRatingCount;
    private String trackName;
    private String artistId;
    private String screenShot1;
    private String screenShot2;
    private String screenShot3;
    private String screenShot4;
    private String screenShot5;

    @Id
    @Column(name = "Id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "User_id")
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "ArtworkUrl")
    public String getArtworkUrl() {
        return artworkUrl;
    }

    public void setArtworkUrl(String artworkUrl) {
        this.artworkUrl = artworkUrl;
    }

    @Basic
    @Column(name = "SellerName")
    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    @Basic
    @Column(name = "Price")
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
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
    @Column(name = "ReleaseDate")
    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    @Basic
    @Column(name = "BundleId")
    public String getBundleId() {
        return bundleId;
    }

    public void setBundleId(String bundleId) {
        this.bundleId = bundleId;
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
    @Column(name = "ReleaseNotes")
    public String getReleaseNotes() {
        return releaseNotes;
    }

    public void setReleaseNotes(String releaseNotes) {
        this.releaseNotes = releaseNotes;
    }

    @Basic
    @Column(name = "TrackContentRating")
    public String getTrackContentRating() {
        return trackContentRating;
    }

    public void setTrackContentRating(String trackContentRating) {
        this.trackContentRating = trackContentRating;
    }

    @Basic
    @Column(name = "AverageUserRating")
    public String getAverageUserRating() {
        return averageUserRating;
    }

    public void setAverageUserRating(String averageUserRating) {
        this.averageUserRating = averageUserRating;
    }

    @Basic
    @Column(name = "UserRatingCount")
    public String getUserRatingCount() {
        return userRatingCount;
    }

    public void setUserRatingCount(String userRatingCount) {
        this.userRatingCount = userRatingCount;
    }

    @Basic
    @Column(name = "TrackName")
    public String getTrackName() {
        return trackName;
    }

    public void setTrackName(String trackName) {
        this.trackName = trackName;
    }

    @Basic
    @Column(name = "ArtistId")
    public String getArtistId() {
        return artistId;
    }

    public void setArtistId(String artistId) {
        this.artistId = artistId;
    }

    @Basic
    @Column(name = "ScreenShot1")
    public String getScreenShot1() {
        return screenShot1;
    }

    public void setScreenShot1(String screenShot1) {
        this.screenShot1 = screenShot1;
    }

    @Basic
    @Column(name = "ScreenShot2")
    public String getScreenShot2() {
        return screenShot2;
    }

    public void setScreenShot2(String screenShot2) {
        this.screenShot2 = screenShot2;
    }

    @Basic
    @Column(name = "ScreenShot3")
    public String getScreenShot3() {
        return screenShot3;
    }

    public void setScreenShot3(String screenShot3) {
        this.screenShot3 = screenShot3;
    }

    @Basic
    @Column(name = "ScreenShot4")
    public String getScreenShot4() {
        return screenShot4;
    }

    public void setScreenShot4(String screenShot4) {
        this.screenShot4 = screenShot4;
    }

    @Basic
    @Column(name = "ScreenShot5")
    public String getScreenShot5() {
        return screenShot5;
    }

    public void setScreenShot5(String screenShot5) {
        this.screenShot5 = screenShot5;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AppIOs appIOs = (AppIOs) o;

        if (id != appIOs.id) return false;
        if (userId != appIOs.userId) return false;
        if (artistId != null ? !artistId.equals(appIOs.artistId) : appIOs.artistId != null) return false;
        if (artworkUrl != null ? !artworkUrl.equals(appIOs.artworkUrl) : appIOs.artworkUrl != null) return false;
        if (averageUserRating != null ? !averageUserRating.equals(appIOs.averageUserRating) : appIOs.averageUserRating != null)
            return false;
        if (bundleId != null ? !bundleId.equals(appIOs.bundleId) : appIOs.bundleId != null) return false;
        if (description != null ? !description.equals(appIOs.description) : appIOs.description != null) return false;
        if (price != null ? !price.equals(appIOs.price) : appIOs.price != null) return false;
        if (releaseDate != null ? !releaseDate.equals(appIOs.releaseDate) : appIOs.releaseDate != null) return false;
        if (releaseNotes != null ? !releaseNotes.equals(appIOs.releaseNotes) : appIOs.releaseNotes != null)
            return false;
        if (sellerName != null ? !sellerName.equals(appIOs.sellerName) : appIOs.sellerName != null) return false;
        if (trackContentRating != null ? !trackContentRating.equals(appIOs.trackContentRating) : appIOs.trackContentRating != null)
            return false;
        if (trackId != null ? !trackId.equals(appIOs.trackId) : appIOs.trackId != null) return false;
        if (trackName != null ? !trackName.equals(appIOs.trackName) : appIOs.trackName != null) return false;
        if (userRatingCount != null ? !userRatingCount.equals(appIOs.userRatingCount) : appIOs.userRatingCount != null)
            return false;
        if (version != null ? !version.equals(appIOs.version) : appIOs.version != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + userId;
        result = 31 * result + (artworkUrl != null ? artworkUrl.hashCode() : 0);
        result = 31 * result + (sellerName != null ? sellerName.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (version != null ? version.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (releaseDate != null ? releaseDate.hashCode() : 0);
        result = 31 * result + (bundleId != null ? bundleId.hashCode() : 0);
        result = 31 * result + (trackId != null ? trackId.hashCode() : 0);
        result = 31 * result + (releaseNotes != null ? releaseNotes.hashCode() : 0);
        result = 31 * result + (trackContentRating != null ? trackContentRating.hashCode() : 0);
        result = 31 * result + (averageUserRating != null ? averageUserRating.hashCode() : 0);
        result = 31 * result + (userRatingCount != null ? userRatingCount.hashCode() : 0);
        result = 31 * result + (trackName != null ? trackName.hashCode() : 0);
        result = 31 * result + (artistId != null ? artistId.hashCode() : 0);
        return result;
    }


}
