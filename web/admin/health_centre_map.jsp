<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_health_centre WHERE health_centre_id=?");
        pst.setString(1,request.getParameter("health_centre_id"));
        ResultSet rs=pst.executeQuery();
        if(rs.next())
            response.sendRedirect("https://www.google.com/maps/search/?api=1&query="+rs.getString("health_centre_latitude")+"%2C"+rs.getString("health_centre_longitude"));
%>