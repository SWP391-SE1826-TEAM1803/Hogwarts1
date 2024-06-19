<%-- 
    Document   : Home
    Created on : May 22, 2024, 1:28:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.DAOTeacher, model.DAOStudentSchoolYearClass, model.DAOUser, model.DAOClass, model.DAOMenu, model.DAOCurriculum" %>
<%@ page import="entity.CurriculumDate" %>
<%@ page import="java.util.Vector" %>

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
  <style>
      .card-icon {
  width: 50px;
  height: 50px;
  background-color: #f0f0f0; /* or any preferred background color */
  font-size: 24px;
  color: #000; /* or any preferred icon color */
}

  </style>

  
</head>

<body>
    <%@include file="HeaderAdmin.jsp"%>
  <main id="main" class="main">
        <div class="pagetitle">
            <h1>Curriculum Dates List</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="HomeAdmin.jsp">Home</a></li>
                    <li class="breadcrumb-item active">Curriculum Dates</li>
                </ol>
            </nav>
        </div>

        <section class="section">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">

                            <div class="d-flex justify-content-between align-items-center">
                                <form class="form-inline" action="CurriculumDateControllerURL" method="get">
                                    <div class="input-group">
                                        <select class="form-control mr-2" name="CurID">
                                            <option value="">All</option>
                                            
                                            <!-- Add more curriculum IDs as needed -->
                                        </select>
                                        <button type="submit" class="btn btn-primary">Filter</button>
                                    </div>
                                </form>
                                <a href="InsertCurDate.jsp" class="btn btn-success">Add New Curriculum Date</a>
                            </div>

                            <table class="table table-borderless datatable mt-3">
                                <thead>
                                    <tr>
                                        
                                        <th scope="col">Date Number</th>
                                        
                                        <th scope="col" style="text-align: center;">Detail</th>
                                        <th scope="col" style="text-align: center;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                      Vector<CurriculumDate> dates = (Vector<CurriculumDate>) request.getAttribute("data");
                                      if (dates != null) {
                                        for (CurriculumDate date : dates) {
                                    %>
                                    <tr>
                                        
                                        <td><%= date.getDateNumber() %></td>
                                        
                                        <td style="text-align: center;">
                                    <a class="btn btn-outline-info btn-icon-text" href="CurDateActControllerURL?service=searchByCurDateID&CurDateID=<%= date.getCurDateID() %>">
                                        <i class="mdi mdi-information"></i> Detail
                                    </a>
                                    
                                </td>
                                        <td style="text-align: center;">
                                            <a class="btn btn-outline-warning btn-sm" href="CurriculumDateControllerURL?service=update&CurDateID=<%= date.getCurDateID() %>">Update</a>
                                            <a class="btn btn-outline-danger btn-sm" href="CurriculumDateControllerURL?service=delete&CurDateID=<%= date.getCurDateID() %>">Delete</a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                      }
                                    %>
                                </tbody>
                            </table>
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