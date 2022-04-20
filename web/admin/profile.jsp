<%@ include file="header.jsp" %>
<%
PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_admin WHERE admin_id=?");
pst.setInt(1,(Integer)session.getAttribute("admin_id"));
ResultSet rs=pst.executeQuery();
if(rs.next())
{
%>
<main id="main" class="main">
    <section class="section profile">
        <div class="col-12">
            <div class="card">
                <div class="card-body pt-3">
                    <!-- Bordered Tabs -->
                    <ul class="nav nav-tabs nav-tabs-bordered">

                        <li class="nav-item">
                            <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                        </li>

                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                        </li>

                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change Password</button>
                        </li>

                    </ul>
                    <div class="tab-content pt-2">

                        <div class="tab-pane fade show active profile-overview" id="profile-overview">
                            <h5 class="card-title">Profile Details</h5>
                            <div class="row">
                                <div class="col-lg-3 col-md-4 label ">Name</div>
                                <div class="col-lg-9 col-md-8"><% out.println(rs.getString("admin_name")); %></div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-4 label">Phone</div>
                                <div class="col-lg-9 col-md-8"><% out.println(rs.getString("admin_phone")); %></div>
                            </div>
                        </div>
                        <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                            <!-- Profile Edit Form -->
                            <form action="profile_update.jsp">

                                <div class="row mb-3">
                                    <label for="admin_name" class="col-md-4 col-lg-3 col-form-label">Name</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="admin_name" type="text" class="form-control" value="<% out.println(rs.getString("admin_name")); %>">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="admin_phone" class="col-md-4 col-lg-3 col-form-label">Mobile Number</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="admin_phone" type="text" class="form-control" value="<% out.println(rs.getString("admin_phone")); %>">
                                    </div>
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Save Changes</button>
                                </div>
                            </form><!-- End Profile Edit Form -->

                        </div>
                        <div class="tab-pane fade pt-3" id="profile-change-password">
                            <!-- Change Password Form -->
                            <form action="password_change.jsp" name="changePassword" onsubmit="return validate()">

                                <div class="row mb-3">
                                    <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input required name="currentPassword" type="password" class="form-control">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input required name="newPassword" type="password" class="form-control">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input required name="renewPassword" type="password" class="form-control">
                                    </div>
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Change Password</button>
                                </div>
                            </form><!-- End Change Password Form -->
                            <script>
                                function validate() {
                                    var password = document.changePassword.newPassword.value;
                                    var confirm = document.changePassword.renewPassword.value;
                                    if (password != confirm) {
                                        alert("Passwords do not match!");
                                        return false;
                                    }
                                    return true;
                                }
                            </script>
                        </div>

                    </div><!-- End Bordered Tabs -->

                </div>
            </div>
    </section>
</main><!-- End #main -->
<% } %>
<%@ include file="footer.jsp" %>