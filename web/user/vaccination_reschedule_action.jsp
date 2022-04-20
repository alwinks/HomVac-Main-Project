<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
    PreparedStatement pst1=conn.prepareStatement("SELECT * FROM tbl_vaccination WHERE vaccination_id=?");
    pst1.setString(1,request.getParameter("vaccination_id"));
    ResultSet rs1=pst1.executeQuery();
    if(rs1.next())
    {
        PreparedStatement pst2=conn.prepareStatement("SELECT (5*COUNT(vaccinator_id)) AS vaccinators FROM tbl_vaccinator WHERE health_centre_id=?");
        pst2.setString(1,rs1.getString("health_centre_id"));
        ResultSet rs2=pst2.executeQuery();
        if(rs2.next())
        {
            PreparedStatement pst3=conn.prepareStatement("SELECT COUNT(vaccinator_id) AS vaccinators_booked FROM tbl_vaccination WHERE health_centre_id=? AND vaccination_date=?");
            pst3.setString(1,rs1.getString("health_centre_id"));
            pst3.setString(2,request.getParameter("vaccination_date"));
            ResultSet rs3=pst3.executeQuery();
            if(rs3.next())
            {
                if(Integer.parseInt(rs3.getString("vaccinators_booked")) <= Integer.parseInt(rs2.getString("vaccinators")))
                {
                    PreparedStatement pst4=conn.prepareStatement("UPDATE tbl_vaccination SET vaccination_date=? WHERE vaccination_id=?");
                    pst4.setString(1,request.getParameter("vaccination_date"));
                    pst4.setString(2,request.getParameter("vaccination_id"));
                    pst4.executeUpdate();
                    response.sendRedirect("index.jsp");
%>
<script>alert("Vaccination rescheduled successfully!");</script>
<%
                }
                else
                {
%>
<script>alert("Sorry! Schedules are closed!");</script>
<%
                }
            }
        }
    }
%>