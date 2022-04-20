<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst1=conn.prepareStatement("SELECT * FROM tbl_vaccinator WHERE vaccinator_mobile=?");
        pst1.setString(1,request.getParameter("vaccinator_mobile"));
        ResultSet rs=pst1.executeQuery();
        if(!rs.next())
        {
            PreparedStatement pst2=conn.prepareStatement("INSERT INTO tbl_vaccinator(vaccinator_name,health_centre_id,vaccinator_certificate,vaccinator_mobile,vaccinator_password,vaccinator_status) VALUES(?,?,?,?,?,'Not verified')");
            pst2.setString(1,request.getParameter("vaccinator_name"));
            pst2.setString(2,request.getParameter("health_centre_id"));
            pst2.setString(3,request.getParameter("vaccinator_certificate"));
            pst2.setString(4,request.getParameter("vaccinator_mobile"));
            pst2.setString(5,request.getParameter("vaccinator_password"));
            pst2.executeUpdate();
            response.sendRedirect("login.jsp");
        }
        else
        {
            out.println("User exists!");
        }
%>