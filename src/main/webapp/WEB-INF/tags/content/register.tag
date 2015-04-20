<div class="register">
    <form>
        <div class="register-top-grid">
            <h3>Personal Information</h3>
            <div>
                <span>First Name<label>*</label></span>
                <input type="text" id="fname"/>
            </div>
            <div>
                <span>Last Name<label>*</label></span>
                <input type="text" id="lname"/>
            </div>
            <div>
                <span>Email Address<label>*</label></span>
                <input type="text" id="email"/>
            </div>
            <div class="clearfix"></div>
            <a class="news-letter" href="#">
                <label class="checkbox">
                    <input type="checkbox" name="checkbox" checked=""><i>  </i>Sign Up for Newsletter
                </label>
            </a>
        </div>
        <div class="register-bottom-grid">
            <h3>Login Information</h3>

            <div>
                <span>Username<label>*</label></span>
                <input type="text" id="username"/>
            </div>
            <div>
                <span>Password<label>*</label></span>
                <input type="password" id="password"/>
            </div>
            <div>
                <span>Confirm Password<label>*</label></span>
                <input type="password" id="cpassword"/>
            </div>
            <div class="clearfix"></div>
        </div>
    <div class="clearfix"></div>
    <div class="register-but">
            <input type="button" value="submit" id="submit">
            <div class="clearfix"></div>
    </div>
    </form>
</div>

<script src="<%=request.getContextPath()%>/js/user.js"></script>