package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Category;


public class ProductManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       ProductDAO productDAO = new ProductDAO();
       CategoryDAO categoryDAO = new CategoryDAO();
        List<Product> products = productDAO.getAllProducts();
        List<Category> categories = categoryDAO.getAllCategories();
        request.setAttribute("productList", products);
        request.setAttribute("categories", categories);

        // Chuyển tiếp đến JSP
        request.getRequestDispatcher("/product/productManageView.jsp").forward(request, response);
    }
}
