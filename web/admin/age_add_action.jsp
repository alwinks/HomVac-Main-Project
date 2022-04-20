<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("INSERT INTO tbl_age(age_desc,age_day_no,age_status) VALUES(?,?,'Active')");
        pst.setString(1,request.getParameter("age_desc"));
        pst.setString(2,request.getParameter("age_day_no"));
        pst.executeUpdate();
        response.sendRedirect("age.jsp");
%>