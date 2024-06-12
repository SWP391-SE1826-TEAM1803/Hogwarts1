<%-- 
    Document   : InsertClassCategoryMenu
    Created on : Jun 12, 2024, 10:58:35 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entity.ClassCategoryMenu" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Add New Class Category Menu - Restaurant</title>
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

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">
    </head>

    <body>
        <%@include file="HeaderAdmin.jsp"%>
        <main id="main" class="main">
            <div class="pagetitle">
                <h1>Add New Class Category Menu</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="HomeAdmin.jsp">Home</a></li>
                        <li class="breadcrumb-item"><a href="ClassCategoryMenuControllerURL?service=listAll">Class Category Menu</a></li>
                        <li class="breadcrumb-item active">Add New</li>
                    </ol>
                </nav>
            </div>

            <section class="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="ClassCategoryMenuControllerURL" method="post">
                                    <input type="hidden" name="service" value="addClassCategoryMenu">

                                    <div class="mb-3">
                                        <label for="cateID" class="form-label">Category ID:</label>
                                        <input type="text" class="form-control" id="cateID" name="CateID">
                                    </div>
                                    <div class="mb-3">
                                        <label for="menuID" class="form-label">Menu ID:</label>
                                        <input type="text" class="form-control" id="menuID" name="MenuID">
                                    </div>
                                    <div class="mb-3">
                                        <label for="date" class="form-label">Date:</label>
                                        <input type="text" class="form-control" id="date" name="Date">
                                    </div>
                                    <div class="mb-3">
                                        <label for="meal" class="form-label">Meal:</label>
                                        <input type="text" class="form-control" id="meal" name="Meal">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Add</button>
                                    <a href="ClassCategoryMenuControllerURL?service=listAll" class="btn btn-secondary">Cancel</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <%@include file="Footer.jsp"%>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>

</html>
