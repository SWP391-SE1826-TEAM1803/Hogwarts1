<%-- 
    Document   : Home
    Created on : May 22, 2024, 1:28:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector,entity.User"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Update User - Hogwarts</title>
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
            <h1>Update User</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="HomeAdmin.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="UserControllerURL?service=listAll">Accounts</a></li>
                    <li class="breadcrumb-item active">Update User</li>
                </ol>
            </nav>
        </div>

        <div class="container mt-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Edit Information</h5>
                    
                    <% 
                        User user = (User) request.getAttribute("user");
                    %>
                    <!-- Horizontal Form -->
                    <form action="UserControllerURL" method="post">
                        <input type="hidden" name="service" value="updateUser">
                        <input type="hidden" name="UserID" value="<%= user.getUserID() %>">
                        <div class="row mb-3">
                            <label for="FullName" class="col-sm-2 col-form-label">Full Name</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="FullName" name="FullName" value="<%= user.getFullName() %>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="Gender" class="col-sm-2 col-form-label">Gender</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="Gender" name="Gender" required>
                                    <option value="Male" <%= "Male".equals(user.getGender()) ? "selected" : "" %>>Male</option>
                                    <option value="Female" <%= "Female".equals(user.getGender()) ? "selected" : "" %>>Female</option>
                                    <option value="Other" <%= "Other".equals(user.getGender()) ? "selected" : "" %>>Other</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="Address" class="col-sm-2 col-form-label">Address</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="Address" name="Address" value="<%= user.getAddress() %>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="Phone" class="col-sm-2 col-form-label">Phone</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="Phone" name="Phone" value="<%= user.getPhone() %>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="Email" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="Email" name="Email" value="<%= user.getEmail() %>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="Role" class="col-sm-2 col-form-label">Role</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="Role" name="Role" required>
                                    <option value="Admin" <%= "Admin".equals(user.getRole()) ? "selected" : "" %>>Admin</option>
                                    <option value="Parent" <%= "Parent".equals(user.getRole()) ? "selected" : "" %>>Parent</option>
                                    <option value="Teacher" <%= "Teacher".equals(user.getRole()) ? "selected" : "" %>>Teacher</option>
                                    <!-- Add more roles as needed -->
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="Password" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="Password" name="Password" value="<%= user.getPassword() %>" required>
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" name="submit" value="updateUser" class="btn btn-primary mr-2">Submit</button>
                        </div>
                    </form><!-- End Horizontal Form -->
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