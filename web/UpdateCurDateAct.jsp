<%-- 
    Document   : Home
    Created on : May 22, 2024, 1:28:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.DAOTeacher, model.DAOStudentSchoolYearClass, model.DAOUser, model.DAOClass, model.DAOMenu, model.DAOCurriculum" %>
<%@ page import="entity.CurDateAct" %>


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
  <style>
      .card-icon {
  width: 50px;
  height: 50px;
  background-color: #f0f0f0; /* or any preferred background color */
  font-size: 24px;
  color: #000; /* or any preferred icon color */
}

  </style>

  
</head>

<body>
    <%@include file="HeaderAdmin.jsp"%>
  <main id="main" class="main">
        <div class="pagetitle">
            <h1>Update Current Date Activity</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="HomeAdmin.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="CurDateActControllerURL?service=listAll">Current Date Activities</a></li>
                    <li class="breadcrumb-item active">Update Current Date Activity</li>
                </ol>
            </nav>
        </div>

        <section class="section">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Update Current Date Activity</h5>

                            <%
                                CurDateAct act = (CurDateAct) request.getAttribute("act");
                                if (act != null) {
                            %>
                            <form action="CurDateActControllerURL" method="post">
                                <input type="hidden" name="service" value="updateCurDateAct">
                                
                                <div class="mb-3">
                                    <label for="CdtID" class="form-label">Activity ID</label>
                                    <input type="text" class="form-control" id="CdtID" name="CdtID" value="<%= act.getCdtID() %>" readonly>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="Act" class="form-label">Activity</label>
                                    <input type="text" class="form-control" id="Act" name="Act" value="<%= act.getAct() %>" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="TimeStart" class="form-label">Start Time</label>
                                    <input type="time" class="form-control" id="TimeStart" name="TimeStart" value="<%= act.getTimeStart() %>" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="TimeEnd" class="form-label">End Time</label>
                                    <input type="time" class="form-control" id="TimeEnd" name="TimeEnd" value="<%= act.getTimeEnd() %>" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="CurDateID" class="form-label">Curriculum Date ID</label>
                                    <input type="text" class="form-control" id="CurDateID" name="CurDateID" value="<%= act.getCurDateID() %>" required>
                                </div>
                                
                                <div class="d-grid gap-2">
                                    <button type="submit" name="submit" value="submit" class="btn btn-primary">Update</button>
                                    <a href="CurDateActControllerURL?service=listAll" class="btn btn-secondary">Cancel</a>
                                </div>
                            </form>
                            <% } else { %>
                            <div class="alert alert-danger" role="alert">
                                No activity found to update.
                            </div>
                            <% } %>
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