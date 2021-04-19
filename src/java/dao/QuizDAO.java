package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Quiz;

public class QuizDAO {

    // get danh sách đề thi có  phân trang
    public ArrayList<Quiz> getListQuiz(int a, int b) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM quiz limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, a);
        ps.setInt(2, b);
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

    public Quiz getQuizByID(int id) throws Exception {
        Quiz qz = null;
        Connection connection = DBConnect.getConnecttion();
        String sql = "select * from quiz where QuizID=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            int qid = rs.getInt("QuizID");
            int sid = rs.getInt("SubjectID");
            String name = rs.getString("QuizName");
            int time = rs.getInt("Time");
            int totalq = rs.getInt("TotalQuestion");
            String image = rs.getString("Image");
            Timestamp createdate = rs.getTimestamp("CreateDate");
            qz = new Quiz(qid, sid, name, time, totalq, image, createdate);
        }
        return qz;
    }

    //Them moi
    public boolean insert(Quiz qz) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "INSERT INTO quiz VALUE(?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, qz.getQuizID());
            ps.setInt(2, qz.getSubjectID());
            ps.setString(3, qz.getQuizName());
            ps.setInt(4, qz.getTime());
            ps.setInt(5, qz.getTotalQuestion());
            ps.setString(6, qz.getImage());
            ps.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //cap nhat
    public boolean update(Quiz qz) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "update quiz set QuizName = ?, Time = ?, TotalQuestion = ?, Image = ?, CreateDate = ? WHERE QuizID = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, qz.getQuizName());
            ps.setInt(2, qz.getTime());
            ps.setInt(3, qz.getTotalQuestion());
            ps.setString(4, qz.getImage());
            ps.setTimestamp(5, qz.getCreatedate());
            ps.setInt(6, qz.getQuizID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

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

    //get list quiz by subject
    public ArrayList<Quiz> getListQuizBySubject(int subjectID, int a, int b) {
        Connection conn = DBConnect.getConnecttion();
        ArrayList<Quiz> list = new ArrayList();
        String sql = "SELECT * FROM quiz WHERE SubjectID ='" + subjectID + "' limit ?,?";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, a);
            stmt.setInt(2, b);
            ResultSet rs = stmt.executeQuery();
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //search
    public ArrayList<Quiz> search(String search) {
        Connection conn = DBConnect.getConnecttion();
        ArrayList<Quiz> list = new ArrayList();
        String sql = "SELECT * FROM quiz WHERE QuizName like ?";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + search + "%");
            ResultSet rs = stmt.executeQuery();
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //Total quiz number
    public int getCountQuizBySubject(int subjectID) {
        Connection conn = DBConnect.getConnecttion();
        ArrayList<Quiz> list = new ArrayList();
        String sql = "SELECT count(QuizID) FROM quiz WHERE SubjectID = '" + subjectID + "'";
        int count = 0;
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    //Total quiz number
    public int getCountQuiz() {
        Connection conn = DBConnect.getConnecttion();
        ArrayList<Quiz> list = new ArrayList();
        String sql = "SELECT count(QuizID) FROM quiz";
        int count = 0;
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public static void main(String[] args) {
        QuizDAO s = new QuizDAO();
        System.out.println(s.getCountQuiz());
    }
}
