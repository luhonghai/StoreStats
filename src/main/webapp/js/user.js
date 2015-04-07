/**
 * Created by longnguyen on 4/6/15.
 */
$(document).ready(function(){
    var servletUrl = "UserHandler";

    function doSubmit(){
        var email =  $("#email").val();
        var fname = $("#fname").val();
        var lname = $("#lname").val();
        var password = $("#password").val();
        var cpassword = $("#cpassword").val();
        var username = $("#username").val();

        if(fname.length == 0 || lname.length == 0 || email.length == 0 || password.length == 0 || cpassword.length == 0 || username.length == 0){
            alert("Please fill in the form");
        }else{
            if(password != cpassword){
                alert("Confirm password must be matched!");
            }else{
                register(email, fname, lname, username, password, "register");
            }
        }
    }

    function register(email, fname, lname, username, password, action){
        var xhr;
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
        var data = "email=" + email + "&fname=" + fname + "&lname=" + lname + "&password=" + password +"&username=" + username + "&action=" + action;
        xhr.open("POST", servletUrl, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send(data);
        xhr.onreadystatechange = display_data;
        function display_data() {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    console.log(xhr.responseText);
                    if(xhr.responseText != "invalid"){
                        window.location = "login.jsp";
                    }else{
                        alert("Please try again!");
                    }
                } else {
                    alert('There was a problem with the request.');
                }
            }
        }
    }

    $("#submit").click(function(){
        doSubmit();
    });

});