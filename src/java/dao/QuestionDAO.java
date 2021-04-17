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
            q.setImage(rs.getString("Image"));
            q.setAudio(rs.getString("Audio"));
            q.setCreatedate(rs.getTimestamp("CreateDate"));
            list.add(q);
        }
        return list;
    }

    // search
    public ArrayList<Question> search(String search) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM question WHERE Content like ?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setString(1, "%" + search + "%");
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
            String image = rs.getString("Image");
            String audio = rs.getString("Audio");
            Timestamp createdate = rs.getTimestamp("CreateDate");
            q = new Question(qid, sid, content, qa, qb, qc, qd, qtrue, image, audio, createdate);
        }
        return q;
    }

    //Them moi
    public boolean insert(Question q) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "INSERT INTO question VALUE(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, q.getQuestionID());
            ps.setInt(2, q.getSubjectID());
            ps.setInt(3, q.getQuizID());
            ps.setString(4, q.getContent());
            ps.setString(5, q.getqA());
            ps.setString(6, q.getqB());
            ps.setString(7, q.getqC());
            ps.setString(8, q.getqD());
            ps.setString(9, q.getqTrue());
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
            String sql = "update question set Content=?,Q_A=?,Q_B=?,Q_C=?,Q_D=?,Q_True=?,Image=?,Audio=?,CreateDate=? WHERE QuestionID = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, q.getContent());
            ps.setString(2, q.getqA());
            ps.setString(3, q.getqB());
            ps.setString(4, q.getqC());
            ps.setString(5, q.getqD());
            ps.setString(6, q.getqTrue());
            ps.setString(7, q.getImage());
            ps.setString(8, q.getAudio());
            ps.setTimestamp(9, new Timestamp(System.currentTimeMillis()));
            ps.setInt(10, q.getQuestionID());
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

//    // Tính tổng câu hỏi
//    public int countQuestion(String txtSearch) throws SQLException {
//        Connection connection = DBConnect.getConnecttion();
//        String sql = "SELECT count(*) FROM question WHERE Content like ?";
//        PreparedStatement ps = connection.prepareCall(sql);
//        ps.setString(1, "%" + txtSearch + "%");
//        ResultSet rs = ps.executeQuery();
//        int count = 0;
//        while (rs.next()) {
//            count = rs.getInt(1);
//        }
//        return count;
//    }
//
//    //phân trang
//    public ArrayList<Question> search(String txtSearch, int index, int size) throws SQLException {
//        try {
//            Connection connection = DBConnect.getConnecttion();
//            String sql = "with x as(select ROW_NUMBER() over (ORDER BY CreateDate desc) as r\n"
//                    + ",* from question where Content like ?)\n"
//                    + "select * from x where r between ?*3-2 and ?*3";
//            PreparedStatement ps = connection.prepareCall(sql);
//            ps.setString(1, "%" + txtSearch + "%");
//            ps.setInt(2, index);
//            ps.setInt(3, index);
//            
//            ResultSet rs = ps.executeQuery();
//            ArrayList<Question> list = new ArrayList<>();
//            while (rs.next()) {
//                Question q = new Question(
//                        rs.getInt("2"),
//                        rs.getInt("3"),
//                        rs.getInt("4"),
//                        rs.getString("5"),
//                        rs.getString("6"),
//                        rs.getString("7"),
//                        rs.getString("8"),
//                        rs.getString("9"),
//                        rs.getString("10"),
//                        rs.getString("11"),
//                        rs.getString("12"),
//                        rs.getTimestamp("13")
//                );
//                list.add(q);
//            }
//            return list;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//
//    public static void main(String[] args) throws SQLException {
//        QuestionDAO questionDAO = new QuestionDAO();
//        ArrayList<Question> list = questionDAO.search("a", 1, 3);
//        list.forEach((Question q) -> {
//            System.out.println(q);
//        });
//    }
}
