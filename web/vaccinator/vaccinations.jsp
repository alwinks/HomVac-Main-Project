<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card recent-sales overflow-auto">
                <div class="card-body">
                    <h5 class="card-title">Previous Vaccinations</h5>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Name</th>
                                <th scope="col">Vaccine</th>
                                <th scope="col">Status</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_vaccination INNER JOIN tbl_member ON tbl_vaccination.member_id=tbl_member.member_id INNER JOIN tbl_vaccine ON tbl_vaccination.vaccine_id=tbl_vaccine.vaccine_id WHERE vaccinator_id=? AND vaccination_status='Vaccinated'");
                                    pst.setInt(1,(Integer)session.getAttribute("vaccinator_id"));
                                    ResultSet rs=pst.executeQuery();
                                    if(rs==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs.next())
                                        {
                                            out.println("<tr><td>"+rs.getString("member_name")+"</td>");
                                            out.println("<td>"+rs.getString("vaccine_name")+"</td>");
                                            out.println("<td>"+rs.getString("vaccination_status")+"</td>");
                                            out.println("<td><a title='View vaccination details' href='vaccination_details.jsp?vaccination_id="+rs.getString("vaccination_id")+"'><i class='bi bi-info-circle'></i></a>");
                                            out.println("<a title='View map' href='address_map.jsp?address_id="+rs.getString("address_id")+"'><i class='ri ri-map-pin-line'></i></a></td></tr>");
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