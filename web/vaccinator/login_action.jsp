<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
    PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_vaccinator WHERE vaccinator_mobile=? AND vaccinator_password=?");
    pst.setString(1,request.getParameter("vaccinator_mobile"));
    pst.setString(2,request.getParameter("vaccinator_password"));
    ResultSet rs=pst.executeQuery();
    if(rs.next())
    {
        String status=rs.getString("vaccinator_status");
        String string="Verified by Admin";
        if(status.equals(string))
        {
            session.setAttribute("vaccinator_id",rs.getInt("vaccinator_id"));
            session.setAttribute("vaccinator_name",rs.getString("vaccinator_name"));
            response.sendRedirect("index.jsp");
        }
        else
        {
%>
<script>alert("You can't login into the Vaccinator Portal till you appointed as the Verified Vaccinator by the Admin.");</script>
<%
        }
    }
    else
    {
%>
<script>alert("Incorrect mobile number or password!");</script>
<%
    }
%>