<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section class="section dashboard">
        <div class="row">
            <!-- Sales Card -->
            <%
                try
                {
                    PreparedStatement pst1=conn.prepareStatement("SELECT COUNT(*) AS today FROM tbl_vaccination WHERE DAY(vaccinated_date)=DAY(CURRENT_DATE()) AND vaccination_status='Vaccinated' AND health_centre_id=?");
                    pst1.setInt(1,(Integer)session.getAttribute("health_centre_id"));
                    ResultSet rs1=pst1.executeQuery();
                    if(rs1.next())
                    {
            %>
            <div class="col-4">
                <div class="card info-card sales-card">

                    <div class="card-body">
                        <h5 class="card-title">Vaccinations <span>| Today</span></h5>

                        <div class="d-flex align-items-center">
                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                <i class="ri ri-medicine-bottle-line"></i>
                            </div>
                            <div class="ps-3">
                                <h6><% out.println(rs1.getString("today")); %></h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
            <!-- End Sales Card -->
            <!-- Sales Card -->
            <%
                PreparedStatement pst2=conn.prepareStatement("SELECT COUNT(*) AS this_month FROM tbl_vaccination WHERE MONTH(vaccinated_date)=MONTH(CURRENT_DATE()) AND vaccination_status='Vaccinated' AND health_centre_id=?");
                pst2.setInt(1,(Integer)session.getAttribute("health_centre_id"));
                ResultSet rs2=pst2.executeQuery();
                if(rs2.next())
                {
            %>
            <div class="col-4">
                <div class="card info-card sales-card">

                    <div class="card-body">
                        <h5 class="card-title">Vaccinations <span>| This Month</span></h5>

                        <div class="d-flex align-items-center">
                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                <i class="ri ri-medicine-bottle-line"></i>
                            </div>
                            <div class="ps-3">
                                <h6><% out.println(rs2.getString("this_month")); %></h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
            <!-- End Sales Card -->
            <!-- Sales Card -->
            <%
                PreparedStatement pst3=conn.prepareStatement("SELECT COUNT(*) AS this_year FROM tbl_vaccination WHERE YEAR(vaccinated_date)=YEAR(CURRENT_DATE()) AND vaccination_status='Vaccinated' AND health_centre_id=?");
                pst3.setInt(1,(Integer)session.getAttribute("health_centre_id"));
                ResultSet rs3=pst3.executeQuery();
                if(rs3.next())
                {
            %>
            <div class="col-4">
                <div class="card info-card sales-card">

                    <div class="card-body">
                        <h5 class="card-title">Vaccinations <span>| This Year</span></h5>

                        <div class="d-flex align-items-center">
                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                <i class="ri ri-medicine-bottle-line"></i>
                            </div>
                            <div class="ps-3">
                                <h6><% out.println(rs3.getString("this_year")); %></h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
            <!-- End Sales Card -->
        </div>
        <div class="row">
            <!-- Sales Card -->
            <%
                PreparedStatement pst4=conn.prepareStatement("SELECT COUNT(*) as total_vaccinator FROM tbl_vaccinator WHERE vaccinator_status='Verified by Admin' AND health_centre_id=?");
                pst4.setInt(1,(Integer)session.getAttribute("health_centre_id"));
                ResultSet rs4=pst4.executeQuery();
                if(rs4.next())
                {
            %>
            <div class="col-4">
                <div class="card info-card sales-card">

                    <div class="card-body">
                        <a title="View vaccinators" href="vaccinators.jsp"><h5 class="card-title">Vaccinators</h5></a>

                        <div class="d-flex align-items-center">
                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                <i class="ri ri-nurse-line"></i>
                            </div>
                            <div class="ps-3">
                                <h6><% out.println(rs4.getString("total_vaccinator")); %></h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% 
                }
            }
            catch(Exception e)
            {
                out.println(e);
            } 
            %>
            <!-- End Sales Card -->
        </div>
    </section>
</main><!-- End #main -->
<%@ include file="footer.jsp" %>