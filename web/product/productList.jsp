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
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
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
        .shortened-text {
            max-width: 150px; 
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            cursor: pointer;
            position: relative;
        }
        .shortened-text:hover::after {
            content: attr(data-full-text);
            position: absolute;
            background-color: #333;
            color: #fff;
            padding: 5px;
            border-radius: 5px;
            top: -5px;
            left: 100%;
            white-space: normal;
            max-width: 300px;
            z-index: 1;
        }
        @media screen and (max-width: 768px) {
            th, td {
                display: block;
                width: 100%;
            }
        }
        #searchInput {
            width: 300px;
            padding: 10px;
            margin-bottom: 20px;
            font-size: 16px;
        }
    </style>
    <script>
        function searchProduct() {
    var input, filter, table, tr, td, i, j, txtValue;
    input = document.getElementById("searchInput");
    filter = input.value.toLowerCase();
    table = document.getElementById("productTable");
    tr = table.getElementsByTagName("tr");

    let showNextRows = false; // Biến để quyết định có hiển thị các dòng tiếp theo hay không

    // Lặp qua tất cả các hàng và ẩn những hàng không phù hợp với tìm kiếm
    for (i = 1; i < tr.length; i++) {
        tr[i].style.display = "none"; // Mặc định ẩn hàng
        td = tr[i].getElementsByTagName("td");

        if (td.length > 0 && td[0].innerText.trim() !== "") { // Nếu là hàng chính của sản phẩm
            showNextRows = false; // Reset biến điều khiển hiển thị hàng chi tiết
            for (j = 0; j < td.length; j++) {
                if (td[j]) {
                    txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toLowerCase().indexOf(filter) > -1) {
                        tr[i].style.display = ""; // Hiển thị hàng chính nếu có từ khóa khớp
                        showNextRows = true; // Cho phép hiển thị các hàng chi tiết
                        break;
                    }
                }
            }
        } else if (showNextRows) {
            // Nếu là hàng chi tiết và sản phẩm chính đã được hiển thị
            tr[i].style.display = ""; // Hiển thị hàng chi tiết
        }
    }
}

    </script>
</head>
<body>
    <h1>Product List</h1>

    <!-- Input tìm kiếm -->
    <input type="text" id="searchInput" onkeyup="searchProduct()" placeholder="Search for products..." />

    <table id="productTable">
        <tr>
            <th>Thứ tự</th> <!-- Cột thứ tự -->
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Brand</th>
            <th>Description</th>
            <th>Category ID</th>
            <th>Actions</th>
        </tr>
        <%
            List<Product> productList = (List<Product>) request.getAttribute("productList");
            if (productList != null && !productList.isEmpty()) {
                int index = 1; // Biến đếm thứ tự sản phẩm
                for (Product product : productList) {
        %>
        <tr>
            <td><%= index++ %></td> <!-- Hiển thị thứ tự và tăng giá trị của index -->
            <td><%= product.getProductID() %></td>
            <td><%= product.getProductName() %></td>
            <td><%= product.getBrand() %></td>
            <!-- Description -->
            <td class="shortened-text" data-full-text="<%= product.getProductDescription() %>">
                <%= product.getProductDescription() %>
            </td>
            <td><%= product.getCategoryID() %></td>
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
        <!-- Hàng thứ hai của sản phẩm -->
        <tr>
            <td></td> <!-- Cột trống cho hàng thứ hai -->
            <td colspan="2">Pharmaceutical Form: <%= product.getPharmaceuticalForm() %></td>
            <td colspan="2">Brand Origin: <%= product.getBrandOrigin() %></td>
            <td colspan="2">Manufacturer: <%= product.getManufacturer() %></td>
        </tr>
        <tr>
            <td></td> <!-- Cột trống cho hàng thứ hai -->
            <td colspan="2">Country of Production: <%= product.getCountryOfProduction() %></td>
            <td colspan="2" class="shortened-text" data-full-text="<%= product.getShortDescription() %>">
                Short Description: <%= product.getShortDescription() %>
            </td>
            <td colspan="2" class="shortened-text" data-full-text="<%= product.getContentReviewer() %>">
                Content Reviewer: <%= product.getContentReviewer() %>
            </td>
        </tr>
        <tr>
            <td></td> <!-- Cột trống cho hàng thứ hai -->
            <td colspan="2" class="shortened-text" data-full-text="<%= product.getFaq() %>">
                FAQ: <%= product.getFaq() %>
            </td>
            <td colspan="2">Product Reviews: <%= product.getProductReviews() %></td>
            <td colspan="2">Sold: <%= product.getSold() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="7">No products available.</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
