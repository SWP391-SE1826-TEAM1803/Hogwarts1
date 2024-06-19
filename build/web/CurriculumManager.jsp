<%-- 
    Document   : Home
    Created on : May 22, 2024, 1:28:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entity.Curriculum" %>
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

  
</head>

<body>
    <%@include file="HeaderAdmin.jsp"%>
    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Curriculum List</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="HomeAdmin.jsp">Home</a></li>
                    <li class="breadcrumb-item active">Curriculum</li>
                </ol>
            </nav>
        </div>

        <section class="section">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <form class="form-inline" action="CurriculumControllerURL" method="get">
                                    <div class="input-group">
                                        <select class="form-control mr-2" name="category">
                                            <option value="">All</option>
                                            <!-- Populate categories -->
                                        </select>
                                        <button type="submit" class="btn btn-primary">Filter</button>
                                    </div>
                                </form>
                                <a href="InsertCurriculum.jsp" class="btn btn-success">Add New Curriculum</a>
                            </div>

                            <table class="table table-borderless datatable mt-3">
                                <thead>
                                    <tr>
<!--                                        <th scope="col">Curriculum ID</th>-->
                                        <th scope="col">Curriculum Name</th>
<!--                                        <th scope="col">Category ID</th>-->
                                        <th scope="col" style="text-align: center;">Detail</th>
                                        <th scope="col" style="text-align: center;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                      Vector<Curriculum> curriculums = (Vector<Curriculum>) request.getAttribute("data");
                                      if (curriculums != null) {
                                        for (Curriculum curriculum : curriculums) {
                                    %>
                                    <tr>
<!--                                        <td><%= curriculum.getCurID() %></td>-->
                                        <td><%= curriculum.getCurName() %></td>
<!--                                        <td><%= curriculum.getCateID() %></td>-->
                                       <td style="text-align: center;">
                                    <a class="btn btn-outline-info btn-icon-text" href="CurriculumDateControllerURL?service=searchByCurID&CurID=<%= curriculum.getCurID() %>">
                                        <i class="mdi mdi-information"></i> Detail
                                    </a>
                                    
                                </td>
                                        <td style="text-align: center;">
                                            <a class="btn btn-outline-warning btn-sm" href="CurriculumControllerURL?service=update&CurID=<%= curriculum.getCurID() %>">Update</a>
                                            <a class="btn btn-outline-danger btn-sm" href="CurriculumControllerURL?service=delete&CurID=<%= curriculum.getCurID() %>">Delete</a>
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