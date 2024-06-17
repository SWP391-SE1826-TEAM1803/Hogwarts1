<%-- 
    Document   : Home
    Created on : May 22, 2024, 1:28:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entity.StudentSchoolYearClass, entity.SchoolYearClass, entity.Class" %>
<%@ page import="entity.Student, model.DAOStudent, model.DAOSchoolYearClass, model.DAOClass" %>
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

  
</head>

<body>
    
    <%@include file="HeaderTeacher.jsp"%>
    
   <main id="main" class="main">
        <div class="pagetitle">
            <h1>Student Class List</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="HomeAdmin.jsp">Home</a></li>
                    <li class="breadcrumb-item active">Student Class List</li>
                </ol>
            </nav>
        </div>

        <section class="section">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <%
                            DAOStudent daoS = new DAOStudent();
                            DAOSchoolYearClass daoSYC = new DAOSchoolYearClass();
                            DAOClass daoC = new DAOClass();
                            Vector<StudentSchoolYearClass> studentsClass = (Vector<StudentSchoolYearClass>) request.getAttribute("data");

                            if (studentsClass != null && !studentsClass.isEmpty()) {
                                StudentSchoolYearClass SSyClass = studentsClass.get(0);
                                Vector<SchoolYearClass> syClassObj = daoSYC.getAllSchoolYearClasses("Select * from [SchoolYear_Class] where SyC_ID = '" + SSyClass.getSyC_ID() + "'");
                                SchoolYearClass syClass = syClassObj.size() > 0 ? syClassObj.get(0) : null;

                                if (syClass != null) {
                                    Vector<Class> classObj = daoC.getAllClasses("select * from [Class] where ClassID = '" + syClass.getClassID() + "'");
                                    Class class0 = classObj.size() > 0 ? classObj.get(0) : null;

                                    if (class0 != null) {
                        %>
                        <div class="card-body">
                            <h5 class="card-title"><%= class0.getClassName() %></h5>
                            <table class="table table-borderless datatable">
                                <thead>
                                    <tr>
                                        <th scope="col">Student ID</th>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">School Year Class ID</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (StudentSchoolYearClass studentc : studentsClass) {
                                            Vector<Student> studentObj = daoS.getAllStudents("SELECT * FROM [Student] WHERE StudentID = '" + studentc.getStudentID() + "'");

                                            for (Student stu : studentObj) {
                                    %>
                                    <tr>
                                        <td><%= studentc.getStudentID() %></td>
                                        <td><%= stu.getFullName() %></td>
                                        <td><%= stu.getGender() %></td>
                                        <td><%= stu.getAddress() %></td>
                                        <td><%= studentc.getSyC_ID() %></td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                        <%
                                    }
                                }
                            }
                        %>
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