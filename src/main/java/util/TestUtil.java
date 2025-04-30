package util;

import java.sql.*;

/**
 * Utility class for database operations related to user accounts
 */
public class TestUtil {
    
    /**
     * Checks if an email address already exists in the user table
     * 
     * @param email The email address to check
     * @return true if the email already exists, false otherwise
     */
    public static boolean isEmailExists(String email) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean exists = false;
        
        try {
            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Open a connection
            String url = "jdbc:mysql://localhost:3306/web_enterprise";
            String user = "root";
            String password = "";
            
            conn = DriverManager.getConnection(url, user, password);
            
            // SQL query to check if email exists
            String sql = "SELECT COUNT(*) AS count FROM user WHERE email = ?";
            
            // Create prepared statement
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            
            // Execute the query
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                exists = rs.getInt("count") > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        
        return exists;
    }
}