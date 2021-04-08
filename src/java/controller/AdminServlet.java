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
import tools.MD5;

public class AdminServlet extends HttpServlet {

    AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String command = request.getParameter("command");
        String url = "";
        Administrator admin = new Administrator();
        HttpSession session = request.getSession();
        switch (command) {
            case "insert":
                admin.setFullName(name);
                admin.setEmail(email);
                admin.setPassword(MD5.encryption(password));
                adminDAO.registerAdmin(admin);
                session.setAttribute("admin", admin);
                url = "/admin/login.jsp";
                break;
            case "login":
                Administrator ad = adminDAO.checkLogin(email, MD5.encryption(password));
                if (ad != null) {
                    session.setAttribute("admin", ad);
                    url = "/admin/index.jsp";
                } else {
                    session.setAttribute("error", "Email hoặc mật khẩu không đúng!");
                    url = "/admin/login.jsp";
                }
                break;
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
