<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Vaccinators verified by You</h5>
                    <!-- Default Table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Name</th>
                                <th scope="col">HomVac Training Certificate ID</th>
                                <th scope="col">Mobile Number</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    PreparedStatement pst1=conn.prepareStatement("SELECT * FROM tbl_vaccinator WHERE vaccinator_status = 'Verified by Admin' AND health_centre_id=?");
                                    pst1.setInt(1,(Integer)session.getAttribute("health_centre_id"));
                                    ResultSet rs1=pst1.executeQuery();
                                    if(rs1==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs1.next())
                                        {
                                            out.println("<tr><td>"+rs1.getString("vaccinator_name")+"</td>");
                                            out.println("<td>"+rs1.getString("vaccinator_certificate")+"</td>");
                                            out.println("<td>"+rs1.getString("vaccinator_mobile")+"</td></tr>");
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
                    <h5 class="card-title">Vaccinators verified by You (Pending verification by Admin)</h5>
                    <!-- Default Table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Name</th>
                                <th scope="col">HomVac Training Certificate ID</th>
                                <th scope="col">Mobile Number</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    PreparedStatement pst2=conn.prepareStatement("SELECT * FROM tbl_vaccinator WHERE vaccinator_status = 'Verified by Health Centre' AND health_centre_id=?");
                                    pst2.setInt(1,(Integer)session.getAttribute("health_centre_id"));
                                    ResultSet rs2=pst2.executeQuery();
                                    if(rs2==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs2.next())
                                        {
                                            out.println("<tr><td>"+rs2.getString("vaccinator_name")+"</td>");
                                            out.println("<td>"+rs2.getString("vaccinator_certificate")+"</td>");
                                            out.println("<td>"+rs2.getString("vaccinator_mobile")+"</td></tr>");
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
                    <h5 class="card-title">Vaccinators pending verification</h5>
                    <!-- Default Table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Name</th>
                                <th scope="col">HomVac Training Certificate ID</th>
                                <th scope="col">Mobile Number</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    PreparedStatement pst3=conn.prepareStatement("SELECT * FROM tbl_vaccinator WHERE vaccinator_status = 'Not verified' AND health_centre_id=?");
                                    pst3.setInt(1,(Integer)session.getAttribute("health_centre_id"));
                                    ResultSet rs3=pst3.executeQuery();
                                    if(rs3==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs3.next())
                                        {
                                            out.println("<tr><td>"+rs3.getString("vaccinator_name")+"</td>");
                                            out.println("<td>"+rs3.getString("vaccinator_certificate")+"</td>");
                                            out.println("<td>"+rs3.getString("vaccinator_mobile")+"</td>");
                                            out.println("<td>");
                            %>
                        <a title="Verify vaccinator" href="vaccinator_verify.jsp?vaccinator_id=<% out.println(rs3.getString("vaccinator_id")); %>" onclick="return confirm('Are you sure?')"><i class="ri ri-checkbox-circle-line"></i></a>
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
    </section>
</main><!-- End #main -->
<%@ include file="footer.jsp" %>