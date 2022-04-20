<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("INSERT INTO tbl_stock(vaccine_id,health_centre_id,stock_quantity,stock_status) VALUES(?,?,?,'Active')");
        pst.setString(1,request.getParameter("vaccine_id"));
        pst.setInt(2,(Integer)session.getAttribute("health_centre_id"));
        pst.setString(3,request.getParameter("stock_quantity"));
        pst.executeUpdate();
        response.sendRedirect("vaccines.jsp");
%>