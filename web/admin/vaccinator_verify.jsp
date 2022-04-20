<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("UPDATE tbl_vaccinator SET vaccinator_status='Verified by Admin' WHERE vaccinator_id=?");
        pst.setString(1,request.getParameter("vaccinator_id"));
        pst.executeUpdate();
        response.sendRedirect("vaccinators.jsp");
%>