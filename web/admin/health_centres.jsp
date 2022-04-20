<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Health Centres pending Verification</h5>
                    <!-- Default Table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Name</th>
                                <th scope="col">Hospital Registration Number</th>
                                <th scope="col">Phone Number</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    PreparedStatement pst1=conn.prepareStatement("SELECT * FROM tbl_health_centre WHERE health_centre_status = 'Pending'");
                                    ResultSet rs1=pst1.executeQuery();
                                    if(rs1==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs1.next())
                                        {
                                            out.println("<tr><td>"+rs1.getString("health_centre_name")+"</td>");
                                            out.println("<td>"+rs1.getString("health_centre_reg_no")+"</td>");
                                            out.println("<td>"+rs1.getString("health_centre_phone")+"</td>");
                                            out.println("<td><a title='View map' href='health_centre_map.jsp?health_centre_id="+rs1.getString("health_centre_id")+"'><i class='ri ri-map-pin-line'></i></a>");
                            %>
                        <a title="Verify health centre" href="health_centre_verify.jsp?health_centre_id=<% out.println(rs1.getString("health_centre_id")); %>" onclick="return confirm('Are you sure?')"><i class="ri ri-checkbox-circle-line"></i></a>
                            <%
                                            out.println("</td></tr>");
                                        }
                                    }
                            %>
                        </tbody>
                    </table>
                    <!-- End Default Table Example -->
                </div>
            </div>
        </div><!-- End Card -->
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Health Centres verified by You</h5>
                    <!-- Default Table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Name</th>
                                <th scope="col">Hospital Registration Number</th>
                                <th scope="col">Phone Number</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    PreparedStatement pst2=conn.prepareStatement("SELECT * FROM tbl_health_centre WHERE health_centre_status = 'Verified'");
                                    ResultSet rs2=pst2.executeQuery();
                                    if(rs2==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs2.next())
                                        {
                                            out.println("<tr><td>"+rs2.getString("health_centre_name")+"</td>");
                                            out.println("<td>"+rs2.getString("health_centre_reg_no")+"</td>");
                                            out.println("<td>"+rs2.getString("health_centre_phone")+"</td>");
                                            out.println("<td><a title='View map' href='health_centre_map.jsp?health_centre_id="+rs2.getString("health_centre_id")+"'><i class='ri ri-map-pin-line'></i></a></td></tr>");
                                        }
                                    }
                            %>
                        </tbody>
                    </table>
                    <!-- End Default Table Example -->
                </div>
            </div>
        </div><!-- End Card -->
    </section>
</main><!-- End #main -->
<%@ include file="footer.jsp" %>