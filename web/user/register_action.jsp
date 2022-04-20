<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst1=conn.prepareStatement("SELECT * FROM tbl_user WHERE user_mobile=?");
        pst1.setString(1,request.getParameter("user_mobile"));
        ResultSet rs=pst1.executeQuery();
        if(!rs.next())
        {
            PreparedStatement pst2=conn.prepareStatement("INSERT INTO tbl_user(user_name,user_mobile,user_password,user_status) VALUES(?,?,?,'Active')");
            pst2.setString(1,request.getParameter("user_name"));
            pst2.setString(2,request.getParameter("user_mobile"));
            pst2.setString(3,request.getParameter("user_password"));
            pst2.executeUpdate();
            response.sendRedirect("login.jsp");
        }
        else
        {
%>
            <script>alert("User exists!");</script>
<%
        }
%>