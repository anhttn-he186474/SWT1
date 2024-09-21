<%-- 
    Document   : display
    Created on : Sep 21, 2024, 5:51:10 PM
    Author     : Asus
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Units and Packaging Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <h1>Units and Packaging Details</h1>

    <h2>Units</h2>
    <table>
        <tr>
            <th>Unit</th>
        </tr>
        <c:forEach var="unit" items="${units}">
            <tr>
                <td>${unit}</td>
            </tr>
        </c:forEach>
    </table>

    <h2>Packaging Details</h2>
    <table>
        <tr>
            <th>Packaging Detail</th>
        </tr>
        <c:forEach var="detail" items="${packagingDetails}">
            <tr>
                <td>${detail}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
