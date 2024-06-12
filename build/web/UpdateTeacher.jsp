<%-- 
    Document   : Home
    Created on : May 22, 2024, 1:28:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.Teacher"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Admin - Hogwarts</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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

  
</head>

<body>
    <%@include file="HeaderAdmin.jsp"%>
    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Update Teacher</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="HomeAdmin.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="TeacherControllerURL?service=listAll">Teachers</a></li>
                    <li class="breadcrumb-item active">Update Teacher</li>
                </ol>
            </nav>
        </div>

        <div class="container mt-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Edit Information</h5>
                    
                    <% 
                        Vector<Teacher> vector = (Vector<Teacher>) request.getAttribute("vector");
                        if (vector != null && vector.size() > 0) {
                            Teacher teacher = vector.get(0);
                    %>
                    <!-- Horizontal Form -->
                    <form action="TeacherControllerURL" method="post">
                        <input type="hidden" name="service" value="update">
                        <input type="hidden" name="TeacherID" value="<%= teacher.getTeacherID() %>">
                        <div class="row mb-3">
                            <label for="UserID" class="col-sm-2 col-form-label">User ID</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="UserID" name="UserID" value="<%= teacher.getUserID() %>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="Degree" class="col-sm-2 col-form-label">Degree</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="Degree" name="Degree" value="<%= teacher.getDegree() %>" required>
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" name="submit" value="update" class="btn btn-primary mr-2">Submit</button>
                        </div>
                    </form><!-- End Horizontal Form -->
                    <% 
                        } else {
                            out.println("<p>No teacher data found.</p>");
                        }
                    %>
                </div>
            </div>
        </div>
    </main>
    
    <%@include file="Footer.jsp"%>
  
  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>