package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.UserQuiz;
import java.sql.Time;
import java.sql.Date;

public class UserQuizDAO {

    public boolean insertUserQuiz(UserQuiz uq) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO userquiz VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, uq.getUserquizID());
            ps.setInt(2, uq.getUserID());
            ps.setInt(3, uq.getQuizID());
            ps.setFloat(4, uq.getScore());
            ps.setFloat(5, uq.getTotalanswertrue());
            ps.setTime(6, uq.getStarttime());
            ps.setTime(7, uq.getEndtime());
            ps.setDate(8, uq.getStartday());
            ps.setDate(9, uq.getEndday());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserQuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
