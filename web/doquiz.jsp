<%@page import="model.User"%>
<%@page import="model.Question"%>
<%@page import="dao.QuestionDAO"%>
<%@page import="model.Quiz"%>
<%@page import="dao.QuizDAO"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap-grid.min.css" integrity="sha512-cKoGpmS4czjv58PNt1YTHxg0wUDlctZyp9KUxQpdbAft+XqnyKvDvcGX0QYCgCohQenOuyGSl8l1f7/+axAqyg==" crossorigin="anonymous" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Quiz &mdash; HAT</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta
            name="description"
            content="Free HTML5 Website Template by freehtml5.co"
            />
        <meta
            name="keywords"
            content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive"
            />
        <meta name="author" content="freehtml5.co" />

        <!-- Facebook and Twitter integration -->
        <meta property="og:title" content="" />
        <meta property="og:image" content="" />
        <meta property="og:url" content="" />
        <meta property="og:site_name" content="" />
        <meta property="og:description" content="" />
        <meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />

        <link
            href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400"
            rel="stylesheet"
            />

        <!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css" />
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="css/icomoon.css" />
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="css/bootstrap.css" />

        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/magnific-popup.css" />

        <!-- Owl Carousel  -->
        <link rel="stylesheet" href="css/owl.carousel.min.css" />
        <link rel="stylesheet" href="css/owl.theme.default.min.css" />

        <!-- Flexslider  -->
        <link rel="stylesheet" href="css/flexslider.css" />

        <!-- Pricing -->
        <link rel="stylesheet" href="css/pricing.css" />

        <!-- Theme style  -->
        <link rel="stylesheet" href="css/style.css" />        
        <link rel="stylesheet" href="css/luyenthi.css" />
        <link rel="stylesheet" href="css/responsive.css" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
        <script type="text/javascript" src="js/countdownTQ.js"></script>
        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
    </head>
    <body>
        <%
            QuizDAO quizDAO = new QuizDAO();
            Quiz quiz = new Quiz();
            String quizID = "", subjectID = "";
            int userID = 0;
            if (request.getParameter("quiz_id") != null) {
                quizID = request.getParameter("quiz_id");
                quiz = quizDAO.getQuizByQuizID(Integer.parseInt(quizID));
            }
            if (request.getParameter("subject_id") != null) {
                subjectID = request.getParameter("subject_id");
            }
            User u = (User) session.getAttribute("user");
            if (u != null) {
                userID = u.getUserID();
            }

        %>
        <div id="page">
            <jsp:include page="header.jsp"></jsp:include>    
                <div class="breadcrumb-wrap">
                    <div class="container-fluid">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                            <li class="breadcrumb-item"><a href="quiz.jsp?pages=1">Thi THPT QG</a></li>
                            <li class="breadcrumb-item">Làm bài thi</li>
                        </ul>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="detail col-md-9">
                            <h3 class="m-0"><%=quiz.getQuizName()%></h3>
                        <p>
                            <span>
                                <i class="fa fa-clock"> </i>
                                Cập nhật: <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value="<%=quiz.getCreatedate()%>" />
                            </span>  
                        </p>
                        <div class="detail-question">
                            <span class="mr-2"> 
                                <i class="fa fa-check-square"> </i>
                                Môn:&nbsp;<a href=""><%=quiz.getSubjectName()%></a>
                            </span>                            
                            <span class="mr-2">
                                <i class="fa fa-list-alt"> </i>
                                Số câu hỏi: <%=quiz.getTotalQuestion()%> câu
                            </span>  
                            <span class="mr-2">
                                <i class="fa fa-clock"> </i>
                                Thời gian: <span id="countdown" style="color: red; font-size: 30px;"></span> / <span id="timeofquiz"><%=quiz.getTime()%></span>:00
                            </span>
                        </div>

                        <div class="contentoftest">
                            <form action="CheckQServlet?idofquiz=<%=quiz.getQuizID()%>&idofsubject=<%=subjectID%>&idofuser=<%=userID%>&start=1" method="post"> 
                                <div> 
                                    <!--content-->
                                    <% QuestionDAO quesDao = new QuestionDAO();%>
                                    <div>
                                        <%
                                            int i = 1;
                                            for (Question ques : quesDao.getListQuestionByQuiz(quiz.getQuizID())) {
                                        %>
                                        <div class="formatquestion" >
                                            <p><b><%=i%>. <%=ques.getContent()%></b></p>
                                            <p>
                                                <input type="radio" name="<%=ques.getQuestionID()%>" value="<%=ques.getqA()%>" > 
                                                A. <%=ques.getqA()%>
                                            </p>
                                            <p>
                                                <input type="radio" name="<%=ques.getQuestionID()%>" value="<%=ques.getqB()%>" > 
                                                A. <%=ques.getqB()%>
                                            </p>
                                            <p>
                                                <input type="radio" name="<%=ques.getQuestionID()%>" value="<%=ques.getqC()%>" > 
                                                A. <%=ques.getqC()%>
                                            </p>
                                            <p>
                                                <input type="radio" name="<%=ques.getQuestionID()%>" value="<%=ques.getqD()%>" > 
                                                A. <%=ques.getqD()%>
                                            </p>
                                        </div>
                                        <%
                                                i = i + 1;
                                            }
                                        %>  
                                    </div>
                                </div>
                                <div class="btn-group-do-exam">
                                    <input class="btn-do-exam" type="submit" name="submitName" value="Nộp bài">
                                </div>
                            </form>   
                        </div> 
                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
        <div class="gototop js-top">
            <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
        </div>

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.waypoints.min.js"></script>
        <!-- Stellar Parallax -->
        <script src="js/jquery.stellar.min.js"></script>
        <!-- Carousel -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- Flexslider -->
        <script src="js/jquery.flexslider-min.js"></script>
        <!-- countTo -->
        <script src="js/jquery.countTo.js"></script>
        <!-- Magnific Popup -->
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/magnific-popup-options.js"></script>
        <!-- Count Down -->
        <script src="js/simplyCountdown.js"></script>
        <!-- Main -->
        <script src="js/main.js"></script>
        <script>
            var d = new Date(new Date().getTime() + 1000 * 120 * 120 * 2000);

            // default example
            simplyCountdown(".simply-countdown-one", {
                year: d.getFullYear(),
                month: d.getMonth() + 1,
                day: d.getDate(),
            });

            //jQuery example
            $("#simply-countdown-losange").simplyCountdown({
                year: d.getFullYear(),
                month: d.getMonth() + 1,
                day: d.getDate(),
                enableUtc: false,
            });
            
            //scroll time
            window.onscroll = function () {
                scrollFunction()
            };

            function scrollFunction() {
                var countdown = document.getElementById("countdown");
                if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
                    countdown.style.position = "fixed";
                    countdown.style.top = "0";
                    countdown.style.right = "20%";
                    countdown.style.background = "#fafafa";
                    countdown.style.padding = "20px 40px";
                    countdown.style.borderRadius = "5px";
                } else {
                    countdown.style.position = "unset";
                    countdown.style.background = "unset";
                    countdown.style.padding = "unset";
                    countdown.style.borderRadius = "unset";
                }
            }
        </script>
    </body>
</html>
