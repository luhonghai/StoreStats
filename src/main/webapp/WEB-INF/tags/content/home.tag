<%@ tag import="com.stat.store.entity.AppIOs" %>
<%@ tag import="java.util.List" %>
<%@ tag import="com.stat.store.service.AppleService" %>
<%
    AppleService appleService = new AppleService();
    List<AppIOs> listApp = appleService.getTop10App();
%>
<div class="box_1">
    <h1 class="m_2">Top Free Apps</h1>
    <div class="clearfix"></div>
</div>
<div class="box_2">
    <div class="col-md-5 grid_3">
        <div class="row_1">
            <div class="col-md-6 grid_4">
                <a href="ios_detail.jsp?track_id=<%=listApp.get(0).getTrackId()%>">
                <div class="grid_2">
                    <img src="<%=listApp.get(0).getArtworkUrl()%>" class="img-responsive" alt=""/>

                    <div class="caption1">
                        <ul class="list_3">
                            <li><i class="icon5"> </i>

                                <p style="color:#3f444e;"><strong><%=listApp.get(0).getUserRatingCount()%></strong></p></li>
                        </ul>
                        <i class="icon4"> </i>

                        <p class="m_3" style="color:#3f444e;"><%=listApp.get(0).getTrackName()%></p>
                    </div>
                </div>
                </a>
                <a href="ios_detail.jsp?track_id=<%=listApp.get(1).getTrackId()%>">
                <div class="grid_2 col_1">
                    <img src="<%=listApp.get(1).getArtworkUrl()%>" class="img-responsive" alt=""/>

                    <div class="caption1">
                        <ul class="list_3">
                            <li><i class="icon5"> </i>

                                <p style="color:#3f444e;"><strong><%=listApp.get(1).getUserRatingCount()%></strong></p></li>
                        </ul>
                        <i class="icon4"> </i>

                        <p class="m_3" style="color:#3f444e;"><%=listApp.get(1).getTrackName()%></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-md-6 grid_7">
                <div class="col_2">
                    <ul class="list_4">
                        <li style="line-height:2.74em;"><i class="icon1" style="margin-top:8px;"> </i><p><%=listApp.get(2).getUserRatingCount()%></p></li>
                        <li style="line-height:2.74em;">Name: &nbsp;<span class="m_4"><%=listApp.get(2).getTrackName()%></span></li>
                        <li style="line-height:2.74em;">Rating: &nbsp;<span class="m_4"><%=listApp.get(2).getAverageUserRating()%></span></li>
                        <li style="line-height:2.74em;">Version: &nbsp;<span class="m_4"><%=listApp.get(2).getVersion()%></span></li>
                        <li style="line-height:2.74em;">Release: &nbsp;<span class="m_4"><%=listApp.get(2).getReleaseDate().substring(0, 10)%></span></li>
                        <div class="clearfix"></div>
                    </ul>
                    <div class="m_5"><a href="ios_detail.jsp?track_id=<%=listApp.get(2).getTrackId()%>"><img src="<%=listApp.get(2).getArtworkUrl()%>" class="img-responsive" alt=""/></a></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="row_2">
            <a href="ios_detail.jsp?track_id=553834731"><img src="images/candy.jpg" class="img-responsive" alt=""/></a>
        </div>
    </div>
    <div class="col-md-5 content_right">
        <div class="row_3">
            <div class="col-md-6 content_right-box">
                <a href="ios_detail.jsp?track_id=<%=listApp.get(3).getTrackId()%>">
                    <div class="grid_2">
                    <img src="<%=listApp.get(3).getArtworkUrl()%>" class="img-responsive" alt=""/>

                    <div class="caption1">
                        <ul class="list_5">
                            <li><i class="icon5"> </i>

                                <p style="color:#3f444e;"><strong><%=listApp.get(3).getUserRatingCount()%></strong></p></li>
                        </ul>
                        <i class="icon4 icon6"> </i>

                        <p class="m_3" style="color:#3f444e;"><%=listApp.get(3).getTrackName()%></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-md-6 grid_5">
                <a href="ios_detail.jsp?track_id=<%=listApp.get(4).getTrackId()%>">
                    <div class="grid_2">
                    <img src="<%=listApp.get(4).getArtworkUrl()%>" class="img-responsive" alt=""/>

                    <div class="caption1">
                        <ul class="list_5">
                            <li><i class="icon5"> </i>

                                <p style="color:#3f444e;"><strong><%=listApp.get(4).getUserRatingCount()%></strong></p></li>
                        </ul>
                        <i class="icon4 icon6"> </i>

                        <p class="m_3" style="color:#3f444e;"><%=listApp.get(4).getTrackName()%></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="video">
            <iframe width="100%" height="" src="https://www.youtube.com/embed/y-waTi8BPdk" frameborder="0" allowfullscreen></iframe>
        </div>
        <div class="row_5">
            <div class="col-md-6">
                <div class="col_2">
                    <ul class="list_4">
                        <li><i class="icon1"> </i><p><%=listApp.get(5).getUserRatingCount()%></p></li>
                        <li>Name: &nbsp;<span class="m_4"><%=listApp.get(5).getTrackName()%></span></li>
                        <li>Rating: &nbsp;<span class="m_4"><%=listApp.get(5).getAverageUserRating()%></span></li>
                        <li>Version: &nbsp;<span class="m_4"><%=listApp.get(5).getVersion()%></span></li>
                        <li>Release: &nbsp;<span class="m_4"><%=listApp.get(5).getReleaseDate().substring(0, 10)%></span></li>
                        <div class="clearfix"></div>
                    </ul>

                </div>
            </div>
            <div class="col-md-6 m_6"><a href="ios_detail.jsp?track_id=<%=listApp.get(5).getTrackId()%>">
                <img src="<%=listApp.get(5).getArtworkUrl()%>" class="img-responsive" alt=""/>
            </a></div>
        </div>
    </div>
    <div class="col-md-2 grid_6">
        <div class="m_7"><a href="ios_detail.jsp?track_id=<%=listApp.get(8).getTrackId()%>">
            <img src="<%=listApp.get(8).getArtworkUrl()%>" class="img-responsive" alt=""/></a></div>
        <div class="caption1">
            <ul class="list_5">
            <li><i class="icon5"> </i>

                    <p style="color:#3f444e;"><strong><%=listApp.get(8).getUserRatingCount()%></strong></p></li>
            </ul>
            <i class="icon4 icon6"> </i>

            <p class="m_3" style="color:#3f444e;"><%=listApp.get(8).getTrackName()%></p>
        </div>
        <div class="col_2 col_3">
            <ul class="list_4">
                <li style="line-height:2.47em;"><i class="icon1" style="margin-top:5px;"> </i><p><%=listApp.get(7).getUserRatingCount()%></p></li>
                <li style="line-height:2.47em;">Name: &nbsp;<span class="m_4"><%=listApp.get(7).getTrackName()%></span></li>
                <li style="line-height:2.47em;">Rating: &nbsp;<span class="m_4"><%=listApp.get(7).getAverageUserRating()%></span></li>
                <li style="line-height:2.47em;">Version: &nbsp;<span class="m_4"><%=listApp.get(7).getVersion()%></span></li>
                <li style="line-height:2.47em;">Release: &nbsp;<span class="m_4"><%=listApp.get(7).getReleaseDate().substring(0, 10)%></span></li>
                <div class="clearfix"></div>
            </ul>
            <div class="m_8"><a href="ios_detail.jsp?track_id=<%=listApp.get(7).getTrackId()%>"><img src="<%=listApp.get(7).getArtworkUrl()%>" class="img-responsive" alt=""/></a>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>