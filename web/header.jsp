<%@page import="dao.ViewDAO"%>
<%@page import="model.Subject"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="model.Quiz"%>
<%@page import="dao.QuizDAO"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            SubjectDAO subjectDAO = new SubjectDAO();
            QuizDAO quizDAO = new QuizDAO();
            ViewDAO viewDAO = new ViewDAO();
        %>
        <%
            User u = new User();
            if (session.getAttribute("user") != null) {
                u = (User) session.getAttribute("user");
            } else {
                u.setFullName("");
            }

            // Tổng lượt truy cập    
            int view = viewDAO.getViews();
            application.setAttribute("view", view);
            if (view != 0) {
                viewDAO.updateView();
            }
        %>
        <nav class="fh5co-nav" role="navigation">
            <div class="top">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 text-right">
                            <p class="site">hatquiz.net</p>
                            <p class="num">Call: +01 123 456 7890</p>
                            <ul class="fh5co-social">
                                <li><a href="https://www.facebook.com/profile.php?id=100009726633978"><i class="icon-facebook2"></i></a></li>
                                <li><a href="https://www.instagram.com/phucan332/"><i class="icon-instagram"></i></a></li>
                                <li><a href="https://github.com/Hunterfairy47"><i class="icon-github"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="top-menu">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-2">
                            <div id="fh5co-logo"><a href="index.jsp"><i class="icon-study"></i>&ensp;HatQuiz</a></div>
                        </div>
                        <div class="col-xs-10 text-right menu-1">
                            <ul>
                                <li class="active"><a href="index.jsp">TRANG CHỦ</a></li>                                   
                                <li class="has-dropdown">
                                    <a href="quiz.jsp?pages=1">THI THPTQG</a>
                                    <ul class="dropdown">                                        
                                        <%
                                            for (Subject s : subjectDAO.getListSubject()) {
                                        %>
                                        <li><a href="quiz.jsp?subjectID=<%=s.getSubjectID()%>&pages=1"><%=s.getSubjectName()%></a></li>                                    
                                            <%
                                                }
                                            %>
                                    </ul>
                                </li>
                                <li><a href="contact.html">DIỄN ĐÀN</a></li>
                                    <%
                                        if (session.getAttribute("user") == null) {

                                    %>
                                <li class="btn-cta"><a href="login.jsp"><span>Đăng nhập</span></a></li>
                                <li class="btn-cta"><a href="register.jsp"><span>Đăng ký</span></a></li>
                                    <%} else {
                                    %>
                                <li class="has-dropdown">
                                    <a href="#"><%= u.getFullName()%></a>
                                    <ul class="dropdown">      
                                        <li><a href="#"><span>Thông tin</span></a></li>
                                        <li><a href="LogOutServlet"><span>Đăng xuất</span></a></li>
                                    </ul>   
                                </li>
                                <%}
                                %>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </body>
</html>
