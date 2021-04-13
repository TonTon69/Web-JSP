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
import model.Question;

public class QuestionDAO {

    // get danh sách câu hỏi
    public ArrayList<Question> getListQuestion() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM question";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Question> list = new ArrayList<>();
        while (rs.next()) {
            Question q = new Question();
            q.setQuestionID(rs.getInt("QuestionID"));
            q.setSubjectID(rs.getInt("SubjectID"));
            q.setQuizID(rs.getInt("QuizID"));
            q.setContent(rs.getString("Content"));
            q.setqA(rs.getString("Q_A"));
            q.setqB(rs.getString("Q_B"));
            q.setqC(rs.getString("Q_C"));
            q.setqD(rs.getString("Q_D"));
            q.setqTrue(rs.getString("Q_True"));
            q.setLevel(rs.getInt("Level"));
            q.setImage(rs.getString("Image"));
            q.setAudio(rs.getString("Audio"));
            q.setCreatedate(rs.getTimestamp("CreateDate"));
            list.add(q);
        }
        return list;
    }
    
    public Question getQuestionByID(int id) throws Exception {
        Question q = null;
        Connection connection = DBConnect.getConnecttion();
        String sql = "select * from question where QuestionID=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            int qid = rs.getInt("QuestionID");
            int sid = rs.getInt("SubjectID");
            int quizid = rs.getInt("QuizID");
            String content = rs.getString("Content");
            String qa = rs.getString("Q_A");
            String qb = rs.getString("Q_B");
            String qc = rs.getString("Q_C");
            String qd = rs.getString("Q_D");
            String qtrue = rs.getString("Q_True");
            int level = rs.getInt("Level");
            String image = rs.getString("Image");
            String audio = rs.getString("Audio");
            Timestamp createdate = rs.getTimestamp("CreateDate");
            q = new Question(qid, sid, quizid, content, qa, qb, qc, qd, qtrue, level, image, audio, createdate);
        }
        return q;
    }

    //Them moi
    public boolean insert(Question s) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "INSERT INTO question VALUE(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, s.getQuestionID());
            ps.setInt(2, s.getSubjectID());
            ps.setInt(3, s.getQuizID());
            ps.setString(4, s.getContent());
            ps.setString(5, s.getqA());
            ps.setString(6, s.getqB());
            ps.setString(7, s.getqC());
            ps.setString(8, s.getqD());
            ps.setString(9, s.getqTrue());
            ps.setInt(10, s.getLevel());
            ps.setString(11, s.getImage());
            ps.setString(12, s.getAudio());
            ps.setTimestamp(13, new Timestamp(System.currentTimeMillis()));
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //cap nhat
    public boolean update(Question s) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "update question set Content=?,Q_A=?,Q_B=?,Q_C=?,Q_D=?,Q_True=?,Level=?,Image=?,Audio=?,CreateDate=? WHERE QuestionID = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, s.getContent());
            ps.setString(2, s.getqA());
            ps.setString(3, s.getqB());
            ps.setString(4, s.getqC());
            ps.setString(5, s.getqD());
            ps.setString(6, s.getqTrue());
            ps.setInt(7, s.getLevel());
            ps.setString(8, s.getImage());
            ps.setString(9, s.getAudio());
            ps.setTimestamp(10, new Timestamp(System.currentTimeMillis()));
            ps.setInt(11, s.getQuestionID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //xoa
    public boolean delete(int question_id) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "DELETE FROM question WHERE QuestionID = ?";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.setInt(1, question_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
