<%-- 
    Document   : Home
    Created on : May 22, 2024, 1:28:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entity.Teacher" %>
<%@ page import="java.util.Vector" %>
<%@ page import="model.DAOTeacher" %>
<%
    DAOTeacher dao = new DAOTeacher();
    Vector<Teacher> vector = (Vector<Teacher>) request.getAttribute("data");
    if (vector == null) {
        vector = dao.getAllTeachers("select * from Teacher");
    }
%>
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
            <h1>Teachers List</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="HomeAdmin.jsp">Home</a></li>
                    <li class="breadcrumb-item active">Teachers</li>
                </ol>
            </nav>
        </div>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Teacher ID</th>
                        <th>User ID</th>
                        <th>Degree</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Teacher teacher : vector) { %>
                    <tr>
                        <td><%= teacher.getTeacherID() %></td>
                        <td><%= teacher.getUserID() %></td>
                        <td><%= teacher.getDegree() %></td>

                        <td>
                            <a href="TeacherControllerURL?service=update&TeacherID=<%= teacher.getTeacherID() %>" class="btn btn-warning">Edit</a>
                            <a href="#" onclick="confirmDelete('<%= teacher.getTeacherID() %>')" class="btn btn-danger">Delete</a>
                            <a href="#" class="btn btn-info">Information</a>
                        </td>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <a href="addTeacher.jsp" class="btn btn-primary">Add New Teacher</a>
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