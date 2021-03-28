/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Admin
 */
public class DBConnect {

    public static Connection getConnecttion() {
        Connection cons = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cons = (Connection) DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/quizonline", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cons;
    }
    public static void main(String[] args) {
        System.out.println(getConnecttion());
    }
}
