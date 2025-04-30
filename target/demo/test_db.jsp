<%-- 
    Document   : test_koneksi
    Created on : 16 Apr 2025, 11.18.54
    Author     : Aristo Baadi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Database Connection Test</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Database Connection Test</h1>
        <div class="card">
            <div class="card-body">
                <%@ include file="db_connect.jsp" %>
                
                <%
                try {
                    if(conn != null) {
                        out.println("<div class='alert alert-success'>Database connection successful!</div>");
                        
                        // Get database metadata
                        DatabaseMetaData dbmd = conn.getMetaData();
                        out.println("<h3>Database Information:</h3>");
                        out.println("<ul>");
                        out.println("<li><strong>Database Product Name:</strong> " + dbmd.getDatabaseProductName() + "</li>");
                        out.println("<li><strong>Database Product Version:</strong> " + dbmd.getDatabaseProductVersion() + "</li>");
                        out.println("<li><strong>Driver Name:</strong> " + dbmd.getDriverName() + "</li>");
                        out.println("<li><strong>Driver Version:</strong> " + dbmd.getDriverVersion() + "</li>");
                        out.println("<li><strong>Connected to:</strong> " + dbmd.getURL() + "</li>");
                        out.println("<li><strong>Connected as:</strong> " + dbmd.getUserName() + "</li>");
                        out.println("</ul>");
                        
                        // Get tables information
                        out.println("<h3>Tables in web_enterprise database:</h3>");
                        out.println("<ul>");
                        ResultSet tables = dbmd.getTables(null, null, "%", new String[] {"TABLE"});
                        boolean hasTables = false;
                        while(tables.next()) {
                            String tableName = tables.getString("TABLE_NAME");
                            out.println("<li>" + tableName + "</li>");
                            hasTables = true;
                        }
                        if(!hasTables) {
                            out.println("<li>No tables found in the database.</li>");
                        }
                        out.println("</ul>");
                    } else {
                        out.println("<div class='alert alert-danger'>Failed to connect to the database!</div>");
                    }
                } catch(Exception e) {
                    out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                    e.printStackTrace();
                } finally {
                    // Close connections
                    try {
                        if(rs != null) rs.close();
                        if(pstmt != null) pstmt.close();
                        if(conn != null) conn.close();
                    } catch(SQLException e) {
                        out.println("<div class='alert alert-warning'>Error while closing database connection: " + e.getMessage() + "</div>");
                    }
                }
                %>
            </div>
        </div>
    </div>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
