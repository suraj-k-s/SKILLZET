/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package DB;
import java.sql.*;

public class ConnectionClass {
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    public ConnectionClass() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_socialbridge", "root","");

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }



    public boolean executeCommand(String str) {
        boolean bol1 = false;
        try {

            st = con.createStatement();
            st.executeUpdate(str);
            bol1 = true;

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return bol1;
    }


    public ResultSet selectCommand(String selQry) {
        try {
            st = con.createStatement();
            rs = st.executeQuery(selQry);
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return rs;
    }
}



