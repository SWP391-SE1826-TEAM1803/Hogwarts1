<%-- 
    Document   : FeedbackList
    Created on : Jun 12, 2024, 7:44:57 AM
    Author     : PC
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Feedback List</h1>
    <table>
        <thead>
            <tr>
                <th>Feedback ID</th>
                <th>Date</th>
                <th>Content</th>
                <th>Student ID</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="feedback" items="${data}">
                <tr>
                    <td>${feedback.feedbackID}</td>
                    <td>${feedback.date}</td>
                    <td>${feedback.content}</td>
                    <td>${feedback.studentID}</td>
                    <td>
                        <a href="FeedbackControllerURL?service=update&FeedbackID=${feedback.feedbackID}">Edit</a> |
                        <a href="FeedbackControllerURL?service=delete&FeedbackID=${feedback.feedbackID}" onclick="return confirm('Are you sure you want to delete this feedback?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br>
    <a href="InsertFeedback.jsp">Add New Feedback</a>
</body>
</html>

