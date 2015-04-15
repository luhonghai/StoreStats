<%@tag description="HEAD" pageEncoding="UTF-8" %>
<%@attribute name="pageTitle" required="true" %>
<title><%=pageTitle%></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="keywords" content=""/>
<link href="<%=request.getContextPath()%>/favicon.png" type="image/png" rel="icon">
<script type="application/x-javascript"> addEventListener("load", function () {
    setTimeout(hideURLbar, 0);
}, false);
function hideURLbar() {
    window.scrollTo(0, 1);
} </script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<!-- start plugins -->

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.browser.min.js"></script>

<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet'
      type='text/css'>
<script src="<%=request.getContextPath()%>/js/responsiveslides.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.easytabs.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.flexisel.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.hashchange.min.js"></script>
<script src="<%=request.getContextPath()%>/js/Chart.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ddslick.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jssor.js"></script>
<script src="<%=request.getContextPath()%>/js/jssor.slider.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>
<script>
    $(function () {
        $("#slider").responsiveSlides({
            auto: true,
            nav: true,
            speed: 500,
            namespace: "callbacks",
            pager: true
        });
    });
</script>