<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Choose Vaccinator</h5>
                    <!-- General Form Elements -->
                    <form action="vaccinator_choose_action.jsp">
                        <% 
                            String id=request.getParameter("vaccination_id");
                        %>
                        <input required name="vaccination_id" type="hidden" value="<% out.println(id); %>">
                        <%
                            PreparedStatement pst1=conn.prepareStatement("SELECT * FROM tbl_vaccination INNER JOIN tbl_member ON tbl_vaccination.member_id=tbl_member.member_id INNER JOIN tbl_vaccine ON tbl_vaccination.vaccine_id=tbl_vaccine.vaccine_id WHERE vaccination_id=?");
                            pst1.setString(1,request.getParameter("vaccination_id"));
                            ResultSet rs1=pst1.executeQuery();
                            if(rs1.next())
                            {
                                out.println("<div class='row mb-3'><label for='member_name' class='col-sm-2 col-form-label'>Name</label><div class='col-sm-10'>"+rs1.getString("member_name")+"</div></div>");
                                out.println("<div class='row mb-3'><label for='vaccine_name' class='col-sm-2 col-form-label'>Vaccine</label><div class='col-sm-10'>"+rs1.getString("vaccine_name")+"</div></div>");
                            }
                        %>
                        <div class="row mb-3">
                            <label for="vaccinator_id" class="col-sm-2 col-form-label">Vaccinator</label>
                            <div class="col-sm-10">
                                <select required name="vaccinator_id" class="form-select" aria-label="Default select example">
                                    <option disabled selected>Select vaccinator</option>
                                    <%
                                        PreparedStatement pst2=conn.prepareStatement("SELECT * FROM tbl_vaccinator WHERE health_centre_id=? AND vaccinator_status='Verified by Admin'");
                                        pst2.setInt(1,(Integer)session.getAttribute("health_centre_id"));
                                        ResultSet rs2=pst2.executeQuery();
                                        if(rs2==null)
                                            out.println("<option disabled>No rows found</option>");
                                        else
                                        {
                                            while(rs2.next())
                                                out.println("<option value='"+rs2.getString("vaccinator_id")+"'>"+rs2.getString("vaccinator_name")+"</option>");
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="vaccination_time" class="col-sm-2 col-form-label">Time</label>
                            <div class="col-sm-10">
                                <select required name="vaccination_time" class="form-select" aria-label="Default select example">
                                    <option disabled selected>Select vaccination time</option>
                                    <option value="09:30 AM - 10:30 AM">09:30 AM - 10:30 AM</option>
                                    <option value="10:30 AM - 11:30 AM">10:30 AM - 11:30 AM</option>
                                    <option value="11:30 AM - 12:30 PM">11:30 AM - 12:30 PM</option>
                                    <option value="01:30 PM - 02:30 PM">01:30 PM - 02:30 PM</option>
                                    <option value="02:30 PM - 03:30 PM">02:30 PM - 03:30 PM</option>
                                </select>
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