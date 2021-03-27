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
        Connection con = DBConnect.getConnection();
        String sql = "SELECT * FROM administrator WHERE ad_email = '" + email + "'";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                con.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //check login
    public Administrator login(String email, String password) {
        Connection con = DBConnect.getConnecttion();
        String sql = "select * from administrator where ad_email='" + email + "' and ad_pass ='" + password + "'  ";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Administrator ad = new Administrator();
                ad.setAdminEmail(rs.getString("ad_email"));
                con.close();
                return ad;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
