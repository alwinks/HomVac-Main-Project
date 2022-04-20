<%@page import="java.sql.*" %>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
        PreparedStatement pst=conn.prepareStatement("UPDATE tbl_stock SET stock_quantity=? WHERE stock_id=?");
        pst.setString(1,request.getParameter("stock_quantity"));
        pst.setString(2,request.getParameter("stock_id"));
        pst.executeUpdate();
        response.sendRedirect("vaccines.jsp");
%>