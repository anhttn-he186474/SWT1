<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product Manage</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 90%;
            margin: auto;
        }
        .search-bar {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            border: 1px solid #ccc;
            margin-bottom: 20px;
        }
        .search-bar input, .search-bar select {
            padding: 8px;
            margin-right: 10px;
        }
        .search-bar button {
            padding: 8px 12px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table th, table td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        .actions button {
            margin-right: 10px;
        }
        .pagination {
            text-align: center;
        }
        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: blue;
        }
        .pagination a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage > Product Manage</h2>
        <div class="search-bar">
            <select>
                <option>Category</option>
                <!-- Add more options here -->
            </select>
            <select>
                <option>Date</option>
                <!-- Add more options here -->
            </select>
            <select>
                <option>Price</option>
                <!-- Add more options here -->
            </select>
            <select>
                <option>Status</option>
                <!-- Add more options here -->
            </select>
            <input type="text" placeholder="Type here to search" />
            <button onclick="window.location.href='showProducts'">Search</button>
        </div>
        
        <div>
            <button>Delete Selected</button>
            <button onclick="window.location.href='product/addxx'">Add</button>
        </div>

        <table>
            <thead>
                <tr>
                    <th><input type="checkbox" /></th>
                    <th>Image</th>
                    <th>ID</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Total Sold</th>
                    <th>Version</th>
                    <th>Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
           <tbody>
    <%
        List<Product> productList = (List<Product>) request.getAttribute("productList");
        if (productList != null && !productList.isEmpty()) {
            for (Product product : productList) {
    %>
                <tr>
                    <td><input type="checkbox" /></td>
                    <td><img src="default-image-url.jpg" alt="Product Image" width="50" /></td> <!-- Thay thế URL hình ảnh nếu cần -->
                    <td><%= product.getProductID() %></td>
                    <td><%= product.getProductName() %></td> <!-- Sử dụng getProductName() thay cho getDescription() -->
                    <td><%= product.getStatus() %></td>
                    <td><%= product.getSold() %></td> <!-- Sử dụng getSold() thay cho getTotalSold() -->
                    <td><%= product.getProductVersion() %></td> <!-- Sử dụng getProductVersion() thay cho getVersion() -->
                    <td><%= product.getDateCreated() %></td>
                    <td class="actions">
                        <button>Delete</button>
                    </td>
                </tr>
    <%
            }
        }
    %>
</tbody>

        </table>

        <div class="pagination">
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">&gt;</a>
        </div>
    </div>
</body>
</html>
