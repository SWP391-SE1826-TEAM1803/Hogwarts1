<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.DAOCurriculum" %>
<%@ page import="entity.Curriculum" %>
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
        
        <% 
            String curID = request.getParameter("CurID");
            DAOCurriculum dao = new DAOCurriculum();
            Curriculum curriculum = dao.getCurriculumByID(curID);

            if (curriculum != null) {
        %>
            <table class="table table-bordered table-hover">
                <thead class="thead-light">
                    <tr>
                        <th>Thuộc Tính</th>
                        <th>Giá Trị</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>Mã Chương Trình:</th>
                        <td><%= curriculum.getCurID() %></td>
                    </tr>
                    <tr>
                        <th>Tên Chương Trình:</th>
                        <td><%= curriculum.getCurName() %></td>
                    </tr>
                    <tr>
                        <th>Mã Danh Mục:</th>
                        <td><%= curriculum.getCateID() %></td>
                    </tr>
                </tbody>
            </table>
            <a href="UpdateCurriculum.jsp?CurID=<%= curriculum.getCurID() %>" class="btn btn-success">Chỉnh sửa</a>
        <% } else { %>
            <div class="alert alert-danger" role="alert">
                Không tìm thấy thông tin chương trình giảng dạy.
            </div>
        <% } %>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
