<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Addresses</h5>
                    <a title="Add new address" class="btn btn-primary" href="address_add.jsp">Add</a>
                    <!-- Default Table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Address</th>
                                <th scope="col">Latitude</th>
                                <th scope="col">Longitude</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                    PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_address WHERE user_id=?");
                                    pst.setInt(1,(Integer)session.getAttribute("user_id"));
                                    ResultSet rs=pst.executeQuery();
                                    if(rs==null)
                                        out.println("No rows found");
                                    else
                                    {
                                        while(rs.next())
                                        {
                                            out.println("<tr><td>"+rs.getString("address_desc")+"</td>");
                                            out.println("<td>"+rs.getString("address_latitude")+"</td>");
                                            out.println("<td>"+rs.getString("address_longitude")+"</td>");
                                            out.println("<td><a title='View map' href='address_map.jsp?address_id="+rs.getString("address_id")+"'><i class='ri ri-map-pin-line'></i></a></tr>");
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