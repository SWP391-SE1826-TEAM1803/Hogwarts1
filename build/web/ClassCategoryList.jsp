<%-- 
    Document   : ClassCategoryList
    Created on : Jun 12, 2024, 10:22:42 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entity.ClassCategory" %>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Class Categories - Hogwarts</title>
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
            <h1>Class Categories List</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="HomeAdmin.jsp">Home</a></li>
                    <li class="breadcrumb-item active">Class Categories</li>
                </ol>
            </nav>
        </div>

        <section class="section">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">


                            <div class="d-flex justify-content-between align-items-center">
                                <a href="InsertClassCategory.jsp" class="btn btn-success">Add New Class Category</a>
                            </div>

                            <table class="table table-borderless datatable mt-3">
                                <thead>
                                    <tr>
                                        <th scope="col">Category ID</th>
                                        <th scope="col">Category Name</th>
                                        <th scope="col" style="text-align: center;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                      Vector<ClassCategory> categories = (Vector<ClassCategory>) request.getAttribute("data");
                                      if (categories != null) {
                                        for (ClassCategory category : categories) {
                                    %>
                                    <tr>
                                        <td><%= category.getCateID() %></td>
                                        <td><%= category.getCateName() %></td>
                                        <td style="text-align: center;">
                                            <a class="btn btn-outline-warning btn-sm" href="ClassCategoryControllerURL?service=update&CateID=<%= category.getCateID() %>">Update</a>
                                            <a class="btn btn-outline-danger btn-sm" href="ClassCategoryControllerURL?service=delete&CateID=<%= category.getCateID() %>">Delete</a>
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
    <script src="assets
