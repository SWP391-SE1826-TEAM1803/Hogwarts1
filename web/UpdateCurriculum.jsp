<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.DAOCurriculum" %>
<%@ page import="entity.Curriculum" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa chương trình giảng dạy</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">Chỉnh sửa chương trình giảng dạy</h1>
        
        <% 
            String curID = request.getParameter("CurID");
            DAOCurriculum dao = new DAOCurriculum();
            Curriculum curriculum = dao.getCurriculumByID(curID);
            
            if (curriculum != null) {
        %>
            <form action="CurriculumControllerURL" method="post">
                <input type="hidden" name="service" value="update">
                <input type="hidden" name="CurID" value="<%= curID %>">
                <div class="form-group">
                    <label for="CurName">Tên Chương Trình:</label>
                    <input type="text" class="form-control" id="CurName" name="CurName" value="<%= curriculum.getCurName() %>" required>
                </div>
                <div class="form-group">
                    <label for="CateID">Mã Danh Mục:</label>
                    <input type="text" class="form-control" id="CateID" name="CateID" value="<%= curriculum.getCateID() %>" required>
                </div>
                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
            </form>
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
