<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("UPDATE tbl_health_centre SET health_centre_status='Verified' WHERE health_centre_id=?");
        pst.setString(1,request.getParameter("health_centre_id"));
        pst.executeUpdate();
        response.sendRedirect("health_centres.jsp");
%>