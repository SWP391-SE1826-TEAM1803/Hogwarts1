<%-- 
    Document   : Home
    Created on : May 22, 2024, 1:28:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entity.Curriculum" %>
<%@ page import="model.DAOCurriculum" %>

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

    <body>
    <div class="container mt-4">
        <h1 class="mb-4">Curriculums List</h1>

        <%
            DAOCurriculum dao = null;
            Vector<Curriculum> curriculums = null;
            try {
                dao = new DAOCurriculum();
                curriculums = dao.getAllCurriculums("SELECT * FROM Curriculum");
            } catch (Exception e) {
                e.printStackTrace();
        %>
            <div class="alert alert-danger" role="alert">
                Có lỗi xảy ra khi kết nối cơ sở dữ liệu hoặc truy vấn dữ liệu.
                <pre><%= e.getMessage() %></pre>
            </div>
        <%
            }
        %>

        <%
            if (curriculums != null) {
        %>
            <table class="table table-bordered table-hover">
                <thead class="thead-light">
                    <tr>
                        <th>Mã Chương Trình</th>
                        <th>Tên Chương Trình</th>
                        <th>Mã Danh Mục</th>
                        <th>Chi tiết</th>
                        <th>Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Curriculum curriculum : curriculums) {
                    %>
                        <tr>
                            <td><%= curriculum.getCurID() %></td>
                            <td><%= curriculum.getCurName() %></td>
                            <td><%= curriculum.getCateID() %></td>
                            <td><a href="CurDateAct.jsp?CurID=<%= curriculum.getCurID() %>" class="btn btn-primary">Chi tiết</a></td>
                            <td><button class="btn btn-danger">Xóa</button></td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        <%
            }
        %>
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