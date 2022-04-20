<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
    PreparedStatement pst1=conn.prepareStatement("SELECT * FROM tbl_vaccination WHERE vaccinator_id=? AND vaccination_time=?");
    pst1.setString(1,request.getParameter("vaccinator_id"));
    pst1.setString(2,request.getParameter("vaccination_time"));
    ResultSet rs1=pst1.executeQuery();
    if(!rs1.next())
    {
        PreparedStatement pst2=conn.prepareStatement("UPDATE tbl_vaccination SET vaccinator_id=?,vaccination_time=?,vaccination_status='Approved' WHERE vaccination_id=?");
        pst2.setString(1,request.getParameter("vaccinator_id"));
        pst2.setString(2,request.getParameter("vaccination_time"));
        pst2.setString(3,request.getParameter("vaccination_id"));
        pst2.executeUpdate();
        response.sendRedirect("vaccinations.jsp");
    }
    else
    {
%>
<script>alert("Already choosed!");</script>
<%
    }
%>