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
            q = new Question(qid, sid, content, qa, qb, qc, qd, qtrue, level, image, audio, createdate);
        }
        return q;
    }

    //Them moi
    public boolean insert(Question q) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "INSERT INTO question VALUE(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, q.getQuestionID());
            ps.setInt(2, q.getSubjectID());
            ps.setString(3, q.getContent());
            ps.setString(4, q.getqA());
            ps.setString(5, q.getqB());
            ps.setString(6, q.getqC());
            ps.setString(7, q.getqD());
            ps.setString(8, q.getqTrue());
            ps.setInt(9, q.getLevel());
            ps.setString(10, q.getImage());
            ps.setString(11, q.getAudio());
            ps.setTimestamp(12, new Timestamp(System.currentTimeMillis()));
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //cap nhat
    public boolean update(Question q) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "update question set Content=?,Q_A=?,Q_B=?,Q_C=?,Q_D=?,Q_True=?,Level=?,Image=?,Audio=?,CreateDate=? WHERE QuestionID = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, q.getContent());
            ps.setString(2, q.getqA());
            ps.setString(3, q.getqB());
            ps.setString(4, q.getqC());
            ps.setString(5, q.getqD());
            ps.setString(6, q.getqTrue());
            ps.setInt(7, q.getLevel());
            ps.setString(8, q.getImage());
            ps.setString(9, q.getAudio());
            ps.setTimestamp(10, new Timestamp(System.currentTimeMillis()));
            ps.setInt(11, q.getQuestionID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
