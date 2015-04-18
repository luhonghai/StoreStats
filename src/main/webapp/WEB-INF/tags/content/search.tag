<%@ tag import="com.stat.store.entity.AppIOs" %>
<%@ tag import="java.util.List" %>
<%@ tag import="com.stat.store.entity.User" %>
<%@ tag import="com.stat.store.service.AppleService" %>
<%@ tag import="com.stat.store.service.AndroidService" %>
<%@ tag import="com.stat.store.entity.AppAndroid" %>
<%
    String keyword = request.getParameter("q");
    User member = (User)session.getAttribute("member");
    AppleService appleService = new AppleService();
    List<AppIOs> iOSList = appleService.searchByKeyword(keyword);
    AndroidService androidService = new AndroidService();
    List<AppAndroid> androidList = androidService.getAppsFromService(keyword);
%>

<div class="movie_top" style="overflow: hidden;">
    <div class="col-md-6 movie_box">
        <h2 style="text-align: center">iOS Application</h2>
        <div>
            <table>
                <tr>
                    <td>
                        <select id="MyApp">
                            <%if(iOSList != null && iOSList.size()>0)
                                for(int i=0; i<iOSList.size(); i++){%>
                            <%  String price;
                                if(iOSList.get(i).getPrice() > 0){
                                    price = iOSList.get(i).getPrice() + "$";
                                }else{
                                    price = "free";
                                }%>
                            <option data-imagesrc="<%=iOSList.get(i).getArtworkUrl()%>"
                                    data-description="<%=price%>"
                                    value="<%=iOSList.get(i).getTrackId()%>">
                                <%=iOSList.get(i).getTrackName().length()>20? iOSList.get(i).getTrackName().substring(0,19)+"..." : iOSList.get(i).getTrackName()%>
                            </option>
                            <%}%>
                        </select>
                    </td>
                    <td>
                        <select id="MyCompetitor">
                            <%if(iOSList != null && iOSList.size()>0)
                                for(int i=0; i<iOSList.size(); i++){%>
                            <%  String price;
                                if(iOSList.get(i).getPrice() > 0){
                                    price = iOSList.get(i).getPrice() + "$";
                                }else{
                                    price = "free";
                                }%>
                            <option
                                    data-imagesrc="<%=iOSList.get(i).getArtworkUrl()%>"
                                    data-description="<%=price%>"
                                    value="<%=iOSList.get(i).getTrackId()%>"><%=iOSList.get(i).getTrackName().length()>20? iOSList.get(i).getTrackName().substring(0,19)+"..." : iOSList.get(i).getTrackName()%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                <tr><td colspan="2" align="center"><div class="button-follow" style="margin: 0 auto">
                    <a class="hvr-shutter-out-horizontal" id="btnCompareiOS">Compare</a>
                </div></td></tr>
            </table>
        </div>
        <div style="margin-top:20px;">
            <!-- Movie variant with time -->
            <%
                if(iOSList != null && iOSList.size()>0){
                    for(int i=0; i<iOSList.size(); i++){ %>

            <div class="movie movie-test movie-test-dark movie-test-left">
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
    <div class="movie_box col-md-6">
        <h2 style="text-align: center">Android Application</h2>
        <div>
            <table>
                <tr>
                    <td>
                        <select id="MyAppA">
                            <%if(androidList != null && androidList.size()>0)
                                for(int i=0; i<androidList.size(); i++){%>
                            <%  String price;
                                if(!androidList.get(i).getPrice().equalsIgnoreCase("")){
                                    price = androidList.get(i).getPrice() + "$";
                                }else{
                                    price = "free";
                                }%>
                            <option
                                    data-imagesrc="<%=androidList.get(i).getArtworkUrl()%>"
                                    data-description="<%=price%>"
                                    value="<%=androidList.get(i).getPackageName()%>"><%=androidList.get(i).getTitle().length()>20? androidList.get(i).getTitle().substring(0,19)+"..." : androidList.get(i).getTitle()%></option>
                            <%}%>
                        </select>
                    </td>
                    <td>
                        <select id="MyCompetitorA">
                            <%if(androidList != null && androidList.size()>0)
                                for(int i=0; i<androidList.size(); i++){%>
                            <%  String price;
                                if(!androidList.get(i).getPrice().equalsIgnoreCase("")){
                                    price = androidList.get(i).getPrice() + "$";
                                }else{
                                    price = "free";
                                }%>
                            <option
                                    data-imagesrc="<%=androidList.get(i).getArtworkUrl()%>"
                                    data-description="<%=price%>"
                                    value="<%=androidList.get(i).getPackageName()%>"><%=androidList.get(i).getTitle().length()>20? androidList.get(i).getTitle().substring(0,19)+"..." : androidList.get(i).getTitle()%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                <tr><td colspan="2" align="center"><div class="button-follow" style="margin: 0 auto">
                    <a class="hvr-shutter-out-horizontal" id="btnCompareAndroid">Compare</a>
                </div></td></tr>
            </table>
        </div>
        <div style="margin-top:20px;">
            <!-- Movie variant with time -->
            <%
                if(androidList != null && androidList.size()>0){
                    for(int i=0; i<androidList.size(); i++){ %>

            <div class="movie movie-test movie-test-dark movie-test-left">
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

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">App compare</h4>
            </div>
            <div class="modal-body">
                <div style="width:600px;overflow: hidden;">
                    <div id="chart-container-1" style="width: 200px;height: 400px;float: left;"></div>
                    <div id="chart-container-2" style="width: 200px;height: 400px;float: left;"></div>
                    <div id="chart-container-3" style="width: 200px;height: 400px;float: left;"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>
    var currentBarData;
    function createChart(data1, data2) {

        currentBarData = [];
        var i;
        for (i = 0; i < data1.length; i++) {
            $("#chart-container-" +(i+1)).empty();
            $("#chart-container-" +(i+1)).html("<canvas id=\"chart-compare-"+(i+1)+"\" width=\"200px\" height=\"400px\"></canvas>");
            var label = "";
            if (i == 0) {
                label = "Price";
            } else if (i == 1) {
                label = "Rating";
            } else if (i == 2) {
                label = "Rating count";
            }
            currentBarData.push({
                labels: [label],
                datasets: [
                    {
                        fillColor: "rgba(225,0,0,1)",
                        strokeColor: "rgba(225,0,0,1)",
                        data: [isNaN(data1[i]) ? 0 : data1[i]]
                    },
                    {
                        fillColor: "rgba(0,26,225,1)",
                        strokeColor: "rgba(0,26,225,1)",
                        data: [isNaN(data2[i]) ? 0 : data2[i]]
                    }]
            });
        }
        $('#myModal').modal("show");
    }

    $(document).ready(function(){

        $('#myModal').on('shown.bs.modal', function () {
            if (typeof  currentBarData != 'undefined' && currentBarData.length == 3) {
                var i;
                for (i = 0; i < currentBarData.length; i++) {
                    new Chart($("#chart-compare-" + (i+1)).get(0).getContext("2d")).Bar(currentBarData[i]);
                }
            }
        });

        $("#btnCompareiOS").click(function(){
            //get tracking id
            var my_app = $("#MyApp").data('ddslick').selectedData.value;
            var competitor = $("#MyCompetitor").data('ddslick').selectedData.value;
            $.ajax({
                type: "POST",
                url: "AppCompareHandler",
                data: "my_app="+my_app+"&competitor="+competitor+"&action=compareIOS",
                success: function(result){
                    if(result != "invalid"){
                        var data = JSON.parse(result);
                        if (data.length == 2) {
                            createChart([
                                parseFloat(data[0].price),
                                parseFloat(data[0].averageUserRating),
                                parseInt(data[0].userRatingCount)
                            ],[
                                parseFloat(data[1].price),
                                parseFloat(data[1].averageUserRating),
                                parseInt(data[1].userRatingCount)
                            ]);
                        }
                    }else{
                        alert("There is an error while processing data");
                    }
                },
                dataType: "text"
            });
        });

        $("#btnCompareAndroid").click(function(){
            //get tracking id
            var my_app = $("#MyAppA").data('ddslick').selectedData.value;
            var competitor = $("#MyCompetitorA").data('ddslick').selectedData.value;
            $.ajax({
                type: "POST",
                url: "AppCompareHandler",
                data: "my_app="+my_app+"&competitor="+competitor+"&action=compareAndroid",
                success: function(result){
                    if(result != "invalid"){
                        var data = JSON.parse(result);
                        if (data.length == 2) {
                            createChart([
                                parseFloat(data[0].price == "" ? 0 : data[0].price),
                                parseFloat(data[0].rating),
                                parseInt(data[0].ratingCount)
                            ],[
                                parseFloat(data[1].price == "" ? 0 : data[1].price),
                                parseFloat(data[1].rating),
                                parseInt(data[1].ratingCount)
                            ]);
                        }
                    }else{
                        alert("There is an error while processing data");
                    }
                },
                dataType: "text"
            });
        });

        $("#MyApp").ddslick({
            width: 250,
            imagePosition: "left",
            selectText: "Select your favourite App",
            onSelected: function (data) {
            }
        });
        $("#MyCompetitor").ddslick({
            width: 250,
            imagePosition: "left",
            selectText: "Select competitor App",
            onSelected: function (data) {

            }
        });
        $("#MyAppA").ddslick({
            width: 250,
            imagePosition: "left",
            selectText: "Select your favourite App",
            onSelected: function (data) {

            }
        });
        $("#MyCompetitorA").ddslick({
            width: 250,
            imagePosition: "left",
            selectText: "Select competitor App",
            onSelected: function (data) {

            }
        });

        $("input[name=q]").val("<%=(request.getParameter("q") == null ? "" : request.getParameter("q"))%>");
    });
</script>