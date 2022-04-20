<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
    PreparedStatement pst1=conn.prepareStatement("SELECT admin_password FROM tbl_admin WHERE admin_id=?");
    pst1.setInt(1,(Integer)session.getAttribute("admin_id"));
    ResultSet rs1=pst1.executeQuery();
    if(rs1.next())
    {
        String password=rs1.getString("admin_password");
        String currentPassword=request.getParameter("currentPassword");
        if(password.equals(currentPassword))
        {
            PreparedStatement pst2=conn.prepareStatement("UPDATE tbl_admin SET admin_password=? WHERE admin_id=?");
            pst2.setString(1,request.getParameter("newPassword"));
            pst2.setInt(2,(Integer)session.getAttribute("admin_id"));
            pst2.executeUpdate();
            response.sendRedirect("profile.jsp");
        }
        else
        {
%>
<script>alert("Incorrect password!");</script>
<%
        }
    }
%>
