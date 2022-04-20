<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("INSERT INTO tbl_vaccine(vaccine_name,age_id,vaccine_status) VALUES(?,?,'Active')");
        pst.setString(1,request.getParameter("vaccine_name"));
        pst.setString(2,request.getParameter("age_id"));
        pst.executeUpdate();
        response.sendRedirect("vaccines.jsp");
%>