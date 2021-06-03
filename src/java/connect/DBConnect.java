package connect;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;

public class DBConnect {

    public static Connection getConnecttion() {
        Connection cons = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cons = (Connection) DriverManager.getConnection(
                    "jdbc:postgresql://ec2-50-17-255-120.compute-1.amazonaws.com:5432/d6cobgbmuv17je", "fuihfoupedayet", "2454efa05cc2de4103c3b718ca1b1185d39f806d18e880a8446cfa979ff18c54");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cons;
    }

    public static void main(String[] args) {
        System.out.println(getConnecttion());
    }
}
