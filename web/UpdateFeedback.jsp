<%-- 
    Document   : UpdateFeedback
    Created on : Jun 12, 2024, 7:50:33 AM
    Author     : PC
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Feedback</title>
</head>
<body>
    <h1>Update Feedback</h1>
    <c:forEach var="feedback" items="${vector}">
        <form action="FeedbackControllerURL?service=update" method="post">
            <input type="hidden" id="FeedbackID" name="FeedbackID" value="${feedback.feedbackID}">
            <label for="Date">Date (YYYY-MM-DD):</label><br>
            <input type="text" id="Date" name="Date" value="${feedback.date}"><br><br>
            <label for="Content">Content:</label><br>
            <textarea id="Content" name="Content" rows="4" cols="50">${feedback.content}</textarea><br><br>
            <label for="StudentID">Student ID:</label><br>
            <input type="text" id="StudentID" name="StudentID" value="${feedback.studentID}"><br><br>
            <input type="submit" name="submit" value="Update">
        </form>
    </c:forEach>
    <br>
    <a href="FeedbackControllerURL?service=listAll">Back to Feedback List</a>
</body>
</html>

