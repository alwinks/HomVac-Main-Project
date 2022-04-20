<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
    PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_user WHERE user_mobile=? AND user_password=?");
    pst.setString(1,request.getParameter("user_mobile"));
    pst.setString(2,request.getParameter("user_password"));
    ResultSet rs=pst.executeQuery();
    if(rs.next())
    {
        session.setAttribute("user_id",rs.getInt("user_id"));
        session.setAttribute("user_name",rs.getString("user_name"));
        response.sendRedirect("index.jsp");
    }
    else
    {
%>
<script>alert("Incorrect mobile number or password!");</script>
<%
    }
%>