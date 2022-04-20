<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("INSERT INTO tbl_member(user_id,member_name,member_dob,member_gender,member_aadhaar_no,member_status) VALUES(?,?,?,?,?,'Active')");
        pst.setInt(1,(Integer)session.getAttribute("user_id"));
        pst.setString(2,request.getParameter("member_name"));
        pst.setString(3,request.getParameter("member_dob"));
        pst.setString(4,request.getParameter("member_gender"));
        pst.setString(5,request.getParameter("member_aadhaar_no"));
        pst.executeUpdate();
        response.sendRedirect("family.jsp");
%>