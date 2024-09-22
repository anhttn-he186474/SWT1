<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<html>
<head>
    <title>Product List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            overflow-x: auto; /* Allow horizontal scrolling if necessary */
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
            white-space: nowrap; /* Prevent text from wrapping */
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e9e9e9;
        }
        @media screen and (max-width: 768px) {
            th, td {
                display: block; /* Stack elements vertically on smaller screens */
                width: 100%; /* Make them full width */
            }
        }
    </style>
</head>
<body>
    <h1>Product List</h1>
    <table>
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Brand</th>
            <th>Description</th>
            <th>Category ID</th>
            <th>Pharmaceutical Form</th>
            <th>Brand Origin</th>
            <th>Manufacturer</th>
            <th>Country of Production</th>
            <th>Short Description</th>
            <th>Registration Number</th>
            <th>Content Reviewer</th>
            <th>FAQ</th>
            <th>Product Reviews</th>
            <th>Status</th>
            <th>Sold</th>
            <th>Date Created</th>
            <th>Product Version</th>
            <th>Prescription Required</th>
            <th>Target Audience</th>
            <th>Actions</th> <!-- Cột cho nút View -->
        </tr>
        <%
            List<Product> productList = (List<Product>) request.getAttribute("productList");
            if (productList != null && !productList.isEmpty()) {
                for (Product product : productList) {
        %>
        <tr>
            <td><%= product.getProductID() %></td>
            <td><%= product.getProductName() %></td>
            <td><%= product.getBrand() %></td>
            <td><%= product.getProductDescription() %></td>
            <td><%= product.getCategoryID() %></td>
            <td><%= product.getPharmaceuticalForm() %></td>
            <td><%= product.getBrandOrigin() %></td>
            <td><%= product.getManufacturer() %></td>
            <td><%= product.getCountryOfProduction() %></td>
            <td><%= product.getShortDescription() %></td>
            <td><%= product.getRegistrationNumber() %></td>
            <td><%= product.getContentReviewer() %></td>
            <td><%= product.getFaq() %></td>
            <td><%= product.getProductReviews() %></td>
            <td><%= product.getStatus() %></td>
            <td><%= product.getSold() %></td>
            <td><%= product.getDateCreated() %></td>
            <td><%= product.getProductVersion() %></td>
            <td><%= product.getPrescriptionRequired() %></td>
            <td><%= product.getTargetAudience() %></td>
            <td>
                <a href="ShowIngredients?productID=<%= product.getProductID() %>" 
                   style="background-color: gray; color: white; padding: 5px 10px; text-decoration: none; border-radius: 3px;">
                   View Ingredients
                </a>
                <a href="showProductPriceQuantity?productID=<%= product.getProductID() %>" 
                   style="background-color: blue; color: white; padding: 5px 10px; text-decoration: none; border-radius: 3px; margin-left: 5px;">
                   View Product Price Quantity
                </a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="20">No products available.</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
