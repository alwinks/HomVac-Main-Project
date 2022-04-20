<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
    PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_admin WHERE admin_username=? AND admin_password=?");
    pst.setString(1,request.getParameter("admin_username"));
    pst.setString(2,request.getParameter("admin_password"));
    ResultSet rs=pst.executeQuery();
    if(rs.next())
    {
        session.setAttribute("admin_id",rs.getInt("admin_id"));
        session.setAttribute("admin_name",rs.getString("admin_name"));
        response.sendRedirect("index.jsp");
    }
    else
    {
%>
<script>alert("Incorrect username or password!");</script>
<%
    }
%>