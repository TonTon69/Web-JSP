package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
//    public Subject getSubjectByID(int id) throws Exception {
//        Subject su = null;
//        Connection connection = DBConnect.getConnecttion();
//        String sql = "select * from subject where SubjectID=?";
//        PreparedStatement ps = connection.prepareStatement(sql);
//        ps.setInt(1, id);
//        ResultSet rs = ps.executeQuery();
//        if (rs.next()) {
//            int sid = rs.getInt("SubjectID");
//            String name = rs.getString("SubjectName");
//            String icon = rs.getString("Icon");
//            String des = rs.getString("Description");
//            Timestamp createdate = rs.getTimestamp("CreateDate");
//            su = new Subject(sid, name, icon, des, createdate);
//        }
//        return su;
//    }
//
//    //Them moi
//    public boolean insert(Subject s) throws SQLException {
//        try {
//            Connection connection = DBConnect.getConnecttion();
//            String sql = "INSERT INTO subject VALUE(?,?,?,?,?)";
//            PreparedStatement ps = connection.prepareCall(sql);
//            ps.setInt(1, s.getSubjectID());
//            ps.setString(2, s.getSubjectName());
//            ps.setString(3, s.getSubjectIcon());
//            ps.setString(4, s.getDescription());
//            ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
//            int temp = ps.executeUpdate();
//            return temp == 1;
//        } catch (SQLException ex) {
//            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return false;
//    }
//
//    //cap nhat
//    public boolean update(Subject s) throws SQLException {
//        try {
//            Connection connection = DBConnect.getConnecttion();
//            String sql = "update subject set SubjectName = ?, Icon = ?, Description = ?, CreateDate = ? WHERE SubjectID = ?";
//            PreparedStatement ps = connection.prepareCall(sql);
//            ps.setString(1, s.getSubjectName());
//            ps.setString(2, s.getSubjectIcon());
//            ps.setString(3, s.getDescription());
//            ps.setTimestamp(4, s.getCreatedate());
//            ps.setInt(5, s.getSubjectID());
//            return ps.executeUpdate() == 1;
//        } catch (SQLException ex) {
//            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return false;
//    }

    //xoa
    public boolean delete(int quiz_id) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "DELETE FROM quiz WHERE QuizID = ?";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.setInt(1, quiz_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
