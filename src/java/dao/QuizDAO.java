package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Quiz;

public class QuizDAO {

    // get danh sách đề thi 
    public ArrayList<Quiz> getListQuiz() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM quiz";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Quiz> list = new ArrayList<>();
        while (rs.next()) {
            Quiz q = new Quiz();
            q.setQuizID(rs.getInt("QuizID"));
            q.setSubjectID(rs.getInt("SubjectID"));
            q.setQuizName(rs.getString("QuizName"));
            q.setTime(rs.getInt("Time"));
            q.setTotalQuestion(rs.getInt("TotalQuestion"));
            q.setImage(rs.getString("Image"));
            q.setCreatedate(rs.getTimestamp("CreateDate"));
            list.add(q);
        }
        return list;
    }
}
