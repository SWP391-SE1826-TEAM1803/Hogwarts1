<%-- 
    Document   : Home
    Created on : May 22, 2024, 1:28:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector,entity.Student"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Update Student - Hogwarts</title>
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
            <h1>Update Student</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="HomeAdmin.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="StudentControllerURL?service=listAll">Students</a></li>
                    <li class="breadcrumb-item active">Update Student</li>
                </ol>
            </nav>
        </div>

        <div class="container mt-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Edit Information</h5>
                    
                    <% 
                        Vector<Student> vector = (Vector<Student>) request.getAttribute("vector");
                        if (vector != null && vector.size() > 0) {
                            Student student = vector.get(0);
                    %>
                    <!-- Horizontal Form -->
                    <form action="StudentControllerURL" method="post">
                        <input type="hidden" name="service" value="update">
                        <input type="hidden" name="StudentID" value="<%= student.getStudentID() %>">
                        <div class="row mb-3">
                            <label for="FullName" class="col-sm-2 col-form-label">Full Name</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="FullName" name="FullName" value="<%= student.getFullName() %>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="DoB" class="col-sm-2 col-form-label">Date of Birth</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="DoB" name="DoB" value="<%= student.getDob() %>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="Age" class="col-sm-2 col-form-label">Age</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="Age" name="Age" value="<%= student.getAge() %>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="Gender" class="col-sm-2 col-form-label">Gender</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="Gender" name="Gender" required>
                                    <option value="Male" <%= "Male".equals(student.getGender()) ? "selected" : "" %>>Male</option>
                                    <option value="Female" <%= "Female".equals(student.getGender()) ? "selected" : "" %>>Female</option>
                                    <option value="Other" <%= "Other".equals(student.getGender()) ? "selected" : "" %>>Other</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="Address" class="col-sm-2 col-form-label">Address</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="Address" name="Address" value="<%= student.getAddress() %>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="UserID" class="col-sm-2 col-form-label">User ID</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="UserID" name="UserID" value="<%= student.getUserID() %>" required>
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" name="submit" value="update" class="btn btn-primary mr-2">Submit</button>
                        </div>
                    </form><!-- End Horizontal Form -->
                    <% 
                        } else {
                            out.println("<p>No student data found.</p>");
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