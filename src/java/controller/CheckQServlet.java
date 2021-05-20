package controller;

import dao.QuestionDAO;
import dao.UserQuizDAO;
//import dao.UserQuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Question;
import model.User;
import model.UserQuiz;

public class CheckQServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String url = "";
        int userID = Integer.parseInt(request.getParameter("idofuser"));
        int subjectID = Integer.parseInt(request.getParameter("idofsubject"));
        int quizID = Integer.parseInt(request.getParameter("idofquiz"));
        int checkStart = Integer.parseInt(request.getParameter("start"));
        try {
            /*------------------------------------------------------------------*/
            switch (checkStart) {
                case 0:
                    if (userID == 0) {
                        url = "/login.jsp";
                    } else {
                        /*lưu các dữ liệu ban đầy như người làm đề nào thời gian bắt đầu vào session*/
                        UserQuiz userquiz = new UserQuiz();
                        userquiz.setUserID(userID);
                        userquiz.setQuizID(quizID);
                        Date date = new Date(System.currentTimeMillis());
                        Time time = new Time(System.currentTimeMillis());
                        userquiz.setStarttime(time);
                        userquiz.setStartday(date);
                        session.setAttribute("userquiz", userquiz);
                        url = "/doquiz.jsp?quiz_id=" + quizID + "&subject_id=" + subjectID + "&start=1";
                    }
                    break;
                case 1:
                    QuestionDAO qdao = new QuestionDAO();
                    int sumCorrectAnswer = 0;
                    int sumUnselectedQuestion = 0;
                    float score = 0;
                    int sumQuestions = qdao.getListQuestionByQuiz(quizID).size();
                    for (Question ds : qdao.getListQuestionByQuiz(quizID)) {
                        if (request.getParameter(Integer.toString(ds.getQuestionID())) != null) {
                            String answer = request.getParameter(Integer.toString(ds.getQuestionID()));//lấy ra đáp án mà người dùng chọn
                            if (answer.equals(ds.getqTrue()))// so sánh với đáp án đúng
                            {
                                sumCorrectAnswer++;
                            }
                        } else {
                            sumUnselectedQuestion++;
                        }
                    }
                    score = ((float) sumCorrectAnswer / sumQuestions) * 10;
                    request.setAttribute("score", score);
                    request.setAttribute("sumcorrectanswer", sumCorrectAnswer);
                    request.setAttribute("sumquestion", sumQuestions);

                    /*lưu các dữ liệu như điểm thời gian kết thúc số câu đúng vào session*/
                    UserQuiz userquiz = (UserQuiz) session.getAttribute("userquiz");
                    userquiz.setScore(score);
                    userquiz.setTotalanswertrue(sumCorrectAnswer);
                    Date date = new Date(System.currentTimeMillis());
                    Time time = new Time(System.currentTimeMillis());
                    userquiz.setEndtime(time);
                    userquiz.setEndday(date);
                    /*kết thúc lưu trữ vào session*/
                    /*hiển thị thời gian làm bài*/
                    int startTime = 0;
                    int endTime = 0;
                    int totalTime = 0;
                    startTime = userquiz.getStarttime().getHours() * 3600 + userquiz.getStarttime().getMinutes() * 60 + userquiz.getStarttime().getSeconds();
                    endTime = userquiz.getEndtime().getHours() * 3600 + userquiz.getEndtime().getMinutes() * 60 + userquiz.getEndtime().getSeconds();
                    totalTime = endTime - startTime;
                    int hours = totalTime / (60 * 60);
                    int minutes = (totalTime - hours * 60 * 60) / 60;
                    int seconds = (totalTime - hours * 60 * 60 - minutes * 60);
                    minutes = hours * 60 + minutes;
                    request.setAttribute("minutes", minutes);
                    request.setAttribute("seconds", seconds);
                    /*kết thúc hiển thị thời gian làm bài*/
                    /*lấy dự liệu từ session bắt đầu lưu dữ liệu xuống database*/
                    UserQuizDAO uqDao = new UserQuizDAO();
                    uqDao.insertUserQuiz(userquiz);
                    /*kết thúc lưu dữ liệu*/
                    url = "/doquiz.jsp?quiz_id=" + quizID + "&subject_id=" + subjectID + "&start=1";
                    break;
            }

            /*------------------------------------------------------------------*/
        } catch (Exception ex) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
