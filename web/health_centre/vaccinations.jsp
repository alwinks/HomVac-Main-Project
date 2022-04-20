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
                                <th scope="col">Name</th>
                                <th scope="col">Vaccine</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try
                                {
                                    PreparedStatement pst1=conn.prepareStatement("SELECT * FROM tbl_vaccination INNER JOIN tbl_member ON tbl_vaccination.member_id=tbl_member.member_id INNER JOIN tbl_vaccine ON tbl_vaccination.vaccine_id=tbl_vaccine.vaccine_id WHERE tbl_vaccination.health_centre_id=? AND vaccination_status='Pending'");
                                    pst1.setInt(1,(Integer)session.getAttribute("health_centre_id"));
                                    ResultSet rs1=pst1.executeQuery();
                                    if(rs1==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs1.next())
                                        {
                                            out.println("<tr><td>"+rs1.getString("member_name")+"</td>");
                                            out.println("<td>"+rs1.getString("vaccine_name")+"</td>");
                                            out.println("<td><a title='View vaccination details' href='vaccination_details.jsp?vaccination_id="+rs1.getString("vaccination_id")+"'><i class='bi bi-info-circle'></i></a>");
                                            out.println("<a title='View map' href='address_map.jsp?address_id="+rs1.getString("address_id")+"'><i class='ri ri-map-pin-line'></i></a>");
                                            out.println("<a title='Choose vaccinator' href='vaccinator_choose.jsp?vaccination_id="+rs1.getString("vaccination_id")+"'><i class='ri ri-nurse-line'></i></a></td></tr>");
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
                                <th scope="col">Name</th>
                                <th scope="col">Vaccine</th>
                                <th scope="col">Vaccinator</th>
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
                                            out.println("<tr><td>"+rs2.getString("member_name")+"</td>");
                                            out.println("<td>"+rs2.getString("vaccine_name")+"</td>");
                                            out.println("<td>"+rs2.getString("vaccinator_name")+"</td>");
                                            out.println("<td><a title='View vaccination details' href='vaccination_details.jsp?vaccination_id="+rs2.getString("vaccination_id")+"'><i class='bi bi-info-circle'></i></a>");
                                            out.println("<a title='View map' href='address_map.jsp?address_id="+rs2.getString("address_id")+"'><i class='ri ri-map-pin-line'></i></a></td></tr>");
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