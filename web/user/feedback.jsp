<%@ include file="header.jsp" %>
<main id="main" class="main">
    <section>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Add Feedback</h5>
                    <!-- General Form Elements -->
                    <form action="feedback_action.jsp">
                        <%
                            String id=request.getParameter("vaccination_id");
                        %>
                        <input required name="vaccination_id" type="hidden" value="<% out.println(id); %>">
                        <div class="row mb-3">
                            <label for="feedback_desc" class="col-sm-2 col-form-label">Feedback</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" style="height: 100px" name="feedback_desc" required></textarea>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </form><!-- End General Form Elements -->
                </div>
            </div>
        </div><!-- End Card -->
    </section>
</main><!-- End #main -->
<%@ include file="footer.jsp" %>