<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Add Address</h5>
                    <!-- General Form Elements -->
                    <form action="address_add_action.jsp">
                        <div class="row mb-3">
                            <label for="address_desc" class="col-sm-2 col-form-label">Address</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" style="height: 100px" name="address_desc" required></textarea>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="address_latitude" class="col-sm-2 col-form-label">Latitude</label>
                            <div class="col-sm-10">
                                <input required type="text" class="form-control" name="address_latitude" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="address_longitude" class="col-sm-2 col-form-label">Longitude</label>
                            <div class="col-sm-10">
                                <input required type="text" class="form-control" name="address_longitude" required>
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