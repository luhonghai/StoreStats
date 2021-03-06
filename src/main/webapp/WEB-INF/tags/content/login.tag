<div class="register">
    <div class="col-md-6 login-left">
        <h3>New Customers</h3>

        <p>By creating an account with our store, you will be able to move through the checkout process faster, store
            multiple shipping addresses, view and track your orders in your account and more.</p>
        <a class="acount-btn" href="register.jsp">Create an Account</a>
    </div>
    <div class="col-md-6 login-right">
        <h3>Registered Customers</h3>

        <p>If you have an account with us, please log in.</p>
        <%
            if (session.getAttribute("message") != null) {
        %>
        <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Warning!</strong> <%=session.getAttribute("message")%>
        </div>
        <%
            session.setAttribute("message", null);
            }
        %>
        <form action="<%=request.getContextPath()%>/UserHandler" method="POST">
            <div>
                <span>Username<label>*</label></span>
                <input type="text" name="_request_username">
            </div>
            <div>
                <span>Password<label>*</label></span>
                <input type="password" name="_request_password">
                <input type="hidden" name="action" value="login">
            </div>
            <a class="forgot" href="#">Forgot Your Password?</a>
            <input type="submit" value="Login">
        </form>
    </div>
    <div class="clearfix"></div>
</div>