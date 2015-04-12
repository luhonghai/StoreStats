<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.stat.store.entity.AppIOs" %>
<%@ page import="java.util.List" %>
<%@ page import="com.stat.store.entity.User" %>
<%@ page import="com.stat.store.service.AppleService" %>
<%@ page import="com.stat.store.service.AndroidService" %>
<%@ page import="com.stat.store.entity.AppAndroid" %>
<%
    String keyword = request.getParameter("q");
    User member = (User)session.getAttribute("member");
    AppleService appleService = new AppleService();
    List<AppIOs> iOSList = appleService.searchByKeyword(keyword);
    System.out.println("List ios size: " + iOSList.size());
    System.out.println("----------------------------");
    AndroidService androidService = new AndroidService();
    List<AppAndroid> androidList = androidService.getAppsFromService(keyword);
    System.out.println("List android size: " + androidList.size());
    System.out.println("----------------------------");
%>
<html>
<head>
    <title>Movie_store A Entertainment Category Flat Bootstarp Resposive Website Template | Movie :: w3layouts</title>
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
    <script src="js/jquery.hashchange.min.js" type="text/javascript"></script>
    <script src="js/jquery.easytabs.js" type="text/javascript"></script>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
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
            <h2 class="m_3">Now in the Movie</h2>
                <div class="movie_top">
                    <div id="tab-full-container" class='tab-container col-md-9'>
                        <div class='etabs'>
                            <span class='tab' id="tab-1"><a href="#tabs2-ios">iOS</a></span>
                            <span class='tab' id="tab-2"><a href="#tabs2-android">Android</a></span>
                        </div>
                        <div class='panel-container'>
                            <div id="tabs2-ios" class="movie_box">
                                <h2>iOS Application</h2>
                                <div>
                                    <table>
                                        <tr>
                                            <td>Your favourite App</td>
                                            <td>Competitor App</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <select id="MyApp">
                                                    <%if(iOSList != null && iOSList.size()>0)
                                                        for(int i=0; i<iOSList.size(); i++){%>
                                                        <option value="<%=iOSList.get(i).getTrackId()%>"><%=iOSList.get(i).getTrackName().length()>20? iOSList.get(i).getTrackName().substring(0,19)+"..." : iOSList.get(i).getTrackName()%></option>
                                                    <%}%>
                                                </select>
                                            </td>
                                            <td>
                                                <select id="MyCompetitor">
                                                    <%if(iOSList != null && iOSList.size()>0)
                                                        for(int i=0; i<iOSList.size(); i++){%>
                                                    <option value="<%=iOSList.get(i).getTrackId()%>"><%=iOSList.get(i).getTrackName().length()>20? iOSList.get(i).getTrackName().substring(0,19)+"..." : iOSList.get(i).getTrackName()%></option>
                                                    <%}%>
                                                </select>
                                            </td>
                                            <td>
                                                <a class="btn1" id="btnCompare"><span> </span>Compare</a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div>
                                    <!-- Movie variant with time -->
                                    <%
                                        if(iOSList != null && iOSList.size()>0){
                                            for(int i=0; i<iOSList.size(); i++){ %>

                                    <div class="movie movie-test movie-test-dark <%if(i%2==0){%>movie-test-left<%}else{%>movie-test-right<%}%>">
                                        <div class="movie__images">
                                            <a href="ios_detail.jsp?track_id=<%=iOSList.get(i).getTrackId()%>" class="movie-beta__link">
                                                <img alt="" src="<%=iOSList.get(i).getArtworkUrl()%>" class="img-search" alt=""/>
                                            </a>
                                        </div>
                                        <div class="movie__info">
                                            <%  String name;
                                                if(iOSList.get(i).getTrackName().length()>20){
                                                    name = iOSList.get(i).getTrackName().substring(0,19)+"...";
                                                }else{
                                                    name = iOSList.get(i).getTrackName();
                                                }%>
                                            <a href="ios_detail.jsp?track_id=<%=iOSList.get(i).getTrackId()%>" class="movie__title"><%=name%></a>

                                            <!--<p class="movie__time"><!%=iOSList.get(i).getSellerName()%></p>-->

                                            <!--<p class="movie__option"><a href="ios_detail.jsp">Contray</a> | <a href="ios_detail.jsp">Dolor sit</a> |
                                                <a href="ios_detail.jsp">Drama</a></p>         -->
                                            <ul class="list_6">
                                                <li><i class="icon1"> </i>
                                                    <%  String count;
                                                        if(iOSList.get(i).getUserRatingCount() != null){
                                                            count = iOSList.get(i).getUserRatingCount();
                                                        }else{
                                                            count = "0";
                                                        }%>
                                                    <p><%=count%></p></li>
                                                <li><i class="icon3"> </i>
                                                    <%  String price;
                                                        if(iOSList.get(i).getPrice() > 0){
                                                            price = iOSList.get(i).getPrice() + "$";
                                                        }else{
                                                            price = "free";
                                                        }%>
                                                    <p><%=price%></p></li>

                                                <li>Rating : &nbsp;&nbsp;
                                                    <%  String rating;
                                                        if(iOSList.get(i).getAverageUserRating() != null){
                                                            rating = iOSList.get(i).getAverageUserRating();
                                                        }else{
                                                            rating = "0.0";
                                                        }%>
                                                    <p><%=rating%></p></li>
                                                <div class="clearfix"></div>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                    <%}
                                    }
                                    %>
                                    <div class="clearfix"></div>
                                    <!-- Movie variant with time -->
                                </div>
                            </div>
                            <div id="tabs2-android" class="movie_box">
                                <h2>Android Application</h2>
                                <div>
                                    <!-- Movie variant with time -->
                                    <%
                                        if(androidList != null && androidList.size()>0){
                                            for(int i=0; i<androidList.size(); i++){ %>

                                    <div class="movie movie-test movie-test-dark <%if(i%2==0){%>movie-test-left<%}else{%>movie-test-right<%}%>">
                                        <div class="movie__images">
                                            <a href="android_detail.jsp?package_name=<%=androidList.get(i).getPackageName()%>&app_id=<%=androidList.get(i).getAppId()%>" class="movie-beta__link">
                                                <img alt="" src="<%=androidList.get(i).getArtworkUrl()%>" class="img-search" alt=""/>
                                            </a>
                                        </div>
                                        <div class="movie__info">
                                            <%  String name;
                                                if(androidList.get(i).getTitle().length()>20){
                                                    name = androidList.get(i).getTitle().substring(0,19)+"...";
                                                }else{
                                                    name = androidList.get(i).getTitle();
                                                }%>
                                            <a href="android_detail.jsp?package_name=<%=androidList.get(i).getPackageName()%>&app_id=<%=androidList.get(i).getAppId()%>" class="movie__title"><%=name%></a>

                                            <!--<p class="movie__time"><!%=iOSList.get(i).getSellerName()%></p>-->

                                            <!--<p class="movie__option"><a href="ios_detail.jsp">Contray</a> | <a href="ios_detail.jsp">Dolor sit</a> |
                                                <a href="ios_detail.jsp">Drama</a></p>         -->
                                            <ul class="list_6">
                                                <li><i class="icon1"> </i>
                                                    <%  String count;
                                                        if(androidList.get(i).getRatingCount() != null){
                                                            count = androidList.get(i).getRatingCount();
                                                        }else{
                                                            count = "0";
                                                        }%>
                                                    <p><%=count%></p></li>
                                                <li><i class="icon3"> </i>
                                                    <%  String price;
                                                        if(!androidList.get(i).getPrice().equalsIgnoreCase("")){
                                                            price = androidList.get(i).getPrice() + "$";
                                                        }else{
                                                            price = "free";
                                                        }%>
                                                    <p><%=price%></p></li>

                                                <li>Rating : &nbsp;&nbsp;
                                                    <%  String rating;
                                                        if(androidList.get(i).getRating() != null){
                                                            rating = androidList.get(i).getRating();
                                                        }else{
                                                            rating = "0.0";
                                                        }%>
                                                    <p><%=rating%></p></li>
                                                <div class="clearfix"></div>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                    <%}
                                    }
                                    %>
                                    <div class="clearfix"></div>
                                    <!-- Movie variant with time -->
                                </div>
                            </div>
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
                <h2 class="recent">Recently Viewed</h2>
                    <ul id="flexiselDemo3">
                        <li><img src="images/1.jpg" class="img-responsive"/>

                            <div class="grid-flex"><a href="#">Syenergy 2mm</a>

                                <p>22.10.2014 | 14:40</p></div>
                        </li>
                        <li><img src="images/2.jpg" class="img-responsive"/>

                            <div class="grid-flex"><a href="#">Surf Yoke</a>

                                <p>22.01.2015 | 14:40</p></div>
                        </li>
                        <li><img src="images/3.jpg" class="img-responsive"/>

                            <div class="grid-flex"><a href="#">Salty Daiz</a>

                                <p>22.10.2013 | 14:40</p></div>
                        </li>
                        <li><img src="images/4.jpg" class="img-responsive"/>

                            <div class="grid-flex"><a href="#">Cheeky Zane</a>

                                <p>22.10.2014 | 14:40</p></div>
                        </li>
                        <li><img src="images/5.jpg" class="img-responsive"/>

                            <div class="grid-flex"><a href="#">Synergy</a>

                                <p>22.10.2013 | 14:40</p></div>
                        </li>
                    </ul>
                    <script type="text/javascript">
                        $(window).load(function () {
                            $("#flexiselDemo3").flexisel({
                                visibleItems: 4,
                                animationSpeed: 1000,
                                autoPlay: true,
                                autoPlaySpeed: 3000,
                                pauseOnHover: true,
                                enableResponsiveBreakpoints: true,
                                responsiveBreakpoints: {
                                    portrait: {
                                        changePoint: 480,
                                        visibleItems: 1
                                    },
                                    landscape: {
                                        changePoint: 640,
                                        visibleItems: 2
                                    },
                                    tablet: {
                                        changePoint: 768,
                                        visibleItems: 3
                                    }
                                }
                            });

                        });
                    </script>
                    <script type="text/javascript" src="js/jquery.flexisel.js"></script>
                    <ul id="flexiselDemo1">
                        <li><img src="images/8.jpg" class="img-responsive"/>

                            <div class="grid-flex"><a href="#">Syenergy 2mm</a>

                                <p>22.10.2014 | 14:40</p></div>
                        </li>
                        <li><img src="images/7.jpg" class="img-responsive"/>

                            <div class="grid-flex"><a href="#">Surf Yoke</a>

                                <p>22.01.2015 | 14:40</p></div>
                        </li>
                        <li><img src="images/6.jpg" class="img-responsive"/>

                            <div class="grid-flex"><a href="#">Salty Daiz</a>

                                <p>22.10.2013 | 14:40</p></div>
                        </li>
                        <li><img src="images/1.jpg" class="img-responsive"/>

                            <div class="grid-flex"><a href="#">Cheeky Zane</a>

                                <p>22.10.2014 | 14:40</p></div>
                        </li>
                        <li><img src="images/2.jpg" class="img-responsive"/>

                            <div class="grid-flex"><a href="#">Synergy</a>

                                <p>22.10.2013 | 14:40</p></div>
                        </li>
                    </ul>
                    <script type="text/javascript">
                        $(window).load(function () {
                            $("#flexiselDemo1").flexisel({
                                visibleItems: 4,
                                animationSpeed: 1000,
                                autoPlay: true,
                                autoPlaySpeed: 3000,
                                pauseOnHover: true,
                                enableResponsiveBreakpoints: true,
                                responsiveBreakpoints: {
                                    portrait: {
                                        changePoint: 480,
                                        visibleItems: 1
                                    },
                                    landscape: {
                                        changePoint: 640,
                                        visibleItems: 2
                                    },
                                    tablet: {
                                        changePoint: 768,
                                        visibleItems: 3
                                    }
                                }
                            });

                        });
                    </script>
        </div>
    </div>
</div>
<div class="container">
    <footer id="footer">
        <div id="footer-3d">
            <div class="gp-container">
                <span class="first-widget-bend"></span>
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
<script>
    $(document).ready(function(){
        $("#tab-full-container").easytabs({
            animate: true,
            animationSpeed: 1000,
            defaultTab: "span#tab-1",
            panelActiveClass: "active-content-div",
            tabActiveClass: "selected-tab",
            tabs: "> div > span",
            updateHash: false
        });
    });
</script>
</body>
</html>