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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Subject;

/**
 *
 * @author Admin
 */
public class SubjectDAO {

    // get danh sách môn học
    public ArrayList<Subject> getListSubject() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM subject";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Subject> list = new ArrayList<>();
        while (rs.next()) {
            Subject subject = new Subject();
            subject.setSubjectID(rs.getInt("sub_id"));
            subject.setSubjectName(rs.getString("sub_name"));
            subject.setSubjectIcon(rs.getString("sub_icon"));
            subject.setDescription(rs.getString("sub_description"));
            subject.setCreatedate(rs.getTimestamp("create_date"));
            list.add(subject);
        }
        return list;
    }

    //Them moi
    public boolean insert(Subject s) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "INSERT INTO subject VALUE(?,?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, s.getSubjectID());
            ps.setString(2, s.getSubjectName());
            ps.setString(3, s.getSubjectIcon());
            ps.setString(4, s.getDescription());
            ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //cap nhat
    public boolean update(Subject s) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "UPDATE subject SET sub_name = ?, sub_icon = ?, sub_description = ?, create_date = ? WHERE sub_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, s.getSubjectName());
            ps.setString(2, s.getSubjectIcon());
            ps.setString(3, s.getDescription());
            ps.setTimestamp(4, s.getCreatedate());
            ps.setInt(5, s.getSubjectID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //xoa
    public boolean delete(int sub_id) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "DELETE FROM subject WHERE sub_id = ?";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.setInt(1, sub_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static void main(String[] args) throws SQLException {
        SubjectDAO dao = new SubjectDAO();
//        for (Subject ds : dao.getListSubject()) {
//            System.out.println(ds.getSubjectID() + " - " + ds.getSubjectName());
//        }

//        for (int i = 1; i < 10; i++) {
//            dao.insert(new Subject(i, "Subject", "a", "a", new Timestamp(System.currentTimeMillis())));
//        }
    }
}
