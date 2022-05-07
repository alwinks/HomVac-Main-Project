<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card recent-sales overflow-auto">
                <div class="card-body">
                    <h5 class="card-title">Pending Vaccinations</h5>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Name</th>
                                <th scope="col">Vaccine</th>
                                <th scope="col">Date</th>
                                <th scope="col">Time</th>
                                <th scope="col">Health Centre</th>
                                <th scope="col">Status</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try
                                {
                                    PreparedStatement pst1=conn.prepareStatement("SELECT * FROM tbl_vaccination INNER JOIN tbl_member ON tbl_vaccination.member_id=tbl_member.member_id INNER JOIN tbl_health_centre ON tbl_vaccination.health_centre_id=tbl_health_centre.health_centre_id INNER JOIN tbl_vaccine ON tbl_vaccination.vaccine_id=tbl_vaccine.vaccine_id WHERE tbl_vaccination.user_id=? AND vaccination_status!='Vaccinated'");
                                    pst1.setInt(1,(Integer)session.getAttribute("user_id"));
                                    ResultSet rs1=pst1.executeQuery();
                                    if(rs1==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs1.next())
                                        {
                                            out.println("<tr><td>"+rs1.getString("member_name")+"</td>");
                                            out.println("<td>"+rs1.getString("vaccine_name")+"</td>");
                                            out.println("<td>"+rs1.getString("vaccination_date")+"</td>");
                                            out.println("<td>"+rs1.getString("vaccination_time")+"</td>");
                                            out.println("<td>"+rs1.getString("health_centre_name")+"</td>");
                                            out.println("<td>"+rs1.getString("vaccination_status")+"</td>");
                                            out.println("<td><a title='Reschedule vaccination' href='vaccination_reschedule.jsp?vaccination_id="+rs1.getString("vaccination_id")+"&vaccination_status="+rs1.getString("vaccination_status")+"'><i class='bi bi-calendar-event'></i></a>");
                            %>
                        <a title="Cancel vaccination" href="vaccination_cancel.jsp?vaccination_id=<% out.println(rs1.getString("vaccination_id")); %>&vaccine_id=<% out.println(rs1.getString("vaccine_id")); %>&health_centre_id=<% out.println(rs1.getString("health_centre_id")); %>&vaccination_status=<% out.println(rs1.getString("vaccination_status")); %>" onclick="return confirm('Are you sure?')"><i class="bi bi-x-circle"></i></a>
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
                                <th scope="col">Name</th>
                                <th scope="col">Vaccine</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    PreparedStatement pst2=conn.prepareStatement("SELECT * FROM tbl_vaccination INNER JOIN tbl_member ON tbl_vaccination.member_id=tbl_member.member_id INNER JOIN tbl_health_centre ON tbl_vaccination.health_centre_id=tbl_health_centre.health_centre_id INNER JOIN tbl_vaccine ON tbl_vaccination.vaccine_id=tbl_vaccine.vaccine_id WHERE tbl_vaccination.user_id=? AND vaccination_status='Vaccinated'");
                                    pst2.setInt(1,(Integer)session.getAttribute("user_id"));
                                    ResultSet rs2=pst2.executeQuery();
                                    if(rs2==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs2.next())
                                        {
                                            out.println("<tr><td>"+rs2.getString("member_name")+"</td>");
                                            out.println("<td>"+rs2.getString("vaccine_name")+"</td>");
                                            out.println("<td><a title='Download certificate' href='certificate.jsp?vaccination_id="+rs2.getString("vaccination_id")+"'><i class='bi bi-download'></i></a>");
                                            out.println("<a title='Add feedback' href='feedback.jsp?vaccination_id="+rs2.getString("vaccination_id")+"'><i class='ri ri-feedback-line'></i></a></td></tr>");
                                        }
                                    }
                                }
                                catch(Exception e)
                                {
                                    out.println(e);
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