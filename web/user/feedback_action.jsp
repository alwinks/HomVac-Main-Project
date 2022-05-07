<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("INSERT INTO tbl_feedback(vaccination_id,feedback_desc,feedback_date,feedback_status) VALUES(?,?,CURRENT_DATE(),'Submitted')");
        pst.setString(1,request.getParameter("vaccination_id"));
        pst.setString(2,request.getParameter("feedback_desc"));
        pst.executeUpdate();
        response.sendRedirect("index.jsp");
%>