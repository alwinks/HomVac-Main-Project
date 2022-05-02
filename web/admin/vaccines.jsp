<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Vaccines</h5>
                    <a title="Add new vaccine" class="btn btn-primary" href="vaccine_add.jsp">Add</a>
                    <!-- Default Table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Vaccine</th>
                                <th scope="col">Age Group</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_vaccine INNER JOIN tbl_age ON tbl_vaccine.age_id=tbl_age.age_id ORDER BY age_day_no");
                                    ResultSet rs=pst.executeQuery();
                                    if(rs==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs.next())
                                        {
                                            out.println("<tr><td>"+rs.getString("vaccine_name")+"</td>");
                                            out.println("<td>"+rs.getString("age_desc")+"</td></tr>");
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