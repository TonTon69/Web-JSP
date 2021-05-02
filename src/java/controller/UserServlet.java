package controller;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import tools.MD5;

public class UserServlet extends HttpServlet {

    UserDAO usersDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String url = "";
        User users = new User();
        HttpSession session = request.getSession();
        try {
            switch (command) {
                case "insert":
                    users.setFullName(request.getParameter("name"));
                    users.setEmail(request.getParameter("email"));
                    users.setPassword(MD5.encryption(request.getParameter("password")));
                    users.setPhone(request.getParameter("phone"));
                    users.setAddress(request.getParameter("address"));
                    usersDAO.insert(users);
                    session.setAttribute("user", users);
                    url = "/login.jsp";
                    break;
                case "login":
                    users = usersDAO.login(request.getParameter("email"), MD5.encryption(request.getParameter("pass")));
                    if (users != null) {
                        session.setAttribute("user", users);
                        url = "/index.jsp";
                    } else {
                        session.setAttribute("error", "Email hoặc mật khẩu không đúng!");
                        url = "/login.jsp";
                    }
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();;
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
