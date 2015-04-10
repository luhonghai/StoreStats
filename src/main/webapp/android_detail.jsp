<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.stat.store.entity.User" %>
<%@ page import="com.stat.store.service.AndroidService" %>
<%@ page import="com.stat.store.entity.AppAndroid" %>
<%
    String account = "guest";
    boolean isExisted = false;
    AndroidService androidService = new AndroidService();
    User member = (User)session.getAttribute("member");
    String package_name = request.getParameter("package_name");
    String app_id = request.getParameter("app_id");
    if(member != null){
        account = "member";
        isExisted = androidService.checkExisted(app_id, member.getId());
    }
    AppAndroid app = androidService.getAppFromServiceByPackageName(package_name);

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
                            <span class="movie_rating"><%=app.getRating() != null? app.getRating() : "0.0"%></span>
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
                        <p class="movie_option"><strong>Name: </strong><%=app.getTitle() != null? app.getTitle() : ""%></p>

                        <p class="movie_option"><strong>Company: </strong><%=app.getCreator() != null? app.getCreator() : ""%></p>

                        <p class="movie_option"><strong>Version: </strong><%=app.getVersion() != null? app.getVersion() : ""%></p>

                        <p class="movie_option"><strong>Download: </strong><%=app.getDownloadCount() != null? app.getDownloadCount() : ""%></p>
                        <%  String price;
                            if(!app.getPrice().equalsIgnoreCase("")){
                                price = app.getPrice() + "$";
                            }else{
                                price = "free";
                            }%>
                        <p class="movie_option"><strong>Price: </strong><%=price%></p>
                        <%  String rating;
                            if(app.getRating() != null){
                                rating = app.getRating();
                            }else{
                                rating = "0.0";
                            }%>
                        <p class="movie_option"><strong>Rating: </strong><%=rating%></p>

                        <%if(isExisted){%>
                            <div class="down_btn"><a class="btn1" id="btnUnFollow" appid="<%=app.getAppId()%>"><span> </span>Unfollow</a></div>
                        <%}else{%>
                            <div class="down_btn"><a class="btn1" id="btnFollow" appid="<%=app.getAppId()%>"><span> </span>Follow</a></div>
                        <%}%>

                    </div>
                    <div class="clearfix"></div>
                    <p class="m_4"><%=app.getDescription() != null? app.getDescription() : ""%></p>

                    <form method="post" action="contact-post.html">
                        <div class="to">
                            <input type="text" class="text" value="Name" onfocus="this.value = '';"
                                   onblur="if (this.value == '') {this.value = 'Name';}">
                            <input type="text" class="text" value="Email" onfocus="this.value = '';"
                                   onblur="if (this.value == '') {this.value = 'Email';}" style="margin-left:3%">
                        </div>
                        <div class="text">
                            <textarea value="Message:" onfocus="this.value = '';"
                                      onblur="if (this.value == '') {this.value = 'Message';}">Message:</textarea>
                        </div>
                        <div class="form-submit1">
                            <input name="submit" type="submit" id="submit" value="Submit Your Message"><br>
                        </div>
                        <div class="clearfix"></div>
                    </form>
                    <div class="single">
                        <h1>10 Comments</h1>
                        <ul class="single_list">
                            <li>
                                <div class="preview"><a href="#"><img src="images/2.jpg" class="img-responsive" alt=""></a></div>
                                <div class="data">
                                    <div class="title">Movie / 2 hours ago / <a href="#">reply</a></div>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod
                                        tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,
                                        quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
                                        consequat.</p>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <li>
                                <div class="preview"><a href="#"><img src="images/3.jpg" class="img-responsive" alt=""></a></div>
                                <div class="data">
                                    <div class="title">Wernay / 2 hours ago / <a href="#">reply</a></div>
                                    <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat,
                                        vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio
                                        dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla
                                        facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming
                                        id quod mazim placerat facer possim assum. Typi non habent </p>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <li>
                                <div class="preview"><a href="#"><img src="images/4.jpg" class="img-responsive" alt=""></a></div>
                                <div class="data">
                                    <div class="title">mr.dev / 2 hours ago / <a href="#">reply</a></div>
                                    <p>Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.
                                        Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit
                                        litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi,
                                        qui nunc nobis videntur parum clari, fiant sollemnes in futurum. qui sequitur mutationem
                                        consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum
                                        claram,</p>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <li class="middle">
                                <div class="preview"><a href="#"><img src="images/5.jpg" class="img-responsive" alt=""></a></div>
                                <div class="data-middle">
                                    <div class="title">Wernay / 2 hours ago / <a href="#">reply</a></div>
                                    <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis
                                        egestas.</p>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <li class="last-comment">
                                <div class="preview"><a href="#"><img src="images/6.jpg" class="img-responsive" alt=""></a></div>
                                <div class="data-last">
                                    <div class="title">mr.dev / 2 hours ago / <a href="#">reply</a></div>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod
                                        tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,
                                        quis nostrud exerci tation ullamcorper suscipit </p>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <li>
                                <div class="preview"><a href="#"><img src="images/7.jpg" class="img-responsive" alt=""></a></div>
                                <div class="data">
                                    <div class="title">denpro / 2 hours ago / <a href="#">reply</a></div>
                                    <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis
                                        egestas.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac
                                        turpis egestas.Pellentesque habitant morbi tristique senectus et netus et malesuada fames
                                        ac turpis egestas.Pellentesque habitant morbi tristique senectus et netus et malesuada
                                        fames ac turpis egestas.Pellentesque habitant morbi tristique senectus et netus et
                                        malesuada fames ac turpis egestas.</p>
                                </div>
                                <div class="clearfix"></div>
                            </li>
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
            var app_id = $(this).attr("appid");
            var package_name =  "<%=package_name%>";
            $.ajax({
                type: "POST",
                url: "AppAndroidHandler",
                data: "app_id="+track_id+"&package_name="+package_name+"&action=unfollow",
                success: function(result){
                    if(result == "done"){
                        $("#btnUnFollow").attr("id", "btnFollow");
                        $("#btnFollow").html("<span> </span>Follow");
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
            var app_id = $(this).attr("appid");
            var package_name =  "<%=package_name%>";
            $.ajax({
                type: "POST",
                url: "AppAndroidHandler",
                data: "app_id="+app_id+"&package_name="+package_name+"&action=follow",
                success: function(result){
                    if(result == "done"){
                        $("#btnFollow").attr("id", "btnUnFollow");
                        $("#btnUnFollow").html("<span> </span>Unfollow");
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