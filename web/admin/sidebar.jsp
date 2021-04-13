<%-- 
    Document   : sidebar
    Created on : Mar 24, 2021, 8:01:00 PM
    Author     : admin
--%>
<%@page import="model.Administrator"%>
<%@page import="dao.AdminDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connect.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
    </head>
    <body>
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${root}/admin">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fa fa-graduation-cap"></i>
                </div>
                <div class="sidebar-brand-text mx-3">HAT Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="${root}/admin">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading">
                Quản lý
            </div>
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                   aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fa fa-graduation-cap"></i>
                    <span>Môn học</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${root}/admin/manager_subject.jsp">Danh sách môn học</a>
                        <a class="collapse-item" href="${root}/admin/insert_subject.jsp">Thêm mới môn học</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                   aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-folder-open"></i>
                    <span>&nbsp;Đề thi</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                     data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${root}/admin/manager_quiz.jsp">Danh sách đề thi</a>
                        <a class="collapse-item" href="${root}/admin/insert_quiz.jsp">Thêm mới đề thi</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseQuestions"
                   aria-expanded="true" aria-controls="collapseQuestions">
                    <i class="fas fa-question-circle"></i>
                    <span>&nbsp;Câu hỏi</span>
                </a>
                <div id="collapseQuestions" class="collapse" aria-labelledby="headingUtilities"
                     data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${root}/admin/manager_question.jsp">Danh sách câu hỏi</a>
                        <a class="collapse-item" href="${root}/admin/insert_question.jsp">Thêm mới câu hỏi</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseAdmins"
                   aria-expanded="true" aria-controls="collapseAdmins">
                    <i class="fas fa-users-cog"></i>
                    <span>Quản trị</span>
                    <span class="badge badge-danger badge-counter">
                        <%
                            try {
                                Connection connection = DBConnect.getConnecttion();
                                String sql = "SELECT COUNT(*) FROM administrator WHERE STATUS = false";
                                PreparedStatement ps = connection.prepareCall(sql);
                                ResultSet rs = ps.executeQuery();
                                String Countrow = "";
                                while (rs.next()) {
                                    Countrow = rs.getString(1);
                                    out.println(Countrow);
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </span>

                </a>
                <div id="collapseAdmins" class="collapse" aria-labelledby="headingUtilities"
                     data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${root}/admin/manager_admin.jsp">Danh sách quản trị
                            <span class="badge badge-danger">
                                <%
                                    try {
                                        Connection connection = DBConnect.getConnecttion();
                                        String sql = "SELECT COUNT(*) FROM administrator WHERE STATUS = false";
                                        PreparedStatement ps = connection.prepareCall(sql);
                                        ResultSet rs = ps.executeQuery();
                                        String Countrow = "";
                                        while (rs.next()) {
                                            Countrow = rs.getString(1);
                                            out.println(Countrow);
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </span>
                        </a>
                        <a class="collapse-item" href="${root}/admin/insert_admin.jsp">Thêm mới quản trị</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseStudents"
                   aria-expanded="true" aria-controls="collapseStudents">
                    <i class="fas fa-users"></i>
                    <span>Học viên</span>
                </a>
                <div id="collapseStudents" class="collapse" aria-labelledby="headingUtilities"
                     data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${root}/admin/manager_user.jsp">Danh sách học viên</a>
                        <a class="collapse-item" href="${root}/admin/insert_user.jsp">Thêm mới học viên</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                   aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="login.html">Banner</a>
                        <a class="collapse-item" href="register.html">Menu</a>
                        <div class="collapse-divider"></div>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <!-- End of Sidebar -->
    </body>
</html>
