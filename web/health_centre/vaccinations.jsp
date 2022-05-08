<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card recent-sales overflow-auto">
                <div class="card-body">
                    <h5 class="card-title">New Vaccinations</h5>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Date</th>
                                <th scope="col">Name</th>
                                <th scope="col">Vaccine</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                PreparedStatement pst1=conn.prepareStatement("SELECT * FROM tbl_vaccination INNER JOIN tbl_member ON tbl_vaccination.member_id=tbl_member.member_id INNER JOIN tbl_vaccine ON tbl_vaccination.vaccine_id=tbl_vaccine.vaccine_id WHERE tbl_vaccination.health_centre_id=? AND vaccination_status='Pending'");
                                pst1.setInt(1,(Integer)session.getAttribute("health_centre_id"));
                                ResultSet rs1=pst1.executeQuery();
                                if(rs1==null)
                                    out.println("No rows found");
                                else
                                {
                                    while(rs1.next())
                                    {
                                        out.println("<tr><td>"+rs1.getString("vaccination_date")+"</td>");
                                        out.println("<td>"+rs1.getString("member_name")+"</td>");
                                        out.println("<td>"+rs1.getString("vaccine_name")+"</td>");
                                        out.println("<td><a title='View vaccination details' href='vaccination_details.jsp?vaccination_id="+rs1.getString("vaccination_id")+"'><i class='bi bi-info-circle'></i></a>");
                                        out.println("<a title='View map' href='address_map.jsp?address_id="+rs1.getString("address_id")+"'><i class='ri ri-map-pin-line'></i></a>");
                                        out.println("<a title='Choose vaccinator' href='vaccinator_choose.jsp?vaccination_id="+rs1.getString("vaccination_id")+"&vaccination_date="+rs1.getString("vaccination_date")+"'><i class='ri ri-nurse-line'></i></a></td></tr>");
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div><!-- End Card -->
        <div class="col-12">
            <div class="card recent-sales overflow-auto">
                <div class="card-body">
                    <h5 class="card-title">Pending Vaccinations</h5>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Date</th>
                                <th scope="col">Time</th>
                                <th scope="col">Vaccinator</th>
                                <th scope="col">Name</th>
                                <th scope="col">Vaccine</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                PreparedStatement pst2=conn.prepareStatement("SELECT * FROM tbl_vaccination INNER JOIN tbl_vaccinator ON tbl_vaccination.vaccinator_id=tbl_vaccinator.vaccinator_id INNER JOIN tbl_member ON tbl_vaccination.member_id=tbl_member.member_id INNER JOIN tbl_vaccine ON tbl_vaccination.vaccine_id=tbl_vaccine.vaccine_id WHERE tbl_vaccination.health_centre_id=? AND vaccination_status='Approved'");
                                pst2.setInt(1,(Integer)session.getAttribute("health_centre_id"));
                                ResultSet rs2=pst2.executeQuery();
                                if(rs2==null)
                                    out.println("No rows found");
                                else
                                {
                                    while(rs2.next())
                                    {
                                        out.println("<tr><td>"+rs2.getString("vaccination_date")+"</td>");
                                        out.println("<td>"+rs2.getString("vaccination_time")+"</td>");
                                        out.println("<td>"+rs2.getString("vaccinator_name")+"</td>");
                                        out.println("<td>"+rs2.getString("member_name")+"</td>");
                                        out.println("<td>"+rs2.getString("vaccine_name")+"</td>");
                                        out.println("<td><a title='View vaccination details' href='vaccination_details.jsp?vaccination_id="+rs2.getString("vaccination_id")+"'><i class='bi bi-info-circle'></i></a>");
                                        out.println("<a title='View map' href='address_map.jsp?address_id="+rs2.getString("address_id")+"'><i class='ri ri-map-pin-line'></i></a>");
                                        out.println("<a title='Edit' href='vaccinator_choose.jsp?vaccination_id="+rs2.getString("vaccination_id")+"'><i class='bi bi-pencil'></i></a>");
                            %>
                        <a title="Cancel vaccination" href="vaccination_cancel.jsp?vaccination_id=<% out.println(rs2.getString("vaccination_id")); %>&vaccine_id=<% out.println(rs2.getString("vaccine_id")); %>" onclick="return confirm('Are you sure?')"><i class="bi bi-x-circle"></i></a>
                            <%
                                        out.println("</td></tr>");
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div><!-- End Card -->
        <div class="col-12">
            <div class="card recent-sales overflow-auto">
                <div class="card-body">
                    <h5 class="card-title">Previous Vaccinations</h5>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Date</th>
                                <th scope="col">Time</th>
                                <th scope="col">Vaccinator</th>
                                <th scope="col">Name</th>
                                <th scope="col">Vaccine</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                PreparedStatement pst3=conn.prepareStatement("SELECT * FROM tbl_vaccination INNER JOIN tbl_vaccinator ON tbl_vaccination.vaccinator_id=tbl_vaccinator.vaccinator_id INNER JOIN tbl_member ON tbl_vaccination.member_id=tbl_member.member_id INNER JOIN tbl_vaccine ON tbl_vaccination.vaccine_id=tbl_vaccine.vaccine_id WHERE tbl_vaccination.health_centre_id=? AND vaccination_status='Vaccinated'");
                                pst3.setInt(1,(Integer)session.getAttribute("health_centre_id"));
                                ResultSet rs3=pst3.executeQuery();
                                if(rs3==null)
                                    out.println("No rows found");
                                else
                                {
                                    while(rs3.next())
                                    {
                                        out.println("<tr><td>"+rs3.getString("vaccinated_date")+"</td>");
                                        out.println("<td>"+rs3.getString("vaccinated_time")+"</td>");
                                        out.println("<td>"+rs3.getString("vaccinator_name")+"</td>");
                                        out.println("<td>"+rs3.getString("member_name")+"</td>");
                                        out.println("<td>"+rs3.getString("vaccine_name")+"</td>");
                                        out.println("<td><a title='View vaccination details' href='vaccination_details.jsp?vaccination_id="+rs3.getString("vaccination_id")+"'><i class='bi bi-info-circle'></i></a>");
                                        out.println("<a title='View map' href='address_map.jsp?address_id="+rs3.getString("address_id")+"'><i class='ri ri-map-pin-line'></i></a></td></tr>");
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div><!-- End Card -->
    </section>
</main><!-- End #main -->
<%@ include file="footer.jsp" %>