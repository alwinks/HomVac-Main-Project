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
                                <th scope="col">Doses Available</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_stock INNER JOIN tbl_vaccine ON tbl_stock.vaccine_id=tbl_vaccine.vaccine_id WHERE health_centre_id=?");
                                    pst.setInt(1,(Integer)session.getAttribute("health_centre_id"));
                                    ResultSet rs=pst.executeQuery();
                                    if(rs==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs.next())
                                        {
                                            out.println("<tr><td>"+rs.getString("vaccine_name")+"</td>");
                                            out.println("<td>"+rs.getString("stock_quantity")+"</td>");
                                            out.println("<td><a title='Update vaccine stock' href='stock_update.jsp?stock_id="+rs.getString("stock_id")+"'><i class='bi bi-upload'></i></a></td></tr>");
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