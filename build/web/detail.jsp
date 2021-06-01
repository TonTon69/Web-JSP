<%@page import="dao.UserQuizDAO"%>
<%@page import="model.UserQuiz"%>
<%@page import="model.User"%>
<%@page import="model.Quiz"%>
<%@page import="dao.QuizDAO"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
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
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script> 
        <script type="text/javascript" src="js/testdetail.js"></script>
        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
    </head>
    <body>
        <div id="page">
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
            <jsp:include page="header.jsp"></jsp:include>    
                <div class="breadcrumb-wrap">
                    <div class="container-fluid">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                            <li class="breadcrumb-item"><a href="quiz.jsp?pages=1">Thi THPT QG</a></li>
                            <li class="breadcrumb-item"><a href="quiz.jsp?subject_id=<%=quiz.getSubjectID()%>&pages=1"><%=quiz.getSubjectName()%></a></li>
                        <li class="breadcrumb-item"><%=quiz.getQuizName()%></li>
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
                                Môn: <%=quiz.getSubjectName()%>
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
                        <div class="regulation">
                            <h3>Hướng dẫn làm bài trắc nghiệm</h3>
                            <div class="instruction-box">
                                1. Đợi đến khi đến thời gian làm bài
                                <br/>
                                <hr/>
                                2. Click vào nút <b>Bắt đầu làm bài</b> để tiến hành làm bài thi
                                <br/>
                                <hr/>
                                3. Ở mỗi câu hỏi, chọn đáp án đúng
                                <br/>
                                <hr/>
                                4. Hết thời gian làm bài, hệ thống sẽ tự thu bài. Bạn có thể nộp bài trước khi thời gian kết thúc bằng cách nhấn nút <b>Nộp bài</b>
                            </div>
                            <p class="note m-0">
                                Lưu ý:
                            </p>
                            <div class="note-content">
                                Trong quá trình làm bài phải thường xuyên nhấn nút <b>lưu bài</b> để lưu lại đáp án.
                                <br/>
                                Những câu <b>chưa chọn đáp án</b> sẽ được tính là <b>câu trả lời sai.</b>
                                <br/>
                                Nếu bạn <b>thoát ra</b> trong lúc chưa hết thời gian làm bài thi thì kết quả <b>sẽ không được tính.</b>
                                <br/>
                                Sau khi nhấn <b>"Nộp bài"</b>, bài thi sẽ kết thúc và bạn sẽ <b>không thể sửa được bài thi</b> nữa.
                                <br/>
                                Thời gian làm bài thi có hạn, chú ý chia thời gian hợp lý cho mỗi câu để đạt kết quả tốt nhất.
                            </div>
                        </div>
                        <div class="btn-group-do-exam">
                            <form action="CheckQServlet?idofquiz=<%=quiz.getQuizID()%>&idofsubject=<%=subjectID%>&idofuser=<%=userID%>&start=1" method="post">
                                <a>
                                    <button class="btn-do-exam" type="submit" id="startquiz"
                                            onclick="return confirm('Bạn đã sẵn sàng chinh phục đề thi này?')">Bắt đầu làm bài</button>
                                </a> 
                            </form>
                        </div>
                    </div>     

                    <div class="charts col-md-3 p-0">
                        <header class="card-header">
                            <h2 class="m-0">Bảng xếp hạng</h2>
                        </header>
                        <div class="exam-top-list">
                            <div class="top-header">
                                <div class="col name">Tên</div>
                                <div class="col">Điểm</div>
                                <div class="col">Thời gian</div>
                            </div>
                            <%
                                for (UserQuiz uq : new UserQuizDAO().getListUserQuizCharts(Integer.parseInt(quizID))) {
                                    int startTime = 0;
                                    int endTime = 0;
                                    int totalTime = 0;
                                    startTime = uq.getStarttime().getHours() * 3600 + uq.getStarttime().getMinutes() * 60 + uq.getStarttime().getSeconds();
                                    endTime = uq.getEndtime().getHours() * 3600 + uq.getEndtime().getMinutes() * 60 + uq.getEndtime().getSeconds();
                                    totalTime = endTime - startTime;
                                    int hours = totalTime / (60 * 60);
                                    int minutes = (totalTime - hours * 60 * 60) / 60;
                                    int seconds = (totalTime - hours * 60 * 60 - minutes * 60);
                                    minutes = hours * 60 + minutes;
                            %>
                            <div class="exam-item">
                                <div class="row-content">
                                    <div class="col name">
                                        <span><%=uq.getUsername()%></span>
                                    </div>
                                    <div class="col score"><fmt:formatNumber value="<%=uq.getScore()%>" minFractionDigits="0" maxFractionDigits="2"/>đ</div>
                                    <div class="col time"><%=minutes%>:<%=seconds%></div>
                                </div>
                            </div>
                            <hr/>                                
                            <%}%>
                        </div>
                    </div>
                    <h5 class="mb-2 text-center" style="color: red">Bạn có muốn chinh phục đề thi này</h5>
                    <div class="btn-group-do-exam">
                        <form action="CheckQServlet?idofquiz=<%=quiz.getQuizID()%>&idofsubject=<%=subjectID%>&idofuser=<%=userID%>&start=1" method="post">
                            <a>
                                <input class="btn-do-exam" style="width: 290px;" type="submit" value="Có, tôi muốn!"
                                       onclick="return confirm('Bạn đã sẵn sàng chinh phục đề thi này?')"/>
                            </a> 
                        </form>
                    </div>
                </div>
            </div>
            <div class="container"> 
                <h4><i class="fas fa-comments"></i> Ý kiến của bạn</h4>
                <div class="fb-comments" 
                     data-href="http://localhost:8080/hatquiz/detail.jsp?quiz_id=<%=quiz.getQuizID()%>&subject_id=<%=quiz.getSubjectID()%>" 
                     data-width="820" data-numposts="5">
                </div>
            </div>
            <div id="fh5co-course">
                <div class="container">
                    <div class="animate-box mb-5">
                        <div class="heading_luyenthi text-center">
                            <h2>Đề thi liên quan</h2>
                        </div>
                    </div>
                    <div class="row">
                        <%
                            for (Quiz q : quizDAO.getListQuizRelate(Integer.parseInt(subjectID))) {
                        %>
                        <div class="col-md-6 animate-box">
                            <div class="course">
                                <a
                                    href="detail.jsp?quiz_id=<%=q.getQuizID()%>&subject_id=<%=q.getSubjectID()%>"
                                    class="course-img"
                                    style="background-image: url('<%=q.getImage()%>')"
                                    >
                                </a>
                                <div class="desc">
                                    <h3>
                                        <a href="detail.jsp?quiz_id=<%=q.getQuizID()%>&subject_id=<%=q.getSubjectID()%>"
                                           ><%=q.getQuizName()%>
                                        </a
                                        >
                                    </h3>
                                    <p>
                                        <span>
                                            <i class="fa fa-bars"> </i>
                                            <a href="quiz.jsp?subject_id=<%=q.getSubjectID()%>&pages=1"><%=q.getSubjectName()%></a>
                                        </span>
                                        <span>
                                            <i class="fa fa-question-circle"> </i>
                                            Số câu hỏi: <%=q.getTotalQuestion()%> câu
                                        </span>
                                        <span>
                                            <i class="fa fa-clock"> </i>
                                            Thời gian: <%=q.getTime()%> phút
                                        </span>
                                        <span>
                                            <i class="fa fa-eye"> </i>
                                            Lượt xem: 9999
                                        </span>
                                        <span>
                                            <i class="far fa-edit"></i>
                                            Đăng tải: <fmt:formatDate pattern="dd-MM-yyyy" value="<%=q.getCreatedate()%>" />
                                        </span>
                                    </p>
                                    <span
                                        ><a href="detail.jsp?quiz_id=<%=q.getQuizID()%>&subject_id=<%=q.getSubjectID()%>" class="btn btn-primary btn-sm btn-course"
                                        >xem chi tiết</a
                                        ></span
                                    >
                                </div>
                            </div>
                        </div>
                        <%}%>
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

                                           //bảng xếp hạng
                                           $(function () {
                                               $('.col.name')[1].classList.add('top1');
                                               $('.col.name')[2].classList.add('top2');
                                               $('.col.name')[3].classList.add('top3');
                                           });
        </script>
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v10.0&appId=3495163843919139&autoLogAppEvents=1" nonce="fpT2NZnO"></script>
    </body>
</html>
