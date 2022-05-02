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
                            <label for="vaccine_name" class="col-sm-2 col-form-label">Vaccine Name</label>
                            <div class="col-sm-10">
                                <input required type="text" class="form-control" name="vaccine_name" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="age_id" class="col-sm-2 col-form-label">Age Group</label>
                            <div class="col-sm-10">
                                <select required name="age_id" class="form-select" aria-label="Default select example">
                                    <option disabled selected>Select age group</option>
                                    <%
                                        PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_age ORDER BY age_day_no");
                                        ResultSet rs=pst.executeQuery();
                                        if(rs==null)
                                            out.println("<option disabled>No rows found</option>");
                                        else
                                        {
                                            while(rs.next())
                                                out.println("<option value='"+rs.getString("age_id")+"'>"+rs.getString("age_desc")+"</option>");
                                        }
                                    %>
                                </select>
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