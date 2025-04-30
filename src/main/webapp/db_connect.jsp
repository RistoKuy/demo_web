<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        // Register JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Database connection details for web_enterprise database
        String url = "jdbc:mysql://localhost:3306/web_enterprise";
        String username = "root";
        String password = "";
        
        // Create a connection
        conn = DriverManager.getConnection(url, username, password);
        
        // Optional connection test comment
        // if(conn != null) out.println("Database connection established successfully!");
    } catch(Exception e) {
        out.println("Database Connection Error: " + e.getMessage());
        e.printStackTrace();
    }
%>