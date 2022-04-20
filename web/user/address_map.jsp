<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_address WHERE address_id=?");
        pst.setString(1,request.getParameter("address_id"));
        ResultSet rs=pst.executeQuery();
        if(rs.next())
            response.sendRedirect("https://www.google.com/maps/search/?api=1&query="+rs.getString("address_latitude")+"%2C"+rs.getString("address_longitude"));
%>