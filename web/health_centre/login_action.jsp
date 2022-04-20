<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
    PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_health_centre WHERE health_centre_username=? AND health_centre_password=?");
    pst.setString(1,request.getParameter("health_centre_username"));
    pst.setString(2,request.getParameter("health_centre_password"));
    ResultSet rs=pst.executeQuery();
    if(rs.next())
    {
        String status=rs.getString("health_centre_status");
        String string="Verified";
        if(status.equals(string))
        {
            session.setAttribute("health_centre_id",rs.getInt("health_centre_id"));
            session.setAttribute("health_centre_name",rs.getString("health_centre_name"));
            response.sendRedirect("index.jsp");
        }
        else
        {
%>
<script>alert("You can't login into the Health Centre Portal till this centre is appointed as the Verified Health Centre by the Admin.");</script>
<%
        }
    }
    else
    {
%>
<script>alert("Incorrect username or password!");</script>
<%
    }
%>