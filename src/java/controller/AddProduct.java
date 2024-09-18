package controller;

import dal.ProductDAO;
import model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Ingredient;


public class AddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    ProductDAO productDAO = new ProductDAO();
    List<String> units = productDAO.getAllUnits();
    
    // Đưa danh sách units vào request
    request.setAttribute("units",units);
    
    // Chuyển hướng đến trang JSP
    request.getRequestDispatcher("/product/addProduct.jsp").forward(request, response);
}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nhận dữ liệu từ form
        String categoryID = request.getParameter("categoryId");
        String brand = request.getParameter("brand");
        String productID = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String pharmaceuticalForm = request.getParameter("pharmaceuticalForm");
        String brandOrigin = request.getParameter("brandOrigin");
        String manufacturer = request.getParameter("manufacturer");
        String countryOfProduction = request.getParameter("countryOfProduction");
        String shortDescription = request.getParameter("shortDescription");
        String registrationNumber = request.getParameter("registrationNumber");
        String productDescription = request.getParameter("description");
        String contentReviewer = request.getParameter("contentReviewer");
        String faq = request.getParameter("faq");
        String productReviews = ""; // Assuming no reviews during product creation
        int status = Integer.parseInt(request.getParameter("status"));
        int sold = 0; // Default value for sold quantity
        String dateCreated = java.time.LocalDate.now().toString();
        int productVersion = 1; // Default product version
        String prescriptionRequired = request.getParameter("prescriptionRequired");
        String targetAudience = request.getParameter("targetAudience");

        // Tạo đối tượng Product từ dữ liệu nhận được
        Product product = new Product(categoryID, brand, productID, productName, pharmaceuticalForm, brandOrigin,
                manufacturer, countryOfProduction, shortDescription, registrationNumber,
                productDescription, contentReviewer, faq, productReviews, status, sold,
                dateCreated, productVersion, prescriptionRequired, targetAudience);

        // Thêm sản phẩm vào cơ sở dữ liệu
        ProductDAO productDAO = new ProductDAO();
        productDAO.addProduct(product);
        
          // Lấy dữ liệu nguyên liệu từ form (mảng tên nguyên liệu, số lượng và đơn vị)
    String[] ingredientNames = request.getParameterValues("ingredientName[]");
    String[] quantities = request.getParameterValues("quantity[]");
    String[] units = request.getParameterValues("unit[]");

    // Tạo danh sách các nguyên liệu
    List<Ingredient> ingredients = new ArrayList<>();
    for (int i = 0; i < ingredientNames.length; i++) {
        Ingredient ingredient = new Ingredient(productID, i + 1, ingredientNames[i], 
            Float.parseFloat(quantities[i]), units[i]);
        ingredients.add(ingredient);
    }

    // Gọi ProductDAO để thêm các nguyên liệu vào cơ sở dữ liệu
        productDAO.addIngredients(productID, ingredients);

//    if (success) {
//        response.sendRedirect("success.jsp");
//    } else {
//        response.sendRedirect("error.jsp");
//    }
        
//        boolean success = productDAO.addProduct(product);
//
//        // Chuyển hướng dựa trên kết quả thêm sản phẩm
//        if (success) {
//            response.sendRedirect("success.jsp");
//        } else {
//            response.sendRedirect("error.jsp");
//        }
    }

}
