<%@ tag import="com.stat.store.entity.User" %>
<%@ tag import="com.stat.store.util.MD5Helper" %>
<%@tag description="Header" pageEncoding="UTF-8" %>
<%
    User member = (User)session.getAttribute("member");
%>
<div class="header_top">
    <div class="col-sm-3 logo"><a href="<%=request.getContextPath()%>/index.jsp"><img style="width: 250px;" src="<%=request.getContextPath()%>/images/logo.png" alt=""/></a></div>
    <div class="col-sm-6 nav">
        <div class="search">
            <form action="<%=request.getContextPath()%>/search.jsp" method="GET">
                <input type="text" value="Search..." name="q" style="margin-bottom: -15px;" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
                <input type="submit" value="" style="top:20%;">
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="col-sm-3 header_right">
        <ul class="header_right_box">
            <%if(member != null){%>
            <li><img style="width:35px;height: 35px;" src="http://www.gravatar.com/avatar/<%=MD5Helper.md5Hex(member.getEmail())%>" alt=""/></li>
            <li><p><a href="<%=request.getContextPath()%>/favourite.jsp"><%=member.getFirstname()%> <%=member.getLastname()%></a>&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/UserHandler?action=logout" title="Logout"><i class="fa fa-sign-out" style="color: red"></i></a></p></li>
            <%}else{%>
            <li><p><a href="<%=request.getContextPath()%>/login.jsp">Login</a>&nbsp;|&nbsp;<a href="<%=request.getContextPath()%>/register.jsp">Register</a></p></li>
            <%}%>
            <%--<li class="last"><i class="edit"> </i></li>--%>
            <div class="clearfix"></div>
        </ul>
    </div>
    <div class="clearfix"></div>
</div>