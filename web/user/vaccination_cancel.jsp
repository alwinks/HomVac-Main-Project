<%@page import="java.sql.*" %>
<%
    String status=request.getParameter("vaccination_status");
    String string="Pending";
    if(status.equals(string))
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("DELETE FROM tbl_vaccination WHERE vaccination_id=?");
        pst.setString(1,request.getParameter("vaccination_id"));
        pst.executeUpdate();
        response.sendRedirect("index.jsp");
    }
    else
    {
%>
<script>alert("Approved vaccinations cannot be cancelled!");</script>
<%
    }
%>