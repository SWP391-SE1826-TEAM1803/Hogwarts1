<%-- 
    Document   : UpdateMenu
    Created on : Jun 11, 2024, 12:32:58 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entity.Menu" %>
<%@ page import="java.util.Vector" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Update Menu - Restaurant</title>
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
                <h1>Update Menu</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="HomeAdmin.jsp">Home</a></li>
                        <li class="breadcrumb-item"><a href="MenuControllerURL?service=listAll">Menu</a></li>
                        <li class="breadcrumb-item active">Update Menu</li>
                    </ol>
                </nav>
            </div>

            <section class="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">

                                <%
                                    Vector<Menu> menuList = (Vector<Menu>) request.getAttribute("vector");
                                    if (menuList != null && !menuList.isEmpty()) {
                                        Menu menu = menuList.get(0);
                                %>

                                <form action="MenuControllerURL" method="post">
                                    <input type="hidden" name="service" value="update">
                                    <input type="hidden" name="MenuID" value="<%= menu.getMenuID() %>">
                                    <div class="mb-3">
                                        <label for="MenuID" class="form-label">Menu ID</label>
                                        <input type="text" class="form-control" id="MenuID" value="<%= menu.getMenuID() %>" disabled>
                                    </div>
                                    <div class="mb-3">
                                        <label for="Food" class="form-label">Food</label>
                                        <input type="text" class="form-control" id="Food" name="Food" value="<%= menu.getFood() %>" required>
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-primary">Update Menu</button>
                                    <a href="MenuControllerURL?service=listAll" class="btn btn-secondary">Cancel</a>
                                </form>

                                <%
                                    } else {
                                %>
                                <p>Menu item not found.</p>
                                <a href="MenuControllerURL?service=listAll" class="btn btn-secondary">Back to Menu List</a>
                                <%
                                    }
                                %>

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

