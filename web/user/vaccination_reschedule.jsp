<% 
    String status=request.getParameter("vaccination_status");
    String string="Pending";
    if(status.equals(string))
    {
%>
<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Reschedule Vaccination</h5>
                    <!-- General Form Elements -->
                    <form action="vaccination_reschedule_action.jsp">
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
                            <label for="vaccination_date" class="col-sm-2 col-form-label">Date</label>
                            <div class="col-sm-10">
                                <input required name="vaccination_date" type="date" class="form-control">
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
<% 
    }
    else
    {
%>
<script>alert("Approved vaccinations cannot be rescheduled!");</script>
<%
    }
%>