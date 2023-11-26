package kr.ed.haebeop.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DBConTest {
    static Connection con = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public static void main(String[] args) {
        JDBCConn db = new JDBCConn();
        con = db.connect();
        try {
            pstmt = con.prepareStatement("select * from test");
            rs = pstmt.executeQuery();
            while(rs.next()){
                System.out.println(rs.getInt("num"));
                System.out.println(rs.getString("title"));
            }
            db.close(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}