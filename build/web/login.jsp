<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Đăng nhập</title>
        <!-- Font Icon -->
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link rel="stylesheet" href="${root}/fonts/material-icon/css/material-design-iconic-font.min.css">
        <!-- Main css -->
        <link rel="stylesheet" href="${root}/css/regform.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

    </head>
    <body>
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v10.0&appId=491057278605662&autoLogAppEvents=1" nonce="F4epW4yq"></script>
        <div class="main">
            <!-- Sign in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="${root}/images/signin-image.jpg" alt="sing up image"></figure>
                            <a href="register.jsp" class="signup-image-link">Bạn chưa có tài khoản? Đăng ký</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Đăng nhập</h2>
                            <form action="${root}/UserServlet" method="POST" class="register-form" id="login-form">
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email material-icons-email"></i></label>                                    
                                    <input type="email" name="email" id="email" placeholder="Email"/>
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="pass" required="yes" id="pass" placeholder="Mật khẩu"/>
                                </div>
                                <%
                                    if (session.getAttribute("error") != null) {

                                %>
                                <div>
                                    <p  style="color:red"><%=session.getAttribute("error")%></p>
                                </div>
                                <%
                                    }
                                %>
                                <div class="form-group form-button">
                                    <input type="hidden" name="command" value="login"/>
                                    <input type="submit" name="signin" id="signin" class="form-submit" value="Đăng nhập"/>
                                </div>
                            </form>
                            <div class="social-login">
                                <span class="social-label">Đăng nhập bằng</span>

                                <ul class="socials">                                
                                    <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                    <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                                </ul>
                                <!--<div class="fb-login-button" data-width="" data-size="medium" data-button-type="login_with" data-layout="rounded" data-auto-logout-link="false" data-use-continue-as="true"></div>-->
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>              
        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
        <script>
            window.fbAsyncInit = function () {
                // FB JavaScript SDK configuration and setup
                FB.init({
                    appId: 491057278605662, // FB App ID
                    cookie: true, // enable cookies to allow the server to access the session
                    xfbml: true, // parse social plugins on this page
                    version: v10.0 // use graph api version 2.8
                });

                // Check whether the user already logged in
                FB.getLoginStatus(function (response) {
                    if (response.status === 'connected') {
                        //display user data
                        getFbUserData();
                    }
                });
            };

            // Load the JavaScript SDK asynchronously
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));

            // Facebook login with JavaScript SDK
            function fbLogin() {
                FB.login(function (response) {
                    if (response.authResponse) {
                        // Get and display the user profile data
                        getFbUserData();
                    } else {
                        document.getElementById('status').innerHTML = 'User cancelled login or did not fully authorize.';
                    }
                }, {scope: 'email'});
            }

            // Fetch the user profile data from facebook
            function getFbUserData() {
                FB.api('/me', {locale: 'en_US', fields: 'id,first_name,last_name,email,link,gender,locale,picture'},
                        function (response) {
                            document.getElementById('fbLink').setAttribute("onclick", "fbLogout()");
                            document.getElementById('fbLink').innerHTML = 'Logout from Facebook';
                            document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.first_name + '!';
                            document.getElementById('userData').innerHTML = '<p><b>FB ID:</b> ' + response.id + '</p><p><b>Name:</b> ' + response.first_name + ' ' + response.last_name + '</p><p><b>Email:</b> ' + response.email + '</p><p><b>Gender:</b> ' + response.gender + '</p><p><b>Locale:</b> ' + response.locale + '</p><p><b>Picture:</b> <img src="' + response.picture.data.url + '"/></p><p><b>FB Profile:</b> <a target="_blank" href="' + response.link + '">click to view profile</a></p>';
                        });
            }

            // Logout from facebook
            function fbLogout() {
                FB.logout(function () {
                    document.getElementById('fbLink').setAttribute("onclick", "fbLogin()");
                    document.getElementById('fbLink').innerHTML = '<img src="fblogin.png"/>';
                    document.getElementById('userData').innerHTML = '';
                    document.getElementById('status').innerHTML = 'You have successfully logout from Facebook.';
                });
            }
        </script>
        <div
            class="fb-like"
            data-share="true"
            data-width="450"
            data-show-faces="true">
        </div>
    </body>
</html>
