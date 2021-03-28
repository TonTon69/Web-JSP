<%-- 
    Document   : register
    Created on : Mar 24, 2021, 9:24:18 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Đăng ký tài khoản</title>
        <!-- Font Icon -->
        <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css">
        <!-- Main css -->
        <link rel="stylesheet" href="../css/regform.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            function validate()
            {
                var fullname = document.form.fullname.value;
                var email = document.form.email.value;
                var password = document.form.password.value;
                var conpassword = document.form.conpassword.value;

                if (fullname == null || fullname == "")
                {
                    alert("Họ và tên không được để trống");
                    return false;
                } else if (email == null || email == "")
                {
                    alert("Email không được để trống");
                    return false;
                } else if (password.length < 6)
                {
                    alert("Mật khẩu ít nhất phải có 6 kí tự");
                    return false;
                } else if (password != conpassword)
                {
                    alert("Nhập lại mật khẩu không khớp");
                    return false;
                }
            }
        </script> 
    </head>
    <body>
        <div class="main">
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Đăng ký quản trị</h2>
                            <form action="AdminServlet" method="post" onsubmit="return validate()" class="register-form" id="register-form">
                                <div class="form-group">
                                    <label for="fullname"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="fullname" id="fullname" placeholder="Họ tên" maxlength="50" />
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="email" placeholder="Email" maxlength="50" />
                                    <span id="admin-result"></span>
                                </div>
                                <div class="form-group">
                                    <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="password" placeholder="Mật khẩu" maxlength="30" />
                                </div>
                                <div class="form-group">
                                    <label for="conpassword"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="conpassword" id="conpassword" placeholder="Nhập lại mật khẩu" maxlength="30" />
                                </div>
                                <%=(request.getAttribute("errMessage") == null) ? ""
                                        : request.getAttribute("errMessage")%>
                                <div class="form-group form-button">
                                        <input type="submit" name="signup" id="signup" class="form-submit" value="Đăng ký"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="../images/signup-image.jpg" alt="sing up image"></figure>
                            <a href="login.jsp" class="signup-image-link">Bạn đã có tài khoản? Đăng nhập</a>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../js/regform.js"></script>
    </body>
</html>
