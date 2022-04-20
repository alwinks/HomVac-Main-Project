<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Update Vaccine Stock</h5>
                    <!-- General Form Elements -->
                    <form action="stock_update_action.jsp">
                        <% 
                            String id=request.getParameter("stock_id");
                        %>
                        <input required name="stock_id" type="hidden" value="<% out.println(id); %>">
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Vaccine</label>
                            <div class="col-sm-10">
                                <%
                                    PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_stock INNER JOIN tbl_vaccine ON tbl_stock.vaccine_id=tbl_vaccine.vaccine_id WHERE stock_id=?");
                                    pst.setString(1,request.getParameter("stock_id"));
                                    ResultSet rs=pst.executeQuery();
                                    if(rs.next())
                                        out.println(rs.getString("vaccine_name"));
                                %>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="stock_quantity" class="col-sm-2 col-form-label">Quantity</label>
                            <div class="col-sm-10">
                                <input required type="number" class="form-control" name="stock_quantity" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </div>
                    </form><!-- End General Form Elements -->
                </div>
            </div>
        </div><!-- End Card -->
    </section>
</main><!-- End #main -->
<%@ include file="footer.jsp" %>