<%@page import="model.User"%>
<%@page import="model.Question"%>
<%@page import="dao.QuestionDAO"%>
<%@page import="model.Quiz"%>
<%@page import="dao.QuizDAO"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap-grid.min.css" integrity="sha512-cKoGpmS4czjv58PNt1YTHxg0wUDlctZyp9KUxQpdbAft+XqnyKvDvcGX0QYCgCohQenOuyGSl8l1f7/+axAqyg==" crossorigin="anonymous" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Quiz &mdash; HAT</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
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
        <link rel="stylesheet" href="${root}/css/animate.css" />
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="${root}/css/icomoon.css" />
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="${root}/css/bootstrap.css" />

        <!-- Magnific Popup -->
        <link rel="stylesheet" href="${root}/css/magnific-popup.css" />

        <!-- Owl Carousel  -->
        <link rel="stylesheet" href="${root}/css/owl.carousel.min.css" />
        <link rel="stylesheet" href="${root}/css/owl.theme.default.min.css" />

        <!-- Flexslider  -->
        <link rel="stylesheet" href="${root}/css/flexslider.css" />

        <!-- Pricing -->
        <link rel="stylesheet" href="${root}/css/pricing.css" />

        <!-- Theme style  -->
        <link rel="stylesheet" href="${root}/css/style.css" />        
        <link rel="stylesheet" href="${root}/css/luyenthi.css" />
        <link rel="stylesheet" href="${root}/css/responsive.css" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
        <script type="text/javascript" src="${root}/js/countdownTQ.js"></script>
        <!-- Modernizr JS -->
        <script src="${root}/js/modernizr-2.6.2.min.js"></script>
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
                            <li class="breadcrumb-item">Kết quả thi</li>
                        </ul>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="detail col-md-8">
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
                                Thời gian: <%=quiz.getTime()%> phút
                            </span>
                        </div>

                        <div class="contentoftest">
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
                        </div> 
                    </div>
                    <div class="charts col-md-3 p-0" style="display: inline-table;">
                        <div class="box-charts">
                            <header class="card-header">
                                <h2 class="m-0">Kết quả</h2>
                            </header>
                            <div class="exam-top-list">
                                <div class="top-header">
                                    <div class="col name">Số câu đúng</div>
                                    <div class="col">Điểm</div>
                                    <div class="col">Thời gian</div>
                                </div>
                                <div class="exam-item">
                                    <div class="row-content">
                                        <div class="col name">
                                            <span>
                                                <!--tổng số câu đúng-->
                                                <%if (request.getAttribute("sumcorrectanswer") != null) {%>
                                                <%=request.getAttribute("sumcorrectanswer")%>/<%=request.getAttribute("sumquestion")%>
                                                <%}%>
                                                <!--tổng số câu đúng-->
                                            </span>
                                        </div>
                                        <div class="col"> <!--chứa kết quả điểm số-->
                                            <!--điểm số-->
                                            <%if (request.getAttribute("score") != null) {
                                            %>
                                            <%=request.getAttribute("score")%>đ
                                            <%
                                                }%>
                                            <!--điểm số-->
                                        </div>
                                        <div class="col"> <!--chứa thời gian làm bài-->
                                            <!--thời gian đã làm bài-->
                                            <%if (request.getAttribute("minutes") != null && request.getAttribute("seconds") != null) {%>
                                            <%=request.getAttribute("minutes")%>:<%=request.getAttribute("seconds")%>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                            </div>
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
            <script src="${root}/js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="${root}/js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="${root}/js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="${root}/js/jquery.waypoints.min.js"></script>
        <!-- Stellar Parallax -->
        <script src="${root}/js/jquery.stellar.min.js"></script>
        <!-- Carousel -->
        <script src="${root}/js/owl.carousel.min.js"></script>
        <!-- Flexslider -->
        <script src="${root}/js/jquery.flexslider-min.js"></script>
        <!-- countTo -->
        <script src="${root}/js/jquery.countTo.js"></script>
        <!-- Magnific Popup -->
        <script src="${root}/js/jquery.magnific-popup.min.js"></script>
        <script src="${root}/js/magnific-popup-options.js"></script>
        <!-- Count Down -->
        <script src="${root}/js/simplyCountdown.js"></script>
        <!-- Main -->
        <script src="${root}/js/main.js"></script>
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
        </script>
    </body>
</html>
