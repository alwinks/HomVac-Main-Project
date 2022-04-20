<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Add Family Member</h5>
                    <!-- General Form Elements -->
                    <form action="family_add_action.jsp">
                        <div class="row mb-3">
                            <label for="member_name" class="col-sm-2 col-form-label">Name</label>
                            <div class="col-sm-10">
                                <input required type="text" class="form-control" name="member_name" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="member_dob" class="col-sm-2 col-form-label">Date of Birth</label>
                            <div class="col-sm-10">
                                <input required type="date" class="form-control" name="member_dob" required>
                            </div>
                        </div>
                        <fieldset class="row mb-3">
                            <legend class="col-form-label col-sm-2 pt-0">Gender</legend>
                            <div class="col-sm-10">
                                <div class="form-check">
                                    <input required class="form-check-input" type="radio" name="member_gender" value="Male">
                                    <label class="form-check-label" for="member_gender">
                                        Male
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input required class="form-check-input" type="radio" name="member_gender" value="Female">
                                    <label class="form-check-label" for="member_gender">
                                        Female
                                    </label>
                                </div>
                            </div>
                        </fieldset>
                        <div class="row mb-3">
                            <label for="member_aadhaar_no" class="col-sm-2 col-form-label">Aadhaar Number</label>
                            <div class="col-sm-10">
                                <input required type="number" class="form-control" name="member_aadhaar_no" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary" onclick="return confirm('Once submitted, it cannot be edited later. Are you sure that the following informations are correct?')">Add</button>
                            </div>
                        </div>
                    </form><!-- End General Form Elements -->
                </div>
            </div>
        </div><!-- End Card -->
    </section>
</main><!-- End #main -->
<%@ include file="footer.jsp" %>