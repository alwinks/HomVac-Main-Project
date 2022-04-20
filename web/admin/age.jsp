<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Age Groups</h5>
                    <a title="Add new age goup" class="btn btn-primary" href="age_add.jsp">Add</a>
                    <!-- Default Table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Age Group</th>
                                <th scope="col">No. of Days</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_age");
                                    ResultSet rs=pst.executeQuery();
                                    if(rs==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs.next())
                                        {
                                            out.println("<tr><td>"+rs.getString("age_desc")+"</td>");
                                            out.println("<td>"+rs.getString("age_day_no")+"</td></tr>");
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