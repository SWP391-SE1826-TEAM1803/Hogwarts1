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
<style>
    body, html {
      height: 100%;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .card-custom {
      width: 300px;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 16px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .card-custom .icon {
      display: flex;
      align-items: center;
      margin-bottom: 8px;
    }
    .card-custom .icon i {
      font-size: 20px;
      margin-right: 8px;
    }
    .card-custom .course-id {
      font-size: 18px;
      font-weight: bold;
    }
    .card-custom .details {
      margin-bottom: 8px;
    }
    .card-custom .details i {
      margin-right: 4px;
    }
    .card-custom .link {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
  </style>
  
</head>

<body>
            
<div class="d-flex flex-wrap justify-content-center">
      <%
        Vector<Student> students = (Vector<Student>) request.getAttribute("data");
        if (students != null) {
          for (Student student : students) { 
      %>
        <div class="card-custom">
          <div class="course-id"><%= student.getStudentID() %></div>
          <div class="icon"><i class="bi bi-people"></i><%= student.getFullName() %></div>
          <div class="link">
            <form action="StudentControllerURL" method="get">
              <input type="hidden" name="service" value="showPage">
              <input type="hidden" name="sID" value="<%= student.getStudentID() %>">
              <button type="submit" class="btn btn-primary">Choose</button>
            </form>
          </div>
        </div>
      <%
          }
        }
      %>
    </div>
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