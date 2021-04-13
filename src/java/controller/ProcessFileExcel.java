package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FileDAO;
import dao.QuestionDAO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.print.Printer;
import javax.servlet.RequestDispatcher;
import model.Question;

public class ProcessFileExcel extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ProcessFileExcel() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html ; charset=utf-8");

        String url = "";
        String text = request.getParameter("data");
        String chucNang = request.getParameter("chucNang");
        // String[] s = text.split(",");

        if (chucNang == null || chucNang.equals("")) {

        } else // chức năng import câu hỏi từ excel
        if (chucNang.equals("Question")) {
            Map<String, Question> mapQuestion = new FileDAO(text).getQuestion(new FileDAO(text).getStringArray());
            if (!mapQuestion.isEmpty()) {
                if (!mapQuestion.isEmpty()) {
                    for (Question question : mapQuestion.values()) {
                        try {
                            new QuestionDAO().insert(question);
                        } catch (SQLException ex) {
                            Logger.getLogger(ProcessFileExcel.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
                url = "/admin/manager_question.jsp";
            }
        } else {
            System.out.println("Rỗng");
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
