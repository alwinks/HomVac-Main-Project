<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Add Vaccine</h5>
                    <!-- General Form Elements -->
                    <form action="vaccine_add_action.jsp">
                        <div class="row mb-3">
                            <label for="vaccine_id" class="col-sm-2 col-form-label">Age Group</label>
                            <div class="col-sm-10">
                                <select required name="vaccine_id" class="form-select" aria-label="Default select example">
                                    <option disabled selected>Select vaccine</option>
                                    <%
                                        PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_vaccine");
                                        ResultSet rs=pst.executeQuery();
                                        if(rs==null)
                                            out.println("<option disabled>No rows found</option>");
                                        else
                                        {
                                            while(rs.next())
                                                out.println("<option value='"+rs.getString("vaccine_id")+"'>"+rs.getString("vaccine_name")+"</option>");
                                        }
                                    %>
                                </select>
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
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                        </div>
                    </form><!-- End General Form Elements -->
                </div>
            </div>
        </div><!-- End Card -->
    </section>
</main><!-- End #main -->
<%@ include file="footer.jsp" %>