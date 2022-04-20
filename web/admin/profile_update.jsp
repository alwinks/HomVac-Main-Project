<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("UPDATE tbl_admin SET admin_name=?,admin_phone=? WHERE admin_id=?");
        pst.setString(1,request.getParameter("admin_name"));
        pst.setString(2,request.getParameter("admin_phone"));
        pst.setInt(3,(Integer)session.getAttribute("admin_id"));
        pst.executeUpdate();
        response.sendRedirect("profile.jsp");
%>