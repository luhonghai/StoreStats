<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.stat.store.service.AppleService" %>
<%@ page import="com.stat.store.entity.AppIOs" %>
<%@ page import="com.stat.store.entity.User" %>
<%@ page import="com.stat.store.entity.ReviewIOs" %>
<%@ page import="java.util.List" %>
<%@ page import="com.stat.store.dao.ReviewAppleDAO" %>
<%@ page import="com.stat.store.service.ReviewAppleService" %>
<%
    String account = "guest";
    boolean isExisted = false;
    AppleService appleService = new AppleService();
    ReviewAppleService reviewService = new ReviewAppleService();
    User member = (User)session.getAttribute("member");
    String track_id = request.getParameter("track_id");
    if(member != null){
        account = "member";
        isExisted = appleService.checkExisted(track_id, member.getId());
    }
    AppIOs app = appleService.getAppDetail(track_id);
    List<ReviewIOs> listReview = reviewService.getReviewsFromService(track_id);
    System.out.println("list review size: " + listReview.size());
%>
<html>
<head>
    <title>Movie_store A Entertainment Category Flat Bootstarp Resposive Website Template | Single :: w3layouts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Movie_store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- start plugins -->
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet'
          type='text/css'>
</head>
<body>
<div class="container">
    <div class="container_wrap">
        <div class="header_top">
            <div class="col-sm-3 logo"><a href="index.jsp"><img src="images/logo.png" alt=""/></a></div>
            <div class="col-sm-6 nav">
                <ul>
                    <li><span class="simptip-position-bottom simptip-movable" data-tooltip="comic"><a
                            href="movie.jsp"> </a></span></li>
                    <li><span class="simptip-position-bottom simptip-movable" data-tooltip="movie"><a
                            href="movie.jsp"> </a> </span></li>
                    <li><span class="simptip-position-bottom simptip-movable" data-tooltip="video"><a
                            href="movie.jsp"> </a></span></li>
                    <li><span class="simptip-position-bottom simptip-movable" data-tooltip="game"><a href="movie.jsp"> </a></span>
                    </li>
                    <li><span class="simptip-position-bottom simptip-movable" data-tooltip="tv"><a href="movie.jsp"> </a></span>
                    </li>
                    <li><span class="simptip-position-bottom simptip-movable" data-tooltip="more"><a href="movie.jsp"> </a></span>
                    </li>
                </ul>
            </div>
            <div class="col-sm-3 header_right">
                <ul class="header_right_box">
                    <li><img src="images/p1.png" alt=""/></li>
                    <%if(member != null){%>
                    <li><p><a href="#"><%=member.getFirstname()%> <%=member.getLastname()%></a></p></li>
                    <%}else{%>
                    <li><p><a href="#">Guest</a></p></li>
                    <%}%>
                    <li class="last"><i class="edit"> </i></li>
                    <div class="clearfix"></div>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="content">
            <div class="movie_top">
                <div class="col-md-9 movie_box">
                    <div class="grid images_3_of_2">
                        <div class="movie_image">
                            <span class="movie_rating"><%=app.getAverageUserRating() != null? app.getAverageUserRating() : "0.0"%></span>
                            <img src="<%=app.getArtworkUrl()%>" class="img-search" alt=""/>
                        </div>
                        <div class="movie_rate">
                            <div class="rating_desc"><p>Your Vote :</p></div>
                            <form action="" class="sky-form">
                                <fieldset>
                                    <section>
                                        <div class="rating">
                                            <input type="radio" name="stars-rating" id="stars-rating-5">
                                            <label for="stars-rating-5"><i class="icon-star"></i></label>
                                            <input type="radio" name="stars-rating" id="stars-rating-4">
                                            <label for="stars-rating-4"><i class="icon-star"></i></label>
                                            <input type="radio" name="stars-rating" id="stars-rating-3">
                                            <label for="stars-rating-3"><i class="icon-star"></i></label>
                                            <input type="radio" name="stars-rating" id="stars-rating-2">
                                            <label for="stars-rating-2"><i class="icon-star"></i></label>
                                            <input type="radio" name="stars-rating" id="stars-rating-1">
                                            <label for="stars-rating-1"><i class="icon-star"></i></label>
                                        </div>
                                    </section>
                                </fieldset>
                            </form>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="desc1 span_3_of_2">
                        <p class="movie_option"><strong>Name: </strong><%=app.getTrackName() != null? app.getTrackName() : ""%></p>

                        <p class="movie_option"><strong>Company: </strong><%=app.getSellerName() != null? app.getSellerName() : ""%></p>

                        <p class="movie_option"><strong>Version: </strong><%=app.getVersion() != null? app.getVersion() : ""%></p>

                        <p class="movie_option"><strong>Release date: </strong><%=app.getReleaseDate() != null? app.getReleaseDate() : ""%></p>
                        <%  String price;
                            if(app.getPrice() > 0){
                                price = app.getPrice() + "$";
                            }else{
                                price = "free";
                            }%>
                        <p class="movie_option"><strong>Price: </strong><%=price%></p>
                        <%  String rating;
                            if(app.getAverageUserRating() != null){
                                rating = app.getAverageUserRating();
                            }else{
                                rating = "0.0";
                            }%>
                        <p class="movie_option"><strong>Rating: </strong><%=rating%></p>

                        <%if(isExisted){%>
                            <div class="button-follow"><a trackid="<%=app.getTrackId()%>" id="btnUnFollow" class="hvr-shutter-out-horizontal">Unfollow</a></div>
                        <%}else{%>
                            <div class="button-follow"><a trackid="<%=app.getTrackId()%>" id="btnFollow" class="hvr-shutter-out-horizontal">Follow</a></div>
                        <%}%>

                    </div>
                    <div class="clearfix"></div>
                    <p class="m_4"><%=app.getDescription() != null? app.getDescription() : ""%></p>

                    <div>
                        <table>
                            <tr>
                                <%if(app.getScreenShot1() != null){%>
                                    <td><img src="<%=app.getScreenShot1()%>" style="width: 200px;"/></td>
                                <%}%>

                                <%if(app.getScreenShot2() != null){%>
                                    <td><img src="<%=app.getScreenShot2()%>" style="width: 200px;"/></td>
                                <%}%>

                                <%if(app.getScreenShot3() != null){%>
                                    <td><img src="<%=app.getScreenShot3()%>" style="width: 200px;"/></td>
                                <%}%>

                                <%if(app.getScreenShot4() != null){%>
                                    <td><img src="<%=app.getScreenShot4()%>" style="width: 200px;"/></td>
                                <%}%>

                                <%if(app.getScreenShot5() != null){%>
                                    <td><img src="<%=app.getScreenShot5()%>" style="width: 200px;"/></td>
                                <%}%>
                            </tr>
                        </table>
                    </div>
                    <div class="single">
                        <%if(listReview != null && listReview.size() >0){%>
                            <h1><%=listReview.size()%> Reviews Recently</h1>
                        <%}else{%>
                            <h1>No Reviews</h1>
                        <%}%>

                        <ul class="single_list">
                            <%if(listReview != null && listReview.size() >0){
                                for(ReviewIOs review: listReview){%>
                            <li>
                                <div class="preview"><a href="#"><img src="images/2.jpg" class="img-responsive" alt=""></a></div>
                                <div class="data">
                                    <div class="title"><%=review.getAuthor()%> / <%=review.getTitle()%> / <%=review.getUpdateDate()%></div>
                                    <p><%=review.getMessage()%></p>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <%}}%>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="movie_img">
                        <div class="grid_2">
                            <img src="images/pic6.jpg" class="img-responsive" alt="">

                            <div class="caption1">
                                <ul class="list_5 list_7">
                                    <li><i class="icon5"> </i>

                                        <p>3,548</p></li>
                                </ul>
                                <i class="icon4 icon6 icon7"> </i>

                                <p class="m_3">Guardians of the Galaxy</p>
                            </div>
                        </div>
                    </div>
                    <div class="grid_2 col_1">
                        <img src="images/pic2.jpg" class="img-responsive" alt="">

                        <div class="caption1">
                            <ul class="list_3 list_7">
                                <li><i class="icon5"> </i>

                                    <p>3,548</p></li>
                            </ul>
                            <i class="icon4 icon7"> </i>

                            <p class="m_3">Guardians of the Galaxy</p>
                        </div>
                    </div>
                    <div class="grid_2 col_1">
                        <img src="images/pic9.jpg" class="img-responsive" alt="">

                        <div class="caption1">
                            <ul class="list_3 list_7">
                                <li><i class="icon5"> </i>

                                    <p>3,548</p></li>
                            </ul>
                            <i class="icon4 icon7"> </i>

                            <p class="m_3">Guardians of the Galaxy</p>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <footer id="footer">
        <div id="footer-3d">
            <div class="gp-container">
                <span class="first-widget-bend"> </span>
            </div>
        </div>
        <div id="footer-widgets" class="gp-footer-larger-first-col">
            <div class="gp-container">
                <div class="footer-widget footer-1">
                    <div class="wpb_wrapper">
                        <img src="images/f_logo.png" alt=""/>
                    </div>
                    <br>

                    <p>It is a long established fact that a reader will be distracted by the readable content of a page.</p>

                    <p class="text">There are many variations of passages of Lorem Ipsum available, but the majority have
                        suffered.</p>
                </div>
                <div class="footer_box">
                    <div class="col_1_of_3 span_1_of_3">
                        <h3>Categories</h3>
                        <ul class="first">
                            <li><a href="#">Dance</a></li>
                            <li><a href="#">History</a></li>
                            <li><a href="#">Specials</a></li>
                        </ul>
                    </div>
                    <div class="col_1_of_3 span_1_of_3">
                        <h3>Information</h3>
                        <ul class="first">
                            <li><a href="#">New products</a></li>
                            <li><a href="#">top sellers</a></li>
                            <li><a href="#">Specials</a></li>
                        </ul>
                    </div>
                    <div class="col_1_of_3 span_1_of_3">
                        <h3>Follow Us</h3>
                        <ul class="first">
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Twitter</a></li>
                            <li><a href="#">Youtube</a></li>
                        </ul>
                        <div class="copy">
                            <p>&copy; 2015 Template by <a href="http://w3layouts.com" target="_blank"> w3layouts</a></p>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </footer>
</div>
</body>
<script>
$(document).ready(function(){
    var account = "<%=account%>";

    $("#btnUnFollow").click(function(){
        if(account == "guest"){
            alert("Please sign in before doing this");
        }else{
            var track_id = $(this).attr("trackid");
            $.ajax({
                type: "POST",
                url: "AppIOSHandler",
                data: "track_id="+track_id+"&action=unfollow",
                success: function(result){
                    if(result == "done"){
                        $("#btnUnFollow").attr("id", "btnFollow");
                        $("#btnFollow").text("Follow");
                    }else{
                        alert("There is an error while processing data");
                    }
                },
                dataType: "text"
            });
        }
    });

    $("#btnFollow").click(function(){
        if(account == "guest"){
            alert("Please sign in before doing this");
        }else{
            var track_id = $(this).attr("trackid");
            $.ajax({
                type: "POST",
                url: "AppIOSHandler",
                data: "track_id="+track_id+"&action=follow",
                success: function(result){
                    if(result == "done"){
                        $("#btnFollow").attr("id", "btnUnFollow");
                        $("#btnUnFollow").text("Unfollow");
                    }else{
                        alert("There is an error while processing data");
                    }
                },
                dataType: "text"
            });
        }
    });
});
</script>
</html>