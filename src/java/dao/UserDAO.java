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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Admin
 */
public class UserDAO {

    // get danh sách user
    public ArrayList<User> getListUser() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM user";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<User> list = new ArrayList<>();
        while (rs.next()) {
            User user = new User();
            user.setUserID(rs.getInt("UserID"));
            user.setFullName(rs.getString("FullName"));
            user.setEmail(rs.getString("Email"));
            user.setPassword(rs.getString("Password"));
            user.setPhone(rs.getString("Phone"));
            user.setAddress(rs.getString("Address"));
            list.add(user);
        }
        return list;
    }

      public User getUserByID(int id) throws Exception {
        User u = null;
        Connection connection = DBConnect.getConnecttion();
        String sql = "select * from user where UserID=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            int uid = rs.getInt("UserID");
            String name = rs.getString("FullName");
            String email = rs.getString("Email");
            String password = rs.getString("Password");
            String phone = rs.getString("Phone");
            String address = rs.getString("Address");
            u = new User(uid, name, email, password, phone, address);
        }
        return u;
    }
    //Them moi
    public boolean insert(User u) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "INSERT INTO user VALUE(?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, u.getUserID());
            ps.setString(2, u.getFullName());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getPassword());
            ps.setString(5, u.getPhone());
            ps.setString(6, u.getAddress());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //cap nhat
    public boolean update(User u) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "update user set FullName = ?, Email = ?, Password = ?, Phone = ?, Address = ? WHERE UserID = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, u.getFullName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getPhone());
            ps.setString(5, u.getAddress());
            ps.setInt(6, u.getUserID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //xoa
    public boolean delete(int user_id) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "DELETE FROM user WHERE UserID = ?";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.setInt(1, user_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
