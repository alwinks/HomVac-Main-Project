<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
    PreparedStatement pst1=conn.prepareStatement("SELECT * FROM tbl_vaccination WHERE member_id=? AND vaccine_id=?");
    pst1.setString(1,request.getParameter("member_id"));
    pst1.setString(2,request.getParameter("vaccine_id"));
    ResultSet rs1=pst1.executeQuery();
    if(!rs1.next())
    {
        PreparedStatement pst2=conn.prepareStatement("SELECT DATEDIFF(CURDATE(),member_dob) AS age FROM tbl_member WHERE member_id=?");
        pst2.setString(1,request.getParameter("member_id"));
        ResultSet rs2=pst2.executeQuery();
        if(rs2.next())
        {
            PreparedStatement pst3=conn.prepareStatement("SELECT * FROM tbl_age INNER JOIN tbl_vaccine ON tbl_vaccine.age_id=tbl_age.age_id WHERE vaccine_id=?");
            pst3.setString(1,request.getParameter("vaccine_id"));
            ResultSet rs3=pst3.executeQuery();
            if(rs3.next())
            {
                if(Integer.parseInt(rs2.getString("age"))>Integer.parseInt(rs3.getString("age_day_no")))
                {
                    PreparedStatement pst4=conn.prepareStatement("SELECT * FROM tbl_address WHERE address_id=?");
                    pst4.setString(1,request.getParameter("address_id"));
                    ResultSet rs4=pst4.executeQuery();
                    if(rs4.next())
                    {
                        PreparedStatement pst5=conn.prepareStatement("SELECT *,(3959*acos(cos(radians(?))*cos(radians(health_centre_latitude))*cos(radians(health_centre_longitude)-radians(?))+sin(radians(?))*sin(radians(health_centre_latitude)))) AS distance FROM tbl_health_centre INNER JOIN tbl_stock ON tbl_health_centre.health_centre_id=tbl_stock.health_centre_id WHERE vaccine_id=? AND stock_quantity>0 AND health_centre_status='Verified' HAVING distance<3 ORDER BY distance LIMIT 1");
                        pst5.setString(1,rs4.getString("address_latitude"));
                        pst5.setString(2,rs4.getString("address_longitude"));
                        pst5.setString(3,rs4.getString("address_latitude"));
                        pst5.setString(4,request.getParameter("vaccine_id"));
                        ResultSet rs5=pst5.executeQuery();
                        if(rs5.next())
                        {
                            PreparedStatement pst6=conn.prepareStatement("SELECT (5*COUNT(vaccinator_id)) AS vaccinators FROM tbl_vaccinator WHERE health_centre_id=?");
                            pst6.setString(1,rs5.getString("health_centre_id"));
                            ResultSet rs6=pst6.executeQuery();
                            if(rs6.next())
                            {
                                PreparedStatement pst7=conn.prepareStatement("SELECT COUNT(vaccination_id) AS vaccinations_booked FROM tbl_vaccination WHERE health_centre_id=? AND vaccination_date=?");
                                pst7.setString(1,rs5.getString("health_centre_id"));
                                pst7.setString(2,request.getParameter("vaccination_date"));
                                ResultSet rs7=pst7.executeQuery();
                                if(rs7.next())
                                {
                                    if(Integer.parseInt(rs7.getString("vaccinations_booked")) < Integer.parseInt(rs6.getString("vaccinators")))
                                    {
                                        PreparedStatement pst8=conn.prepareStatement("INSERT INTO tbl_vaccination(user_id,health_centre_id,member_id,address_id,vaccine_id,age_id,vaccination_date,vaccination_status) VALUES(?,?,?,?,?,?,?,'Pending')");
                                        pst8.setInt(1,(Integer)session.getAttribute("user_id"));
                                        pst8.setString(2,rs5.getString("health_centre_id"));
                                        pst8.setString(3,request.getParameter("member_id"));
                                        pst8.setString(4,request.getParameter("address_id"));
                                        pst8.setString(5,request.getParameter("vaccine_id"));
                                        pst8.setString(6,rs3.getString("age_id"));
                                        pst8.setString(7,request.getParameter("vaccination_date"));
                                        pst8.executeUpdate();
                                        PreparedStatement pst9=conn.prepareStatement("UPDATE tbl_stock SET stock_quantity=stock_quantity-1 WHERE vaccine_id=? AND health_centre_id=?");
                                        pst9.setString(1,request.getParameter("vaccine_id"));
                                        pst9.setString(2,rs5.getString("health_centre_id"));
                                        pst9.executeUpdate();
                                        response.sendRedirect("index.jsp");
%>
<script>alert("Vaccination booked successfully!");</script>
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
                        else
                        {
%>
<script>alert("Vaccine not available in your area!");</script>
<%
                        }
                    }
                }
                else
                {
%>
<script>alert("Not eligible for receiving the vaccine!");</script>
<%
                }
            }
        }
    }
    else
    {
%>
<script>alert("Already received the vaccine!");</script>
<%
    }
%>