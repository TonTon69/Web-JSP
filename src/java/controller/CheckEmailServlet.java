package controller;

import dao.AdminDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckEmailServlet extends HttpServlet {
    AdminDAO adminDAO = new AdminDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        if (adminDAO.checkEmail(request.getParameter("email"))) {
//            response.getWriter().write("<img src=\"images/not-available.png\" />");
//        } else {
//            response.getWriter().write("<img src=\"images/available.png\" />");
//        }
    }
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String email = request.getParameter("email");
//        PrintWriter out = response.getWriter();
//        if (email != null && email.trim().length() > 0) {
//            String sql = "SELECT * FROM user WHERE ad_email='" + email.trim() + "' LIMIT 1";
//            Connection connection = null;
//            ResultSet resultSet = null;
//            try {
//                connection = DBConnect.getDBConnection();
//                resultSet = DBConnect.getDBResultSet(connection, sql);
//                if (resultSet != null) {
//                    if (resultSet.next()) {
//                        out.print("<span style='color:red'>Email unavailable</span>");
//                    } else {
//                        out.print("<span style='color:green'>Email available</span>");
//                    }
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//            finally {
//                if (resultSet != null) {
//                    DBConnect.closeResultSet(resultSet);
//                }
//            }
//        }
//        else {
//            out.print("<span style='color:red'>Username is required field.</span>");
//        }
//    }

}
