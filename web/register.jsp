<%-- 
    Document   : login
    Created on : Mar 15, 2021, 5:31:41 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng ký tài khoản</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Custom Theme files -->
        <link href="css/register.css" rel="stylesheet" type="text/css" media="all" />
        <!-- //Custom Theme files -->
        <!-- web font -->
        <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
        <!-- //web font -->
    </head>
    <body>
        <!-- main -->
        <div class="main-w3layouts wrapper">
            <h1>Đăng ký</h1>
            <div class="main-agileinfo">
                <div class="agileits-top">
                    <form action="#" method="post">
                        <input class="text" type="text" name="fullname" placeholder="Họ Tên" required="">
                        <input class="text email" type="email" name="email" placeholder="Email" required="">
                        <input class="text" type="password" name="password" placeholder="Mật Khẩu" required="">
                        <input class="text w3lpass" type="password" name="password" placeholder="Nhập Lại Mật Khẩu" required="">
<!--                        <div class="wthree-text">
                            <label class="anim">
                                <input type="checkbox" class="checkbox" required="">
                                <span>I Agree To The Terms & Conditions</span>
                            </label>
                            <div class="clear"> </div>
                        </div>-->
                        <input type="submit" value="Đăng ký">
                    </form>
                    <p>Bạn đã có tài khoản? <a href="login.jsp"> Đăng nhập!</a></p>
                </div>
            </div>
            <ul class="colorlib-bubbles">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
    </body>
</html>
