<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Feedbacks</h5>
                    <!-- Default Table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Date</th>
                                <th scope="col">Feedback</th>
                                <th scope="col">User</th>
                                <th scope="col">Vaccinator</th>
                                <th scope="col">Health Centre</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_feedback INNER JOIN tbl_vaccination ON tbl_feedback.vaccination_id=tbl_vaccination.vaccination_id INNER JOIN tbl_health_centre ON tbl_vaccination.health_centre_id=tbl_health_centre.health_centre_id INNER JOIN tbl_user ON tbl_vaccination.user_id=tbl_user.user_id INNER JOIN tbl_vaccinator ON tbl_vaccination.vaccinator_id=tbl_vaccinator.vaccinator_id ORDER BY feedback_date DESC");
                                    ResultSet rs=pst.executeQuery();
                                    if(rs==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs.next())
                                        {
                                            out.println("<tr><td>"+rs.getString("feedback_date")+"</td>");
                                            out.println("<td>"+rs.getString("feedback_desc")+"</td>");
                                            out.println("<td>"+rs.getString("user_name")+"</td>");
                                            out.println("<td>"+rs.getString("vaccinator_name")+"</td>");
                                            out.println("<td>"+rs.getString("health_centre_name")+"</td></tr>");
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