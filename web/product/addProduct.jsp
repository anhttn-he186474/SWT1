<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
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
                overflow: visible;
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
            const existingProductIds = [
            <% for (Product product : products) { %>
                '<%= product.getProductID() %>',
            <% } %>
            ];
            // Function to check for duplicate product IDs
            function checkDuplicateProductId() {
                const productIdInput = document.getElementById("productId").value;
                if (existingProductIds.includes(productIdInput)) {
                    alert("The Product ID already exists. Please use a unique ID.");
                    return false; // Prevent form submission
                }
                return true; // Allow form submission
            }

            // Function to prevent negative numbers in quantity inputs
            function preventNegativeQuantities() {
                const quantityInputs = document.querySelectorAll('input[name="InQuantity[]"]');
                for (let input of quantityInputs) {
                    input.addEventListener('input', function () {
                        if (this.value < 0) {
                            alert("Quantity cannot be negative.");
                            this.value = ''; // Reset the value
                        }
                    });
                }
            }

            // Attach event listeners on page load
            window.onload = function () {
                preventNegativeQuantities();
            };

            // Form validation before submission
            function validateForm() {
                return checkDuplicateProductId(); // Call duplicate check function
            }


            // Hàm thêm dòng ingredient
            function addIngredientRow() {
                const container = document.getElementById('ingredientContainer');
                const newRow = document.createElement('div');
                newRow.className = 'ingredientRow';

                newRow.innerHTML = `
                    <input type="text" name="ingredientName[]" placeholder="Ingredient Name" class="ingredientInput">
                    <input type="text" name="InUnit[]" placeholder="Unit" class="ingredientInput">
                    <input type="text" name="InQuantity[]" placeholder="Quantity" class="ingredientInput">
                `;
                container.appendChild(newRow);
            }

            function addUnitRow() {
                const table = document.getElementById("unitTable");
                const row = table.insertRow(-1);

                // Clone the select options from the hidden template
                const unitOptions = document.getElementById("unitOptions").cloneNode(true);

                // Remove the display:none style and create the dropdown
                unitOptions.style.display = "block";
                unitOptions.name = "unit[]"; // Ensure the name attribute is added for form submission

                // Create a new row with the dropdown and input field for packaging details
                row.innerHTML = `
            <td></td> <!-- Empty cell for the unit dropdown -->
            <td><input type="text" name="packagingDetails[]" placeholder="Packaging details"></td>
        `;

                // Append the dropdown into the first cell of the new row
                row.cells[0].appendChild(unitOptions);
            }


        </script>
    </head>
    <body>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>


        <div class="container">
            <h1>Add Product Information</h1>
            <form action="addxx" method="post" enctype="multipart/form-data">
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

                        <label for="imageUpload">Upload Image *</label>
                        <input type="file" id="imageUpload" name="imageUpload" required>

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
                        <script>
            $(document).ready(function () {
                $('#categoryDropdown').select2({
                    placeholder: "Select Category",
                    allowClear: true
                });
            });
                        </script>
                        <label >Category *</label>
                        <select id="categoryDropdown" name="categoryId" style="width: 100%;" required>
                            <option value="">Select Category</option>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.categoryID}">${category.categoryName}</option>
                            </c:forEach>
                        </select>



                    </div>
                </div>

                <!-- Ingredient Section -->
                <div class="form-section">
                    <h3>Ingredients</h3>
                    <div id="ingredientContainer">
                        <div class="ingredientRow">
                            <input type="text" name="ingredientName[]" placeholder="Ingredient Name *" class="ingredientInput" required>
                            <input type="text" name="InUnit[]" placeholder="Unit *" class="ingredientInput" required>
                            <input type="text" name="InQuantity[]" placeholder="Quantity *" class="ingredientInput" required>
                        </div>
                    </div>
                    <button type="button" onclick="addIngredientRow()">+</button>
                </div>

                <!-- Unit Section -->
                <div class="form-section">
                    <h3>Unit and Packaging Details</h3>
                    <table id="unitTable">
                        <tr>
                            <th>Unit</th>
                            <th>Packaging Details</th>
                        </tr>
                        <tr>
                            <td>
                                <select name="unit[]">
                                    <c:forEach var="unit" items="${units}">
                                        <option value="${unit.unitID}">${unit.unitName}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td><input type="text" name="packagingDetails[]"></td>
                        </tr>
                    </table>
                    <button type="button" onclick="addUnitRow()">+</button>
                </div>

                <!-- Hidden select template for dynamically added rows -->
                <select id="unitOptions" style="display: none;">
                    <c:forEach var="unit" items="${units}">
                        <option value="${unit.unitID}">${unit.unitName}</option>
                    </c:forEach>
                </select>

                <div>
                    <p>All fields must be filled in correctly.</p>
                    <input type="radio" id="confirm" name="confirmation" required>
                    <label for="confirm">Confirm add information</label>
                </div>

                <button type="submit">OK</button>
                <button type="reset">Cancel</button>
            </form>
        </div>
    </body>
</html>
    