<%@ tag import="com.stat.store.service.AppleService" %>
<%@ tag import="com.stat.store.entity.AppIOs" %>
<%@ tag import="com.stat.store.entity.User" %>
<%@ tag import="com.stat.store.entity.ReviewIOs" %>
<%@ tag import="java.util.List" %>
<%@ tag import="com.stat.store.service.ReviewAppleService" %>
<%@ tag import="com.stat.store.service.AppleHistoryService" %>
<%@ tag import="com.stat.store.entity.ReviewIOsHistory" %>
<%
    String account = "guest";
    boolean isExisted = false;
    AppleService appleService = new AppleService();
    ReviewAppleService reviewService = new ReviewAppleService();
    AppleHistoryService appleHistoryService = new AppleHistoryService();

    User member = (User)session.getAttribute("member");
    String track_id = request.getParameter("track_id");
    if(member != null){
        account = "member";
        isExisted = appleService.checkExisted(track_id, member.getId());
    }
    AppIOs app = appleService.getAppDetail(track_id);
    List<ReviewIOs> listReview = reviewService.getReviewsFromService(track_id);
    //System.out.println("list review size: " + listReview.size());
    List<ReviewIOsHistory> listRating = appleHistoryService.geReviewHistoryByTrackId(track_id);
%>
<div class="movie_top">
    <div class="col-md-9 movie_box">
        <div class="grid images_3_of_2">
            <div class="app_detail_img">
                <img src="<%=app.getArtworkUrl()%>" class="img-search" alt=""/>
            </div>
        </div>
        <div class="desc1 span_3_of_2">
            <h1><%=app.getTrackName() != null? app.getTrackName() : ""%></h1>

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
            <div class="button-follow"><a trackid="<%=app.getTrackId()%>" id="btnRating" class="hvr-shutter-out-horizontal" style="margin-top:-40px;margin-left:120px;">Rating History</a></div>
            <%}else{%>
            <div class="button-follow"><a trackid="<%=app.getTrackId()%>" id="btnFollow" class="hvr-shutter-out-horizontal">Follow</a></div>
            <%}%>


        </div>
        <div class="clearfix"></div>
        <p class="m_4"><%=app.getDescription() != null? app.getDescription() : ""%></p>

        <div>
            <div id="slider1_container" style="position: relative; width: 600px; height: 800px; overflow: hidden; margin: 0 auto;">
                <!-- Loading Screen -->
                <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                    <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;">
                    </div>
                    <div style="position: absolute; display: block; background: url(<%=request.getContextPath()%>/images/slider/loading.gif) no-repeat center center;
                            top: 0px; left: 0px;width: 100%;height:100%;">
                    </div>
                </div>

                <!-- Slides Container -->
                <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 600px; height: 800px;
            overflow: hidden;">
                    <%if(app.getScreenShot1() != null){%>
                    <div>
                        <img src="<%=app.getScreenShot1()%>"/>
                    </div>
                    <%}%>
                    <%if(app.getScreenShot2() != null){%>
                    <div>
                        <img src="<%=app.getScreenShot2()%>"/>
                    </div>
                    <%}%>
                    <%if(app.getScreenShot3() != null){%>
                    <div>
                        <img src="<%=app.getScreenShot3()%>" />
                    </div>
                    <%}%>
                    <%if(app.getScreenShot4() != null){%>
                    <div>
                        <img src="<%=app.getScreenShot4()%>"/>
                    </div>
                    <%}%>
                    <%if(app.getScreenShot5() != null){%>
                    <div>
                        <img src="<%=app.getScreenShot5()%>"/>
                    </div>
                    <%}%>
                </div>
                <!-- bullet navigator container -->
                <div u="navigator" class="jssorb13" style="bottom: 16px; right: 6px;">
                    <!-- bullet navigator item prototype -->
                    <div u="prototype"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
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
    <div class="clearfix"></div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width:750px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Rating History</h4>
            </div>
            <div class="modal-body" style="width:750px;">
                <div style="width:700px;overflow: hidden;">
                    <div id="chart-container" style="width: 700px;height: 400px;float: left;"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>
    var currentLineData;
    function createChart() {
        <%if(listRating != null && listRating.size() > 0){%>
        currentLineData = [];
        var label = [];
        var data = [];
        <%for(ReviewIOsHistory review: listRating){%>
        label.push("<%=review.getUpdatedDate()%>");
        data.push(parseFloat(<%=review.getRating()%>));
        <%}%>
        $("#chart-container").empty();
        $("#chart-container").html("<canvas id='chart-rating' width='700px' height='400px'></canvas>");

        currentLineData.push({
            labels: label,
            datasets: [
                {
                    label: "Rating History",
                    fillColor: "rgba(151,187,205,0.2)",
                    strokeColor: "rgba(151,187,205,1)",
                    pointColor: "rgba(151,187,205,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: data
                }]
        });
        <%}%>
        $('#myModal').modal("show");
    }

    $(document).ready(function(){
        var account = "<%=account%>";

        $('#myModal').on('shown.bs.modal', function () {
            if (typeof  currentLineData != 'undefined') {
                new Chart($("#chart-rating").get(0).getContext("2d")).Line(currentLineData[0]);
            }
        });

        $("#btnRating").click(function(){
            createChart();
        });

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