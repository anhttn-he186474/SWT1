<%-- 
    Document   : CategoryAddScreen
    Created on : Sep 17, 2024, 11:08:04 PM
    Author     : kan3v
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category</title>
    </head>
    <body>
        <table border="1">
            Add Category Table
            <tr>
                <th>Category ID</th>
                <th><input type="text" name="categoryid"></th>
            </tr>
            <tr>
                <th>Icon</th>
                <th><input type="submit" value="add" /></th>
            </tr>
            <tr>
                <th>Category name</th>
                <th><input type="text" name="categoryname"></th>
            </tr>
            <tr>
                <th>Parent Category ID</th>
                <th><input type="text" name="pcategoryid"></th>
            </tr>
        </table>
        
        <div>
            <input type="submit" value="Add Category" />
            <a href="CategoryListScreen.jsp"><input type="button" value="back" /></a>
        </div>

    </body>
</html>
