<%@page import="java.sql.*" %>
<html>

    <head>
        <style type='text/css'>
            body,
            html {
                margin: 0;
                padding: 0;
            }

            body {
                color: black;
                display: table;
                font-family: Georgia, 'Times New Roman', Times, serif;
                font-size: 24px;
                text-align: center;
            }

            .container {
                border: 20px solid #1e88e5;
                width: 750px;
                height: 563px;
                display: table-cell;
                vertical-align: middle;
                margin: 20px;
            }

            .logo {
                color: #1e88e5;
                margin: 20px;
            }

            .marquee {
                color: #1e88e5;
                font-size: 48px;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="logo">
                HomVac
            </div>
            <div class="marquee">
                Certificate of Immunization
            </div>
            <br>
            <button onclick="window.print()">Print</button>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
                PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_vaccination INNER JOIN tbl_member ON tbl_vaccination.member_id=tbl_member.member_id INNER JOIN tbl_health_centre ON tbl_vaccination.health_centre_id=tbl_health_centre.health_centre_id INNER JOIN tbl_vaccine ON tbl_vaccination.vaccine_id=tbl_vaccine.vaccine_id INNER JOIN tbl_age ON tbl_vaccination.age_id=tbl_age.age_id INNER JOIN tbl_user ON tbl_vaccination.user_id=tbl_user.user_id INNER JOIN tbl_address ON tbl_vaccination.address_id=tbl_address.address_id INNER JOIN tbl_vaccinator ON tbl_vaccination.vaccinator_id=tbl_vaccinator.vaccinator_id WHERE vaccination_id=?");
                pst.setString(1,request.getParameter("vaccination_id"));
                ResultSet rs=pst.executeQuery();
                if(rs.next())
                {
                    out.println("<table style='margin: 20px;'>");
                    out.println("<tr><td><b>Name</b></td><td>"+rs.getString("member_name")+"</td></tr>");
                    out.println("<tr><td><b>Date of Birth</b></td><td>"+rs.getString("member_dob")+"</td></tr>");
                    out.println("<tr><td><b>Gender</b></td><td>"+rs.getString("member_gender")+"</td></tr>");
                    out.println("<tr><td><b>Age Group</b></td><td>"+rs.getString("age_desc")+"</td></tr>");
                    out.println("<tr><td><b>Vaccine</b></td><td>"+rs.getString("vaccine_name")+"</td></tr>");
                    out.println("<tr><td><b>Date</b></td><td>"+rs.getString("vaccinated_date")+"</td></tr>");
                    out.println("<tr><td><b>Time</b></td><td>"+rs.getString("vaccinated_time")+"</td></tr>");
                    out.println("</table>");
                    out.println("<p style='margin: 20px;'>I certify that this immunization information was transferred from the above-named individual's medical records. </p>");
                    out.println("<h4>"+rs.getString("vaccinator_name")+"</h4>");
                    out.println("<h5>"+rs.getString("health_centre_name")+"</h5>");
                }
            %>
        </div>
    </body>

</html>