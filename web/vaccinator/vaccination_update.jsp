<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
    PreparedStatement pst=conn.prepareStatement("UPDATE tbl_vaccination SET vaccination_status='Vaccinated',vaccinated_date=CURRENT_DATE(),vaccinated_time=CURRENT_TIME() WHERE vaccination_id=?");
    pst.setString(1,request.getParameter("vaccination_id"));
    pst.executeUpdate();
    response.sendRedirect("index.jsp");
%>