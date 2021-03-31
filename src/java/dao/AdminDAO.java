/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Administrator;

/**
 *
 * @author Admin
 */
public class AdminDAO {

    public boolean checkEmail(String email) {
        Connection con = DBConnect.getConnecttion();
        String query = "SELECT * FROM administrator WHERE ad_email = '" + email + "'";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                con.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public String registerAdmin(Administrator admin) {
        String fullName = admin.getFullName();
        String email = admin.getEmail();
        String password = admin.getPassword();

        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            con = DBConnect.getConnecttion();
            String query = "insert into administrator(ad_id,ad_name,ad_email,ad_pass) values (NULL,?,?,?)";
            preparedStatement = con.prepareStatement(query); //chèn nhiều dữ liệu
            preparedStatement.setString(1, fullName);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);

            int i = preparedStatement.executeUpdate();

            if (i != 0) // Chỉ để đảm bảo dữ liệu đã được chèn vào cơ sở dữ liệu
            {
                return "SUCCESS";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Rất tiếc .. Đã xảy ra lỗi ở đó ..!";  // On failure, send a message from here.
    }
}
