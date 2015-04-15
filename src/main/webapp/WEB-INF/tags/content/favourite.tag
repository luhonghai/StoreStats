<%@ tag import="com.stat.store.entity.AppIOs" %>
<%@ tag import="java.util.List" %>
<%@ tag import="com.stat.store.entity.User" %>
<%@ tag import="com.stat.store.service.AndroidService" %>
<%@ tag import="com.stat.store.entity.AppAndroid" %>
<%
    User member = (User)session.getAttribute("member");
    List<AppIOs> iOSList = null;
    List<AppAndroid> androidList = null;
    if (member == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    } else {
    AndroidService androidService = new AndroidService();
    com.stat.store.service.AppleService appleService = new com.stat.store.service.AppleService();
        iOSList = appleService.getFollowedAppsOfUser(member.getId());
        androidList = androidService.getFollowedAppsOfUser(member.getId());
    }
%>
<h2 class="m_3">Following app</h2>
<div class="movie_top">
    <div class="col-md-6 movie_box">
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
    <div class="col-md-6 movie_box">
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
                        name = androidList.get(i).getTitle().substring(0, 19)+"...";
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
                            if(androidList.get(i).getPrice() != "0"){
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
    <div class="clearfix"></div>
</div>