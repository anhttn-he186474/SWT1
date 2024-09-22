package controller;

import dal.ProductDAO;
import model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class ProductManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.getAllProducts();
        request.setAttribute("productList", products);

        // Chuyển tiếp đến JSP
        request.getRequestDispatcher("/product/productManageView.jsp").forward(request, response);
    }
}
