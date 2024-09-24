<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <style>
        table {
            width: 50%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <h2>Change Password</h2>

    <form action="changePass" method="post">
        <table>
            <tr>
                <th>Old Password</th>
                <td><input type="password" name="oldPassword" required /></td>
            </tr>
            <tr>
                <th>New Password</th>
                <td><input type="password" name="newPassword" required /></td>
            </tr>
            <tr>
                <th>Confirm New Password</th>
                <td><input type="password" name="confirmPassword" required /></td>
            </tr>
        </table>
        <input type="submit" value="Change Password" />
    </form>

    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
    <c:if test="${not empty successMessage}">
        <p style="color: green;">${successMessage}</p>
    </c:if>
</body>
</html>
