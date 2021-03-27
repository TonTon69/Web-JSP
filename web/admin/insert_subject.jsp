<%-- 
    Document   : insert_subject
    Created on : Mar 27, 2021, 9:27:39 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>HAT Admin - Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
    </head>
    <body id="page-top">

        <%
            String error = "";
            if (request.getParameter("error") != null) {
                error = (String) request.getParameter("error");
            }
        %>

        <div id="wrapper">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div id="content-wrapper" class="d-flex flex-column">

                    <!-- Main Content -->
                    <div id="content">
                        <!--Header-->
                    <jsp:include page="header.jsp"></jsp:include>
                        <!-- Begin Page Content -->
                        <div class="container-fluid">
                            <h3>THÊM MỚI MÔN HỌC</h3>
                            <div>
                                <i class="fas fa-list"></i>
                                <a href="manager_subject.jsp">Quay về quản lý môn học</a>
                            </div>
                            <br/>
                            <form action="/hatquiz/ManagerSubjectServlet" method="post">
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label for="name">Tên môn học</label>
                                        <input type="text" class="form-control" name="name" id="name" placeholder="Nhập tên môn học...">
                                    <%=error%>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="icon">Icon</label>
                                    <input type="text" class="form-control" name="icon" id="icon" placeholder="Nhập icon...">
                                    <%=error%>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-8">
                                    <label for="description">Mô tả</label>
                                    <textarea type="text" class="form-control" name="description" id="description" placeholder="Nhập mô tả..."></textarea>
                                    <%=error%>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Thêm mới</button>
                        </form>
                    </div>
                </div>
                <!-- End of Main Content -->

                <jsp:include page="footer.jsp"></jsp:include>

                </div>
            </div>

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
        <jsp:include page="logout_modal.jsp"></jsp:include>
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>
    </body>
</html>
