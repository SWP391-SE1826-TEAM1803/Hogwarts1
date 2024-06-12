<%-- 
    Document   : Home
    Created on : May 22, 2024, 1:28:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entity.Student" %>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Home - Hogwarts</title>
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
    <%@include file="HeaderParents.jsp"%>
    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Student Profile</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="StudentControllerURL?service=showPage&sID=<%= student.getStudentID() %>">Home</a></li>
                    <li class="breadcrumb-item active">Profile</li>
                </ol>
            </nav>
        </div>

        <section class="section profile">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Student Details</h5>
                            
                            <div class="row">
                                <div class="col-lg-4 col-md-6 label">Student ID:</div>
                                <div class="col-lg-8 col-md-6"><%= student.getStudentID() %></div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-6 label">Full Name:</div>
                                <div class="col-lg-8 col-md-6"><%= student.getFullName() %></div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-6 label">Date of Birth:</div>
                                <div class="col-lg-8 col-md-6"><%= student.getDob() %></div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-6 label">Age:</div>
                                <div class="col-lg-8 col-md-6"><%= student.getAge() %></div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-6 label">Gender:</div>
                                <div class="col-lg-8 col-md-6"><%= student.getGender() %></div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-6 label">Address:</div>
                                <div class="col-lg-8 col-md-6"><%= student.getAddress() %></div>
                            </div>
                            
                            <div class="row">
                                <div class="col-lg-12 text-center mt-4">
                                    <a href="StudentControllerURL?service=update&StudentID=<%= student.getStudentID() %>" class="btn btn-warning">Update</a>
                                    <a href="StudentControllerURL?service=delete&StudentID=<%= student.getStudentID() %>" class="btn btn-danger">Delete</a>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
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