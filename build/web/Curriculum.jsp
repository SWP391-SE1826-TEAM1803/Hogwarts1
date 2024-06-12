<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.DAOCurriculum" %>
<%@ page import="entity.Curriculum" %>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Chương Trình Giảng Dạy</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">Chi Tiết Chương Trình Giảng Dạy</h1>
        
        <!-- Form thêm chương trình giảng dạy -->
        <form action="CurriculumControllerURL" method="post" class="mb-4">
            <input type="hidden" name="service" value="addCurriculum">
            <div class="form-group">
                <label for="CurID">Mã Chương Trình:</label>
                <input type="text" class="form-control" id="CurID" name="CurID" required>
            </div>
            <div class="form-group">
                <label for="CurName">Tên Chương Trình:</label>
                <input type="text" class="form-control" id="CurName" name="CurName" required>
            </div>
            <div class="form-group">
                <label for="CateID">Mã Danh Mục:</label>
                <input type="text" class="form-control" id="CateID" name="CateID" required>
            </div>
            <button type="submit" class="btn btn-primary">Thêm Chương Trình</button>
        </form>

        <% 
            DAOCurriculum dao = null;
            Vector<Curriculum> curriculums = null;
            try {
                dao = new DAOCurriculum();
                curriculums = dao.getAllCurriculums("SELECT * FROM Curriculum");
            } catch (Exception e) {
                e.printStackTrace();
            }

            if (curriculums != null) {
        %>
            <table class="table table-bordered table-hover">
                <thead class="thead-light">
                    <tr>
                        <th>Mã Chương Trình</th>
                        <th>Tên Chương Trình</th>
                        <th>Mã Danh Mục</th>
                        <th>Chi tiết</th>
                        <th>Chỉnh sửa</th>
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
                            <td><a href="CurriculumDate.jsp?CurID=<%= curriculum.getCurID() %>" class="btn btn-primary">Chi tiết</a></td>
                            <td><a href="UpdateCurriculum.jsp?CurID=<%= curriculum.getCurID() %>" class="btn btn-success">Chỉnh sửa</a></td>
                            <td><a href="CurriculumControllerURL?service=delete&CurID=<%= curriculum.getCurID() %>" class="btn btn-danger">Xóa</a></td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        <% } %>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
