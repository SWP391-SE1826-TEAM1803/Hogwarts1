<%-- 
    Document   : Home
    Created on : May 22, 2024, 1:28:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entity.Teacher, model.DAOTeacher" %>
<%@ page import="java.util.Vector, entity.User, model.DAOUser" %>


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
                <h1>Teacher List</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="HomeAdmin.jsp">Home</a></li>
                        <li class="breadcrumb-item active">Teachers</li>
                    </ol>
                </nav>
            </div>

            <div class="col-12">
                <div class="card recent-sales overflow-auto">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <form method="get" action="TeacherControllerURL" class="form-inline">
                                <div class="form-group mb-0 d-inline-flex">
                                    <select class="form-control mr-2" id="degreeSelect" name="degree">
                                        <option value="">All Degrees</option>
                                        <option value="Bachelor">Bachelor</option>
                                        <option value="Master">Master</option>
                                        <option value="Doctor">Doctor</option>
                                    </select>
                                    <button type="submit" class="btn btn-primary">Filter</button>
                                </div>
                            </form>
                            <a href="InsertTeacher.jsp" class="btn btn-success">Add New Teacher</a>
                        </div>
                        <!-- Table -->
                        <table class="table table-borderless datatable mt-3">
                            <thead>
                                <tr>
                                    <th scope="col">Teacher ID</th>
                                    <th scope="col">Teacher Name</th>
                                    <th scope="col">User ID</th>
                                    <th scope="col">Degree</th>
                                    <th scope="col" style="text-align: center;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    DAOUser daoUser = new DAOUser();
                                    Vector<Teacher> vector = (Vector<Teacher>) request.getAttribute("data");
                                    if (vector != null) {
                                        for (Teacher teacher : vector) {
                                            Vector<User> users = daoUser.getAllUsers("select * from [User] where UserID = '" + teacher.getUserID() + "'");
                                            String teacherName = users.size() > 0 ? users.get(0).getFullName() : "";
                                %>
                                <tr>
                                    <td><%= teacher.getTeacherID() %></td>
                                    <td><%= teacherName %></td>
                                    <td><%= teacher.getUserID() %></td>
                                    <td><%= teacher.getDegree() %></td>
                                    <td style="text-align: center;">
                                        <a class="btn btn-outline-warning btn-icon-text" href="TeacherControllerURL?service=update&TeacherID=<%= teacher.getTeacherID() %>">
                                            <i class="mdi mdi-refresh"></i> Update
                                        </a>
                                        <a class="btn btn-outline-danger btn-icon-text" href="TeacherControllerURL?service=delete&TeacherID=<%= teacher.getTeacherID() %>">
                                            <i class="mdi mdi-delete-forever"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                                <% } } %>
                            </tbody>
                        </table>

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