<%-- 
    Document   : addProduct
    Created on : Sep 17, 2024, 5:41:26 PM
    Author     : Asus
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product Management - Add Product</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .container {
                width: 100%;
                padding: 20px;
            }
            .form-section {
                border: 1px solid #ccc;
                padding: 10px;
                margin-bottom: 20px;
            }
            input[type="text"], select, textarea {
                width: 100%;
                padding: 8px;
                margin: 5px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .grid-container {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            button {
                padding: 10px 20px;
                margin-top: 20px;
            }
            .ingredientRow {
                display: flex;
                gap: 10px;
                margin-bottom: 10px;
            }
            .ingredientInput {
                width: 30%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
        </style>
        <script>
            function addIngredientRow() {
                const container = document.getElementById('ingredientContainer');
                const newRow = document.createElement('div');
                newRow.className = 'ingredientRow';

                newRow.innerHTML = `
            <input type="text" name="ingredientName[]" placeholder="Ingredient Name" class="ingredientInput">
            <input type="text" name="unit[]" placeholder="Unit" class="ingredientInput">
            <input type="text" name="quantity[]" placeholder="Quantity" class="ingredientInput">
        `;
                container.appendChild(newRow);
            }

            function addPriceRow() {
                const table = document.getElementById("priceTable");
                const row = table.insertRow(-1);
                row.innerHTML = `
                    <td><input type="text" name="priceUnit[]"></td>
                    <td><input type="text" name="price[]"></td>
                `;
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Add Product Information</h1>
            <form action="addxx" method="post" >
                <div class="grid-container">
                    <!-- Left Section -->
                    <div>
                        <label for="productId">ID - Unique *</label>
                        <input type="text" id="productId" name="productId" required>

                        <label for="targetAudience">Target Audience</label>
                        <input type="text" id="targetAudience" name="targetAudience">

                        <label for="brand">Brand</label>
                        <input type="text" id="brand" name="brand">

                        <label for="productName">Product Name *</label>
                        <input type="text" id="productName" name="productName" required>

                        <label for="contentReviewer">Content Reviewer</label>
                        <input type="text" id="contentReviewer" name="contentReviewer">

                        <label for="imageUpload">Upload Image</label>
                        <input type="file" id="imageUpload" name="imageUpload">

                        <label for="shortDescription">Short Description</label>
                        <textarea id="shortDescription" name="shortDescription"></textarea>

                        <label for="faq">FAQ</label>
                        <textarea id="faq" name="faq"></textarea>

                        <label for="description">Description</label>
                        <textarea id="description" name="description"></textarea>
                    </div>

                    <!-- Right Section -->
                    <div>
                        <label for="pharmaceuticalForm">Pharmaceutical Form</label>
                        <input type="text" id="pharmaceuticalForm" name="pharmaceuticalForm">

                        <label for="packagingDetails">Packaging Details</label>
                        <input type="text" id="packagingDetails" name="packagingDetails">

                        <label for="brandOrigin">Brand Origin</label>
                        <input type="text" id="brandOrigin" name="brandOrigin">

                        <label for="manufacturer">Manufacturer</label>
                        <input type="text" id="manufacturer" name="manufacturer">

                        <label for="countryOfProduction">Country of Production</label>
                        <input type="text" id="countryOfProduction" name="countryOfProduction">

                        <label for="registrationNumber">Registration Number *</label>
                        <input type="text" id="registrationNumber" name="registrationNumber" required>

                        <label for="status">Status *</label>
                        <select id="status" name="status" required>
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                        </select>

                        <label for="prescriptionRequired">Prescription Required *</label>
                        <select id="prescriptionRequired" name="prescriptionRequired" required>
                            <option value="yes">Yes</option>
                            <option value="no">No</option>
                        </select>

                        <label for="categoryId">Category ID *</label>
                        <input type="text" id="categoryId" name="categoryId" required>
                    </div>
                </div>

                <!-- Ingredient Section -->
                <div class="form-section">
                    <h3>Ingredients</h3>
                    <div id="ingredientContainer">
                        <div class="ingredientRow">
                            <input type="text" name="ingredientName[]" placeholder="Ingredient Name" class="ingredientInput">
                            <input type="text" name="unit[]" placeholder="Unit" class="ingredientInput">
                            <input type="text" name="quantity[]" placeholder="Quantity" class="ingredientInput">
                        </div>
                    </div>
                    <button type="button" onclick="addIngredientRow()">+</button>
                </div>

                <!-- Price Section -->
                <div class="form-section">
                    <h3>Price</h3>
                    <table id="priceTable">
                        <tr>
                            <th>Unit</th>
                            <th>Price per Unit (VND)</th>
                        </tr>
                        <tr>
                            <td><input type="text" name="priceUnit[]"></td>
                            <td><input type="text" name="price[]"></td>
                        </tr>
                    </table>
                    <button type="button" onclick="addPriceRow()">+</button>
                </div>

                <div>
                    <p>All fields must be filled in correctly.</p>
                    <input type="radio" id="confirm" name="confirmation" required>
                    <label for="confirm">Confirm add information</label>
                </div>

                <button type="submit">OK</button>
                <button type="reset">Cancel</button>
            </form>
        </div>

        <!-- Hidden select template for dynamically added rows -->
        <select id="unitOptions" style="display: none;">
            <c:forEach items="${listUnit}" var="unit">
                <option value="${unit}">${unit}</option>
            </c:forEach>
        </select>
    </body>
</html>
