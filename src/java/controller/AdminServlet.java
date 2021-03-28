/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AdminDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Administrator;

/**
 *
 * @author Admin
 */
public class AdminServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    public AdminServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Sao chép tất cả các tham số đầu vào sang các biến cục bộ
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Administrator admin = new Administrator();
        admin.setFullName(fullname);
        admin.setEmail(email);
        admin.setPassword(password);

        AdminDAO adminDAO = new AdminDAO();
        //chèn dữ liệu vào cơ sở dữ liệu.
        String adminRegister = adminDAO.registerAdmin(admin);
        if (adminRegister.equals("SUCCESS")) // Khi thành công, chuyển sang trang đăng nhập
        {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else // Khi không thành công, hiển thị một thông báo lỗi
        {
            request.setAttribute("errMessage", adminRegister);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
