package controller;

import dao.QuestionDAO;
import java.io.IOException;
import java.sql.Timestamp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Question;

public class ManagerQuestionServlet extends HttpServlet {

    QuestionDAO questionDAO = new QuestionDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String url = "";
        try {
            switch (command) {
                case "delete":
                    questionDAO.delete(Integer.parseInt(request.getParameter("question_id")));
                    url = "/admin/manager_question.jsp";
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();;
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String q_id = request.getParameter("question_id");
        String s_id = request.getParameter("subjectID");
        String content = request.getParameter("content");
        String qa = request.getParameter("qa");
        String qb = request.getParameter("qb");
        String qc = request.getParameter("qc");
        String qd = request.getParameter("qd");
        String qtrue = request.getParameter("qtrue");
        String level = request.getParameter("level");
        String image = request.getParameter("image");
        String audio = request.getParameter("audio");
        String url = "";
        try {
            switch (command) {
                case "insert":
                    questionDAO.insert(new Question(Integer.parseInt(s_id), content, qa, qb, qc, qd, qtrue, Integer.parseInt(level), image, audio, new Timestamp(System.currentTimeMillis())));
                    url = "/admin/manager_question.jsp";
                    break;
                case "update":
                    questionDAO.update(new Question(Integer.parseInt(q_id), Integer.parseInt(s_id), content, qa, qb, qc, qd, qtrue, Integer.parseInt(level), image, audio, new Timestamp(System.currentTimeMillis())));
                    url = "/admin/manager_question.jsp";
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();;
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
