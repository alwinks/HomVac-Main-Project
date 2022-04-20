<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("INSERT INTO tbl_address(user_id,address_desc,address_latitude,address_longitude,address_status) VALUES(?,?,?,?,'Active')");
        pst.setInt(1,(Integer)session.getAttribute("user_id"));
        pst.setString(2,request.getParameter("address_desc"));
        pst.setString(3,request.getParameter("address_latitude"));
        pst.setString(4,request.getParameter("address_longitude"));
        pst.executeUpdate();
        response.sendRedirect("address.jsp");
%>