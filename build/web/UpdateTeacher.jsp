<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="entity.Teacher" %>
<%@ page import="java.util.Vector" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Teacher</title>
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <header class="header">
            <div class="container">
                <h1>Update Teacher</h1>
            </div>
        </header>
        <main class="container mt-4">
            <c:if test="${not empty vector}">
                <c:set var="teacher" value="${vector[0]}" />
                <form action="TeacherControllerURL" method="POST">
                    <input type="hidden" name="service" value="update">
                    <input type="hidden" name="submit" value="true">
                    <div class="mb-3">
                        <label for="teacherID" class="form-label">Teacher ID</label>
                        <input type="text" class="form-control" id="teacherID" name="teacherID" value="${teacher.teacherID}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="userID" class="form-label">User ID</label>
                        <input type="text" class="form-control" id="userID" name="userID" value="${teacher.userID}" required>
                    </div>
                    <div class="mb-3">
                        <label for="degree" class="form-label">Degree</label>
                        <input type="text" class="form-control" id="degree" name="degree" value="${teacher.degree}" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                    <a href="TeacherControllerURL?service=listAll" class="btn btn-secondary">Cancel</a>
                </form>
            </c:if>
            <c:if test="${empty vector}">
                <div class="alert alert-danger" role="alert">
                    Teacher not found!
                </div>
                <a href="TeacherControllerURL?service=listAll" class="btn btn-secondary">Back to List</a>
            </c:if>
        </main>

        <footer id="footer" class="footer mt-4">
            <div class="copyright">
                &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
            </div>
            <div class="credits">
                Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>
        </footer>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>