<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("UPDATE tbl_user SET user_name=?,user_mobile=? WHERE user_id=?");
        pst.setString(1,request.getParameter("user_name"));
        pst.setString(2,request.getParameter("user_mobile"));
        pst.setInt(3,(Integer)session.getAttribute("user_id"));
        pst.executeUpdate();
        response.sendRedirect("profile.jsp");
%>