<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Add Address</h5>
                    <!-- General Form Elements -->
                    <form action="age_add_action.jsp">
                        <div class="row mb-3">
                            <label for="age_desc" class="col-sm-2 col-form-label">Age Group</label>
                            <div class="col-sm-10">
                                <input required type="text" class="form-control" name="age_desc" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="age_day_no" class="col-sm-2 col-form-label">No. of Days</label>
                            <div class="col-sm-10">
                                <input required type="number" class="form-control" name="age_day_no" required>
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