<%@tag description="Main screen" pageEncoding="UTF-8" %>
<%@taglib prefix="i" tagdir="/WEB-INF/tags/include" %>
<%@attribute name="pageTitle" required="true" %>
<html>
    <head>
        <i:head pageTitle="<%=pageTitle%>"/>
    </head>
    <body>
    <div class="container">
        <div class="container_wrap">
            <i:header/>

            <div class="content">
                <jsp:doBody/>
            </div>
        </div>
    </div>
    <div class="container">
        <i:footer/>
     </div>
    </body>
</html>