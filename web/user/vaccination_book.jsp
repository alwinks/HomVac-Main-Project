<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Book Vaccination</h5>
                    <!-- General Form Elements -->
                    <form action="vaccination_book_action.jsp">
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Family Member</label>
                            <div class="col-sm-10">
                                <select required name="member_id" class="form-select" aria-label="Default select example">
                                    <option selected disabled>Select family member</option>
                                    <%
                                        PreparedStatement pst1=conn.prepareStatement("SELECT * FROM tbl_member WHERE user_id=?");
                                        pst1.setInt(1,(Integer)session.getAttribute("user_id"));
                                        ResultSet rs1=pst1.executeQuery();
                                        if(rs1==null)
                                            out.println("<option disabled>No rows found</option>");
                                        else
                                        {
                                            while(rs1.next())
                                                out.println("<option value='"+rs1.getString("member_id")+"'>"+rs1.getString("member_name")+"</option>");
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Vaccine</label>
                            <div class="col-sm-10">
                                <select required name="vaccine_id" class="form-select" aria-label="Default select example">
                                    <option selected disabled>Select vaccine</option>
                                    <%
                                        PreparedStatement pst2=conn.prepareStatement("SELECT * FROM tbl_vaccine INNER JOIN tbl_age ON tbl_vaccine.age_id=tbl_age.age_id ORDER BY age_day_no");
                                        ResultSet rs2=pst2.executeQuery();
                                        if(rs2==null)
                                            out.println("<option disabled>No rows found</option>");
                                        else
                                        {
                                            while(rs2.next())
                                                out.println("<option value='"+rs2.getString("vaccine_id")+"'>"+rs2.getString("age_desc")+" - "+rs2.getString("vaccine_name")+"</option>");
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Address</label>
                            <div class="col-sm-10">
                                <select required name="address_id" class="form-select" aria-label="Default select example">
                                    <option selected disabled>Select address</option>
                                    <%
                                        PreparedStatement pst3=conn.prepareStatement("SELECT * FROM tbl_address WHERE user_id=?");
                                        pst3.setInt(1,(Integer)session.getAttribute("user_id"));
                                        ResultSet rs3=pst3.executeQuery();
                                        if(rs3==null)
                                            out.println("<option disabled>No rows found</option>");
                                        else
                                        {
                                            while(rs3.next())
                                                out.println("<option value='"+rs3.getString("address_id")+"'>"+rs3.getString("address_desc")+"</option>");
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="vaccination_date" class="col-sm-2 col-form-label">Date</label>
                            <div class="col-sm-10">
                                <input required name="vaccination_date" type="date" class="form-control">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure?')">Book</button>
                            </div>
                        </div>
                    </form><!-- End General Form Elements -->
                </div>
            </div>
        </div><!-- End Card -->
    </section>
</main><!-- End #main -->
<%@ include file="footer.jsp" %>