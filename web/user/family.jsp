<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Family</h5>
                    <a title='Add new family member' class="btn btn-primary" href="family_add.jsp">Add</a>
                    <!-- Default Table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Name</th>
                                <th scope="col">Date of Birth</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Aadhaar Number</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_member WHERE user_id=?");
                                    pst.setInt(1,(Integer)session.getAttribute("user_id"));
                                    ResultSet rs=pst.executeQuery();
                                    if(rs==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs.next())
                                        {
                                            out.println("<tr><td>"+rs.getString("member_name")+"</td>");
                                            out.println("<td>"+rs.getString("member_dob")+"</td>");
                                            out.println("<td>"+rs.getString("member_gender")+"</td>");
                                            out.println("<td>"+rs.getString("member_aadhaar_no")+"</td></tr>");
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