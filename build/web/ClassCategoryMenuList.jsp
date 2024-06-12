<%-- 
    Document   : ClassCategoryMenuList
    Created on : Jun 12, 2024, 10:44:29 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entity.ClassCategoryMenu" %>
<%@ page import="java.util.Vector" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Class Category Menu List - Restaurant</title>
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
                <h1>Class Category Menu List</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="HomeAdmin.jsp">Home</a></li>
                        <li class="breadcrumb-item active">Class Category Menu</li>
                    </ol>
                </nav>
            </div>

            <section class="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">

                                <div class="d-flex justify-content-between align-items-center">
                                    <!-- Form for filtering -->
                                    <form class="form-inline" action="ClassCategoryMenuControllerURL" method="get">
                                        <div class="input-group">
                                            <select class="form-control mr-2" name="filter">
                                                <option value="">All</option>
                                                <option value="Breakfast">Breakfast</option>
                                                <option value="Lunch">Lunch</option>
                                                <option value="Dinner">Dinner</option>
                                                <!-- Add more filter options as needed -->
                                            </select>   
                                            <button type="submit" class="btn btn-primary">Filter</button>
                                        </div>
                                    </form>
                                    <a href="InsertClassCategoryMenu.jsp" class="btn btn-success">Add New Class Category Menu Item</a>
                                </div>

                                <table class="table table-borderless datatable mt-3">
                                    <thead>
                                        <tr>
                                            <th scope="col">Category ID</th>
                                            <th scope="col">Menu ID</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Meal</th>
                                            <th scope="col" style="text-align: center;">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                          Vector<ClassCategoryMenu> classCategoryMenuList = (Vector<ClassCategoryMenu>) request.getAttribute("data");
                                          if (classCategoryMenuList != null) {
                                            for (ClassCategoryMenu classCategoryMenu : classCategoryMenuList) {
                                        %>
                                        <tr>
                                            <td><%= classCategoryMenu.getCateID() %></td>
                                            <td><%= classCategoryMenu.getMenuID() %></td>
                                            <td><%= classCategoryMenu.getDate() %></td>
                                            <td><%= classCategoryMenu.getMeal() %></td>
                                            <td style="text-align: center;">
                                                <a class="btn btn-outline-warning btn-sm" href="ClassCategoryMenuControllerURL?service=update&CateID=<%= classCategoryMenu.getCateID() %>&MenuID=<%= classCategoryMenu.getMenuID() %>&Date=<%= classCategoryMenu.getDate() %>&Meal=<%= classCategoryMenu.getMeal() %>">Update</a>
                                                <a class="btn btn-outline-danger btn-sm" href="ClassCategoryMenuControllerURL?service=delete&CateID=<%= classCategoryMenu.getCateID() %>&MenuID=<%= classCategoryMenu.getMenuID() %>&Date=<%= classCategoryMenu.getDate() %>&Meal=<%= classCategoryMenu.getMeal() %>" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
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
