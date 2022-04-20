<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("UPDATE tbl_health_centre SET health_centre_name=?,health_centre_phone=? WHERE health_centre_id=?");
        pst.setString(1,request.getParameter("health_centre_name"));
        pst.setString(2,request.getParameter("health_centre_phone"));
        pst.setInt(3,(Integer)session.getAttribute("health_centre_id"));
        pst.executeUpdate();
        response.sendRedirect("profile.jsp");
%>