<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Register as Vaccinator - HomVac</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

        <!-- =======================================================
            * Template Name: NiceAdmin - v2.2.2
            * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
            * Author: BootstrapMade.com
            * License: https://bootstrapmade.com/license/
            ======================================================== -->
    </head>

    <body>

        <main>
            <div class="container">

                <section
                    class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                                <div class="d-flex justify-content-center py-4">
                                    <a href="index.jsp" class="logo d-flex align-items-center w-auto">
                                        <img src="assets/img/logo.png" alt="">
                                        <span class="d-none d-lg-block">HomVac</span>
                                    </a>
                                </div><!-- End Logo -->

                                <div class="card mb-3">

                                    <div class="card-body">

                                        <div class="pt-4 pb-2">
                                            <h5 class="card-title text-center pb-0 fs-4">Create an Account as Vaccinator</h5>
                                            <p class="text-center small">Enter your personal details to create account</p>
                                        </div>

                                        <form action="register_action.jsp" class="row g-3 needs-validation" novalidate>
                                            <div class="col-12">
                                                <label for="vaccinator_name" class="form-label">Your Name</label>
                                                <input required type="text" name="vaccinator_name" class="form-control" >
                                                <div class="invalid-feedback">Please, enter your name!</div>
                                            </div>
                                            <div class="col-12">
                                                <label for="heqlth_centre_id" class="form-label">Health Centre</label>
                                                <select required name="health_centre_id" class="form-select" aria-label="Default select example">
                                                    <option disabled selected>Select Health Centre</option>
                                                    <%
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/homvac","root","1aA!1aA!");
                                                        PreparedStatement pst=conn.prepareStatement("SELECT * FROM tbl_health_centre");
                                                        ResultSet rs=pst.executeQuery();
                                                        if(rs==null)
                                                            out.println("<option disabled>No rows found</option>");
                                                        else
                                                        {
                                                            while(rs.next())
                                                                out.println("<option value='"+rs.getString("health_centre_id")+"'>"+rs.getString("health_centre_name")+"</option>");
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-12">
                                                <label for="vaccinator_certificate" class="form-label">HomVac Training Certificate
                                                    ID</label>
                                                <input required type="text" name="vaccinator_certificate" class="form-control" >
                                                <div class="invalid-feedback">Please, enter your HomVac Training Certificate
                                                    ID!</div>
                                            </div>

                                            <div class="col-12">
                                                <label for="vaccinator_mobile" class="form-label">Your Mobile Number</label>
                                                <input required type="number" name="vaccinator_mobile" class="form-control" >
                                                <div class="invalid-feedback">Please enter a valid mobile number!</div>
                                            </div>

                                            <div class="col-12">
                                                <label for="vaccinator_password" class="form-label">Password</label>
                                                <input required type="password" name="vaccinator_password" class="form-control" >
                                                <div class="invalid-feedback">Please enter your password!</div>
                                            </div>

                                            <div class="col-12">
                                                <button class="btn btn-primary w-100" type="submit">Create Account</button>
                                            </div>

                                            <div class="col-12">
                                                <p class="small mb-0">Already have an account? <a href="login.jsp">Log
                                                        in</a></p>
                                            </div>
                                        </form>

                                    </div>
                                </div>

                                <div class="credits">
                                    <!-- All the links in the footer should remain intact. -->
                                    <!-- You can delete the links only if you purchased the pro version. -->
                                    <!-- Licensing information: https://bootstrapmade.com/license/ -->
                                    <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
                                    <!-- Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a> -->
                                    &copy; Alwin Sunny 2022
                                </div>

                            </div>
                        </div>
                    </div>

                </section>

            </div>
        </main><!-- End #main -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/chart.js/chart.min.js"></script>
        <script src="assets/vendor/echarts/echarts.min.js"></script>
        <script src="assets/vendor/quill/quill.min.js"></script>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>