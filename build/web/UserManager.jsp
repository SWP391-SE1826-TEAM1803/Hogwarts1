<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector,entity.User"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Account - Hogwarts</title>
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="HeaderAdmin.jsp"%>
        <main id="main" class="main">
            <div class="pagetitle">
                <h1>Accounts List</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="HomeAdmin.jsp">Home</a></li>
                        <li class="breadcrumb-item active" ><a href="UserControllerURL?service=listAll">Accounts</a></li>
                    </ol>
                </nav>
            </div>

            <div class="col-12">
                <div class="card recent-sales overflow-auto">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <form method="get" action="UserControllerURL" class="form-inline">
                                <div class="form-group mb-0 d-inline-flex">
                                    <select class="form-control mr-2" id="roleSelect" name="role">
                                        <option value="">All</option>
                                        <option value="Admin">Admin</option>
                                        <option value="Parent">Parents</option>
                                        <option value="Teacher">Teacher</option>
                                        <!-- Add more roles as needed -->
                                    </select>
                                    <button type="submit" class="btn btn-primary">Filter</button>
                                </div>
                            </form>
                            <a href="InsertUser.jsp" class="btn btn-success">Add New User</a>


                        </div>
                        <!-- Table -->
                        <table class="table table-borderless datatable mt-3">
                            <thead>
                                <tr>
                                    <th scope="col">User ID</th>
                                    <th scope="col">Full name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Role</th>
                                    <th scope="col" style="text-align: center;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% Vector<User> vector = (Vector<User>)request.getAttribute("data");
                                    for(User user : vector) {
                                %>
                                <tr>
                                    <td><%= user.getUserID() %></td>
                                    <td><%= user.getFullName() %></td>
                                    <td><%= user.getGender() %></td>
                                    <td><%= user.getAddress() %></td>
                                    <td><%= user.getPhone() %></td>
                                    <td><%= user.getEmail() %></td>
                                    <td><%= user.getRole() %></td>
                                    <td style="text-align: center;">
                                        <a class="btn btn-outline-warning btn-icon-text" href="UserControllerURL?service=updateUser&UserID=<%=user.getUserID()%>">
                                            <i class="mdi mdi-refresh"></i> Update
                                        </a>
                                        <a class="btn btn-outline-danger btn-icon-text" href="UserControllerURL?service=deleteUser&UserID=<%=user.getUserID()%>">
                                            <i class="mdi mdi-delete-forever"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </main>
        <%@include file="Footer.jsp"%>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
