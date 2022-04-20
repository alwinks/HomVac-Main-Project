<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("INSERT INTO tbl_health_centre(health_centre_name,health_centre_reg_no,health_centre_latitude,health_centre_longitude,health_centre_phone,health_centre_username,health_centre_password,health_centre_status) VALUES(?,?,?,?,?,?,?,'Pending')");
        pst.setString(1,request.getParameter("health_centre_name"));
        pst.setString(2,request.getParameter("health_centre_reg_no"));
        pst.setString(3,request.getParameter("health_centre_latitude"));
        pst.setString(4,request.getParameter("health_centre_longitude"));
        pst.setString(5,request.getParameter("health_centre_phone"));
        pst.setString(6,request.getParameter("health_centre_username"));
        pst.setString(7,request.getParameter("health_centre_password"));
        pst.executeUpdate();
        response.sendRedirect("login.jsp");
%>