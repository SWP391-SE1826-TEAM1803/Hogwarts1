<%-- 
    Document   : InsertFeedback
    Created on : Jun 12, 2024, 7:49:14 AM
    Author     : PC
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Feedback</title>
</head>
<body>
    <h1>Add New Feedback</h1>
    <form action="FeedbackControllerURL?service=addFeedback" method="post">
        <label for="FeedbackID">Feedback ID:</label><br>
        <input type="text" id="FeedbackID" name="FeedbackID"><br><br>
        <label for="Date">Date (YYYY-MM-DD):</label><br>
        <input type="text" id="Date" name="Date"><br><br>
        <label for="Content">Content:</label><br>
        <textarea id="Content" name="Content" rows="4" cols="50"></textarea><br><br>
        <label for="StudentID">Student ID:</label><br>
        <input type="text" id="StudentID" name="StudentID"><br><br>
        <input type="submit" value="Submit">
    </form>
    <br>
    <a href="FeedbackControllerURL?service=listAll">Back to Feedback List</a>
</body>
</html>

