<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card recent-sales overflow-auto">
                <div class="card-body">
                    <h5 class="card-title">Vaccination Details</h5>
                    <%
                        PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_vaccination INNER JOIN tbl_member ON tbl_vaccination.member_id=tbl_member.member_id INNER JOIN tbl_health_centre ON tbl_vaccination.health_centre_id=tbl_health_centre.health_centre_id INNER JOIN tbl_vaccine ON tbl_vaccination.vaccine_id=tbl_vaccine.vaccine_id INNER JOIN tbl_age ON tbl_vaccination.age_id=tbl_age.age_id INNER JOIN tbl_user ON tbl_vaccination.user_id=tbl_user.user_id INNER JOIN tbl_address ON tbl_vaccination.address_id=tbl_address.address_id INNER JOIN tbl_vaccinator ON tbl_vaccination.vaccinator_id=tbl_vaccinator.vaccinator_id WHERE vaccination_id=?");
                        pst.setString(1,request.getParameter("vaccination_id"));
                        ResultSet rs=pst.executeQuery();
                        if(rs.next())
                        {
                    %>
                    <div class="row">
                        <div class="col-lg-3 col-md-4 label ">Name</div>
                        <div class="col-lg-9 col-md-8"><% out.println(rs.getString("member_name")); %></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-4 label">Date of Birth</div>
                        <div class="col-lg-9 col-md-8"><% out.println(rs.getString("member_dob")); %></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-4 label ">Vaccine</div>
                        <div class="col-lg-9 col-md-8"><% out.println(rs.getString("vaccine_name")); %></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-4 label">Age Group</div>
                        <div class="col-lg-9 col-md-8"><% out.println(rs.getString("age_desc")); %></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-4 label ">Address</div>
                        <div class="col-lg-9 col-md-8"><% out.println(rs.getString("address_desc")); %></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-4 label">Health Centre</div>
                        <div class="col-lg-9 col-md-8"><% out.println(rs.getString("health_centre_name")); %></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-4 label ">Vaccinator</div>
                        <div class="col-lg-9 col-md-8"><% out.println(rs.getString("vaccinator_name")); %></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-4 label">Status</div>
                        <div class="col-lg-9 col-md-8"><% out.println(rs.getString("vaccination_status")); %></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-4 label">Mobile Number</div>
                        <div class="col-lg-9 col-md-8"><% out.println(rs.getString("user_mobile")); %></div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div><!-- End Card -->
    </section>
</main><!-- End #main -->
<%@ include file="footer.jsp" %>