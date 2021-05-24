<%@page import="model.Quiz"%>
<%@page import="model.Subject"%>
<%@page import="controller.SessionCounter"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.ViewDAO"%>
<%@page import="dao.QuizDAO"%>
<%@page import="dao.SubjectDAO"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
            rel="stylesheet"
            />
    </head>
    <body>
        <%
            SubjectDAO subjectDAO = new SubjectDAO();
            QuizDAO quizDAO = new QuizDAO();
            ViewDAO viewDAO = new ViewDAO();
            UserDAO userDAO = new UserDAO();
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
                            <a class="icon" href="quiz.jsp?subjectID=<%=s.getSubjectID()%>&pages=1">
                                <i class="<%=s.getSubjectIcon()%>"></i>
                            </a>
                            <div class="desc">
                                <h3><a href="quiz.jsp?subjectID=<%=s.getSubjectID()%>&pages=1"><%=s.getSubjectName()%></a></h3>
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

        <div id="fh5co-counter" class="fh5co-counters" data-stellar-background-ratio="0.5">
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
                        <p class="m-0">"Những gì chúng ta biết ngày hôm nay sẽ lỗi thời vào ngày hôm sau.</p>
                        <p>Nếu chúng ta ngừng học thì chúng ta sẽ ngừng phát triển."</p>
                    </div>
                </div>
                <div class="row">
                    <%
                        for (Quiz q : quizDAO.getListQuizLatest()) {
                    %>    
                    <div class="col-md-6 animate-box">
                        <div class="course">
                            <a href="detail.jsp?quiz_id=<%=q.getQuizID()%>&subject_id=<%=q.getSubjectID()%>" class="course-img" style="background-image: url(<%=q.getImage()%>);">
                            </a>
                            <div class="desc">
                                <h3><a href="detail.jsp?quiz_id=<%=q.getQuizID()%>&subject_id=<%=q.getSubjectID()%>"><%=q.getQuizName()%></a></h3>
                                <p style="font-size: 15px; display: grid" class="ltin">
                                    <span><i class="fa fa-bars" aria-hidden="true"></i> <a href="quiz.jsp?subjectID=<%=q.getSubjectID()%>&pages=1"><%=q.getSubjectName()%></a></span>                                             
                                    <span><i class="fa fa-question-circle" aria-hidden="true"></i> Số câu hỏi: <%=q.getTotalQuestion()%> câu </span>
                                    <span><i class="fa fa-clock" aria-hidden="true"></i>  Thời gian: <%=q.getTime()%> phút</span> 
                                    <span><i class="fa fa-signal" aria-hidden="true"></i>  Lượt thi: 3071</span>
                                    <span><i class="fas fa-edit" aria-hidden="true"></i> Đăng tải: <fmt:formatDate pattern="dd-MM-yyyy" value="<%=q.getCreatedate()%>" /></span>
                                </p>
                                <span><a href="detail.jsp?quiz_id=<%=q.getQuizID()%>&subject_id=<%=q.getSubjectID()%>" class="btn btn-primary btn-sm btn-course">Xem chi tiết</a></span>
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
                                        <div class="user" style="background-image: url('images/anh-anime-1.jpg');"></div>
                                        <span>Hoàng cắt moi<br><small>Học sinh</small></span>
                                        <blockquote>
                                            <p>&ldquo;Nhờ các khóa học em đã có được định hướng cho bản thân mình, tự tin hơn và không cảm thấy hoang mang về các kĩ năng học nữa!&rdquo;</p>
                                        </blockquote>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimony-slide active text-center">
                                        <div class="user" style="background-image: url('images/anh-anime-2.jpg');"></div>
                                        <span>Trọng bụng mỡ<br><small>Học sinh</small></span>
                                        <blockquote>
                                            <p>&ldquo;Em đã học ở website này từ lâu rồi, thấy rất tốt, những bài thi được làm rất công phu, hình ảnh đẹp và nét!&rdquo;</p>
                                        </blockquote>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimony-slide active text-center">
                                        <div class="user" style="background-image: url('images/anh-anime-3.jpg');"></div>
                                        <span>Ân đầu moi<br><small>Học sinh</small></span>
                                        <blockquote>
                                            <p>&ldquo;Các khóa học trên website rất bổ ích giúp em có thêm nhiều kỹ năng sống, làm việc. Em cảm thấy rất tự tin vào bản thân!&rdquo;</p>
                                        </blockquote>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
