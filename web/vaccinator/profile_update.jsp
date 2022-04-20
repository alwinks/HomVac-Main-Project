<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("UPDATE tbl_vaccinator SET vaccinator_name=?,vaccinator_mobile=? WHERE vaccinator_id=?");
        pst.setString(1,request.getParameter("vaccinator_name"));
        pst.setString(2,request.getParameter("vaccinator_mobile"));
        pst.setInt(3,(Integer)session.getAttribute("vaccinator_id"));
        pst.executeUpdate();
        response.sendRedirect("profile.jsp");
%>