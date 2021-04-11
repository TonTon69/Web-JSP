<%-- 
    Document   : manager_subject
    Created on : Mar 24, 2021, 8:35:28 PM
    Author     : admin
--%>

<%@page import="model.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.QuestionDAO"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${root}/css/sb-admin-2.min.css" rel="stylesheet">
        <link href="${root}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <%
            QuestionDAO questionDAO = new QuestionDAO();
            ArrayList<Question> listQuestion = questionDAO.getListQuestion();
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
                            <h3>QUẢN LÝ CÂU HỎI</h3>

                            <div class="d-flex mb-4">
                                <a href="${root}/admin/insert_question.jsp" class="btn btn-primary">
                                <i class="fas fa-plus"></i>
                                Thêm mới câu hỏi
                            </a>
                        </div>
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">DANH SÁCH CÂU HỎI</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Mã</th>
                                                <th>Mã MH</th>
                                                <th>Mã đề</th>
                                                <th>Câu hỏi</th>
                                                <th>A</th>
                                                <th>B</th>
                                                <th>C</th>
                                                <th>D</th>
                                                <th>True</th>
                                                <th>Level</th>
                                                <th>Ảnh</th>
                                                <th>Audio</th>
                                                <th>Ngày tạo</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <%
                                            int count = 0;
                                            for (Question q : listQuestion) {
                                                count++;
                                        %>
                                        <tbody>
                                            <tr>
                                                <th scope="row"><%=count%></th>
                                                <td><%=q.getQuestionID()%></td>
                                                <td><%=q.getSubjectID()%></td>
                                                <td><%=q.getQuizID()%></td>
                                                <td><%=q.getContent()%></td>
                                                <td><%=q.getqA()%></td>
                                                <td><%=q.getqB()%></td>
                                                <td><%=q.getqC()%></td>
                                                <td><%=q.getqD()%></td>
                                                <td><%=q.getqTrue()%></td>
                                                <td><%=q.getLevel()%></td>
                                                <td><%=q.getImage()%></td>
                                                <td><%=q.getAudio()%></td>
                                                <td><%=q.getCreatedate()%></td>
                                                <td>
                                                    <a href="${root}/admin/update_question.jsp?command=update&question_id=<%=q.getQuestionID()%>" class="btn btn-primary">
                                                        <i class="far fa-edit"></i>
                                                    </a>
                                                    <a href="${root}/ManagerQuestionServlet?command=delete&question_id=<%=q.getQuestionID()%>" class="btn btn-danger">
                                                        <i class="far fa-trash-alt"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </tbody>
                                        <%}%>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
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
            <script src="${root}/vendor/jquery/jquery.min.js"></script>
        <script src="${root}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${root}/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${root}/js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="${root}/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="${root}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!--         Page level custom scripts 
                <script src="${root}/js/demo/datatables-demo.js"></script>-->
    </body>
</html>
