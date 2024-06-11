<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="entity.Teacher" %>
<%@ page import="java.util.Vector" %>
<%@ page import="model.DAOTeacher" %>
<%
    DAOTeacher dao = new DAOTeacher();
    Vector<Teacher> vector = (Vector<Teacher>) request.getAttribute("data");
    if (vector == null) {
        vector = dao.getAllTeachers("select * from Teacher");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Teacher Management</title>
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <header class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h1>Teacher Management</h1>
                    </div>
                    <div class="col-md-6 d-flex justify-content-end">
                    <form class="d-flex" action="TeacherControllerURL" method="GET">
                        <input type="hidden" name="service" value="search">
                        <input class="form-control me-2" type="text" name="searchQuery" placeholder="Search by Teacher ID">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                </div>
            </div>
        </header>

        <main class="container mt-4">
            <!-- Hiển thị thông báo thành công hoặc thất bại -->
            <c:if test="${not empty sessionScope.updateSuccess}">
                <div class="alert alert-success" role="alert">
                    ${sessionScope.updateSuccess}
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.updateError}">
                <div class="alert alert-danger" role="alert">
                    ${sessionScope.updateError}
                </div>
            </c:if>
            <!-- Thêm thông báo cho xóa thành công hoặc thất bại -->
            <c:if test="${not empty sessionScope.deleteSuccess}">
                <div class="alert alert-success" role="alert">
                    ${sessionScope.deleteSuccess}
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.deleteError}">
                <div class="alert alert-danger" role="alert">
                    ${sessionScope.deleteError}
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.searchSuccess}">
                <div class="alert alert-success" role="alert">
                    ${sessionScope.searchSuccess}
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.searchError}">
                <div class="alert alert-danger" role="alert">
                    ${sessionScope.searchError}
                </div>
            </c:if>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Teacher ID</th>
                        <th>User ID</th>
                        <th>Degree</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Teacher teacher : vector) { %>
                    <tr>
                        <td><%= teacher.getTeacherID() %></td>
                        <td><%= teacher.getUserID() %></td>
                        <td><%= teacher.getDegree() %></td>

                        <td>
                            <a href="TeacherControllerURL?service=update&TeacherID=<%= teacher.getTeacherID() %>" class="btn btn-warning">Edit</a>
                            <a href="#" onclick="confirmDelete('<%= teacher.getTeacherID() %>')" class="btn btn-danger">Delete</a>
                            <a href="#" class="btn btn-info">Information</a>
                        </td>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <a href="addTeacher.jsp" class="btn btn-primary">Add New Teacher</a>
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
        <script>
                                function confirmDelete(teacherID) {
                                    if (confirm("Are you sure you want to delete this teacher?")) {
                                        window.location.href = "TeacherControllerURL?service=delete&TeacherID=" + teacherID;
                                    }
                                }
        </script>
    </body>
</html>
