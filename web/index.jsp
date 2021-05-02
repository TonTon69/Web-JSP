<%@page import="model.Quiz"%>
<%@page import="controller.SessionCounter"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.QuizDAO"%>
<%@page import="model.Subject"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="dao.ViewDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>HatQuiz</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Free HTML5 Website Template by freehtml5.co" />
        <meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
        <meta name="author" content="freehtml5.co" />
        <meta property="og:title" content=""/>
        <meta property="og:image" content=""/>
        <meta property="og:url" content=""/>
        <meta property="og:site_name" content=""/>
        <meta property="og:description" content=""/>
        <meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />

        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400" rel="stylesheet">

        <!-- Animate.css -->
        <link rel="stylesheet" href="${root}/css/animate.css">
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="${root}/css/icomoon.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="${root}/css/bootstrap.css">

        <!-- Magnific Popup -->
        <link rel="stylesheet" href="${root}/css/magnific-popup.css">

        <!-- Owl Carousel  -->
        <link rel="stylesheet" href="${root}/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${root}/css/owl.theme.default.min.css">

        <!-- Flexslider  -->
        <link rel="stylesheet" href="${root}/css/flexslider.css">

        <!-- Theme style  -->
        <link rel="stylesheet" href="${root}/css/style.css">

        <!-- Modernizr JS -->
        <script src="${root}/js/modernizr-2.6.2.min.js"></script>
        <!-- FOR IE9 below -->
        <!--[if lt IE 9]>
        <script src="js/respond.min.js"></script>
        <![endif]-->

        <script id="GridToolbarTemplate" type="text/x-kendo-template">    
            <nav id="breadcrumb"></nav>
        </script>     

    </head>
    <body>
        <%
            SubjectDAO subjectDAO = new SubjectDAO();
            QuizDAO quizDAO = new QuizDAO();
            ViewDAO viewDAO = new ViewDAO();
            UserDAO userDAO = new UserDAO();
        %>

        <div id="page">
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="banner.jsp"></jsp:include>
            <%
                // Tổng lượt truy cập  
                int view = viewDAO.getViews();
                application.setAttribute("view", view);
                if (view != 0) {
                    if (session.isNew()) {
                        viewDAO.updateView();
                    }
                }

                // Tổng học viên
                int users = userDAO.getCount();
                request.setAttribute("users", users);

                // Đang truy cập
                SessionCounter counter = (SessionCounter) session.getAttribute(SessionCounter.COUNTER);

                // Tổng đề thi
                int countQ = quizDAO.getCountQuiz();
                request.setAttribute("countQ", countQ);

            %>
            <div id="fh5co-course-categories">
                <div class="container">
                    <div class="row animate-box">
                        <div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
                            <h2>Các môn thi</h2>
                            <p>Có làm thì mới có ăn, không làm mà đòi ăn thì chỉ có ăn ... ăn :poop:</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-6 text-center animate-box">
                            <div class="services">
                                <a class="icon" href="quiz.jsp?pages=1">
                                    <i class="fa fa-graduation-cap"></i>
                                </a>
                                <div class="desc">
                                    <h3><a href="quiz.jsp?pages=1">Tất cả</a></h3>
                                    <p>Biết thì nói là biết. Không biết thì nói là không biết. Thế mới gọi là biết.<br> <b><i>"Khổng Tử"</i></b></p>
                                </div>
                            </div>
                        </div>
                        <%                            for (Subject s : subjectDAO.getListSubject()) {
                        %>
                        <div class="col-md-4 col-sm-6 text-center animate-box">
                            <div class="services">
                                <a class="icon" href ="quiz.jsp?subject=<%=s.getSubjectID()%>&pages=1">
                                    <i class="<%=s.getSubjectIcon()%>"></i>
                                </a>
                                <div class="desc">
                                    <h3><a href="quiz.jsp?subject=<%=s.getSubjectID()%>&pages=1"><%=s.getSubjectName()%></a></h3>
                                    <p id="test"><%=s.getDescription()%></p>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>          
                    </div>
                </div>
            </div>

            <div id="fh5co-counter" class="fh5co-counters" style="background-image: url(images/img_bg_4.jpg);" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="row">
                                <div class="col-md-3 col-sm-6 text-center animate-box">
                                    <span class="icon"><i class="icon-world"></i></span>
                                    <span class="fh5co-counter js-counter" data-from="0" data-to="<%=view%>" data-speed="5000" data-refresh-interval="50"></span>
                                    <span class="fh5co-counter-label">Tổng lượt truy cập</span>
                                </div>
                                <div class="col-md-3 col-sm-6 text-center animate-box">
                                    <span class="icon"><i class="icon-study"></i></span>
                                    <span class="fh5co-counter js-counter" data-from="0" data-to="<%=users%>" data-speed="5000" data-refresh-interval="50"></span>
                                    <span class="fh5co-counter-label">Số lượng học viên</span>
                                </div>
                                <div class="col-md-3 col-sm-6 text-center animate-box">
                                    <span class="icon"><i class="fas fa-bolt"></i></span>
                                    <span class="fh5co-counter js-counter" data-from="0" data-to="<%=counter.getActiveSessionNumber()%>" data-speed="5000" data-refresh-interval="50"></span>
                                    <span class="fh5co-counter-label">Đang truy cập</span>
                                </div>
                                <div class="col-md-3 col-sm-6 text-center animate-box">
                                    <span class="icon"><i class="icon-book2"></i></span>
                                    <span class="fh5co-counter js-counter" data-from="0" data-to="<%=countQ%>" data-speed="5000" data-refresh-interval="50"></span>
                                    <span class="fh5co-counter-label">Số lượng đề thi</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="fh5co-course">
                <div class="container">
                    <div class="row animate-box">
                        <div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
                            <h2>Đề thi mới nhất</h2>
                            <p>" Những gì chúng ta biết ngày hôm nay sẽ lỗi thời vào ngày hôm sau. Nếu chúng ta ngừng học thì chúng ta sẽ ngừng phát triển."</p>
                        </div>
                    </div>
                    <div class="row">
                        <%
                            for (Quiz q : quizDAO.getListQuiz(1, 4)) {
                        %>    
                        <div class="col-md-6 animate-box">
                            <div class="course">
                                <a href="detail.jsp" class="course-img" style="background-image: url(<%=q.getImage()%>);">
                                </a>
                                <div class="desc">
                                    <h3><a href="detail.jsp""><%=q.getQuizName()%></a></h3>
                                    <p style="font-size: 15px; display: grid" class="ltin">
                                        <span><i class="fa fa-bars" aria-hidden="true"></i> <a href="quiz.jsp?subjectID=<%=q.getSubjectID()%>&pages=1"><%=q.getSubjectName()%></a></span>                                             
                                        <span><i class="fa fa-question-circle" aria-hidden="true"></i> Số câu hỏi: <b><%=q.getTotalQuestion()%> </b> </span>
                                        <span><i class="fa fa-clock" aria-hidden="true"></i>  Thời gian: <b><%=q.getTime()%></b></span> 
                                        <span><i class="fa fa-signal" aria-hidden="true"></i>  Lượt thi: 3071</span>
                                        <span><i class="fas fa-edit" aria-hidden="true"></i>  Ngày đăng: <%=q.getCreatedate()%></span>
                                    </p>
                                    <span><a href="detail.jsp" class="btn btn-primary btn-sm btn-course">Xem chi tiết</a></span>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>

            <div id="fh5co-testimonial" style="background-image: url(images/school.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row animate-box">
                        <div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
                            <h2><span>Cảm nhận người học</span></h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="row animate-box">
                                <div class="owl-carousel owl-carousel-fullwidth">
                                    <div class="item">
                                        <div class="testimony-slide active text-center">
                                            <div class="user" style="background-image: url(https://scontent-hkt1-1.xx.fbcdn.net/v/t1.0-9/159531302_1406717343006790_8090523326038381237_o.jpg?_nc_cat=108&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=52q6ERVWZMwAX9eiNOV&_nc_ht=scontent-hkt1-1.xx&oh=b46bfb4f13e66571d54cf27232b025ed&oe=60793808);"></div>
                                            <span>Hoàng cắt moi<br><small>Học sinh</small></span>
                                            <blockquote>
                                                <p>&ldquo;Nhờ các khóa học em đã có được định hướng cho bản thân mình, tự tin hơn và không cảm thấy hoang mang về các kĩ năng học nữa!&rdquo;</p>
                                            </blockquote>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="testimony-slide active text-center">
                                            <div class="user" style="background-image: url(https://scontent-hkt1-1.xx.fbcdn.net/v/t1.0-9/10245586_236509373220507_6333942251277991237_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=2c4854&_nc_ohc=Oi6tmPeqEWgAX-jExuZ&_nc_ht=scontent-hkt1-1.xx&oh=3eac1f99e06e54cdc978350ce4960a37&oe=60797703);"></div>
                                            <span>Trọng bụng mỡ<br><small>Học sinh</small></span>
                                            <blockquote>
                                                <p>&ldquo;Em đã học ở website này từ lâu rồi, thấy rất tốt, những bài giảng được làm rất công phu, hình ảnh đẹp và nét  .&rdquo;</p>
                                            </blockquote>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="testimony-slide active text-center">
                                            <div class="user" style="background-image: url(https://scontent-hkt1-1.xx.fbcdn.net/v/t1.0-9/98362483_1140601059607438_8599874791295418368_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=174925&_nc_ohc=_sZbqCaMqHEAX8_BoRh&_nc_ht=scontent-hkt1-1.xx&oh=6b772c352b1f9fcc5debc0ca54955740&oe=607750F0);"></div>
                                            <span>Ân đầu moi<br><small>Học sinh</small></span>
                                            <blockquote>
                                                <p>&ldquo;Các Khóa học trên website rất bổ ích giúp em có thêm nhiều kỹ năng sống, làm việc. Em cảm thấy rất tự tin vào bản thân!&rdquo;</p>
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>
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
            simplyCountdown('.simply-countdown-one', {
                year: d.getFullYear(),
                month: d.getMonth() + 1,
                day: d.getDate()
            });
//jQuery example
            $('#simply-countdown-losange').simplyCountdown({
                year: d.getFullYear(),
                month: d.getMonth() + 1,
                day: d.getDate(),
                enableUtc: false
            });
        </script>
    </body>
</html>