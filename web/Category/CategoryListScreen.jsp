<%-- 
    Document   : CategoryListScreen
    Created on : Sep 17, 2024, 11:07:45 PM
    Author     : kan3v
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Category</title>
    </head>
    <body>
        <form method="POST" action="CategoryListController">
            <input type="text" placeholder="Search by Category ID or Name" /><button>Enter</button>
            
            <br>
            <br>
            <select>
                <option>Category ID</option>
                <option>Category Name</option>
                <option>Parent Category ID</option>
            </select>

            <select>
                <option>Ascending</option>
                <option>Descending</option>
            </select>
            <table border="1">
                <thead>
                    <tr>
                        <td colspan="6">Add new category</td>
                        <td >
                            <a href="CategoryAddScreen.jsp"><button>Add</button></a> 
                        </td>
                    </tr>
                    <tr>
                        <th>Category ID</th>
                        <th>Icon</th>
                        <th>Category Name</th>
                        <th>Parent Category ID</th>
                        <th colspan="3">Manage</th>
                    </tr>
                </thead>
                <tbody>
                
                <c:forEach items="${CategoryList}" var="category">
                    <tr>
                        <td>${category.getCategoryId()}</td>
                        <td>${category.getIcon()}</td>
                        <td>${category.getCategoryName()}</td>
                        <td>${category.getParentCategoryId()}</td>
                        <td>
                            <a href="CategoryUpdateScreen.jsp"><button>Update(icon)</button></a>
                        </td>
                        <td>
                            <button>Delete(icon)</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <section> 
                <label for="page">Page</label>
                <input type="number" id="page" min="1" max="99" />
                <button>Go</button>
            </section>
        </form>

    </body>
</html>
