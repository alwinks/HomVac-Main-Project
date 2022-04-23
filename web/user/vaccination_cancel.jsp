<%@page import="java.sql.*" %>
<%
    String status=request.getParameter("vaccination_status");
    String string="Pending";
    if(status.equals(string))
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst1=conn.prepareStatement("DELETE FROM tbl_vaccination WHERE vaccination_id=?");
        pst1.setString(1,request.getParameter("vaccination_id"));
        pst1.executeUpdate();
        PreparedStatement pst2=conn.prepareStatement("UPDATE tbl_stock SET stock_quantity=stock_quantity+1 WHERE vaccine_id=? AND health_centre_id=?");
        pst2.setString(1,request.getParameter("vaccine_id"));
        pst2.setString(2,request.getParameter("health_centre_id"));
        pst2.executeUpdate();
        response.sendRedirect("index.jsp");
    }
    else
    {
%>
<script>alert("Approved vaccinations cannot be cancelled!");</script>
<%
    }
%>