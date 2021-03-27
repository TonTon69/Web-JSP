/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AdminDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Administrator;

/**
 *
 * @author Admin
 */
public class AdminServlet extends HttpServlet {

    AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        String url = "";
        Administrator ad = new Administrator();
        HttpSession session = request.getSession();
        switch (command) {
            case "login":
                ad = adminDAO.login(request.getParameter("email"), request.getParameter("password"));
                if (ad != null) {
                    session.setAttribute("admin", ad);
                    url = "/index.jsp";
                }else{
                    session.setAttribute("error", "Email hoặc mật khẩu không đúng!");
                    url = "/login.jsp";
                }
                break;
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

}
