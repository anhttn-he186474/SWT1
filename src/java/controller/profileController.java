package controller;

import model.User;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@MultipartConfig
public class profileController extends HttpServlet {
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User");

        if (user == null || user.getUsername() == null) {
            response.sendRedirect("login.jsp");
        } else {
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    }

  @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("User");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String action = request.getParameter("action");

    if ("updateProfile".equals(action)) {
        // Cập nhật thông tin hồ sơ
        String fullName = request.getParameter("fullName").trim();
        String email = request.getParameter("email").trim();
        String phone = request.getParameter("phone").trim();
        String address = request.getParameter("address").trim();
         Part part = request.getPart("imgProfile");
            String imgProfile = null;
            if (part != null && part.getSize() > 0) {
                String path = request.getServletContext().getRealPath("/img");
                File dir = new File(path);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                File image = new File(dir, fileName);
                part.write(image.getAbsolutePath());
                imgProfile = request.getContextPath() + "/img/" + fileName;
            }

        // Cập nhật các giá trị
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setImage(imgProfile);

        // Cập nhật trong cơ sở dữ liệu
        UserDAO userDao = new UserDAO();
        boolean updateSuccessful = userDao.updateUser(user);

        // Xử lý phản hồi
        if (updateSuccessful) {
            session.setAttribute("User", user); 
            response.sendRedirect("profile.jsp");
        } else {
            request.setAttribute("errorMessage", "Failed to update user information.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    } else if ("changePassword".equals(action)) {
        
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        UserDAO userDao = new UserDAO();

        if (!user.getPassword().equals(oldPassword)) {
            request.setAttribute("errorMessage", "Old password is incorrect.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "New password and confirm password do not match.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        boolean updateSuccessful = userDao.changePassword(user.getUsername(), newPassword);

        if (updateSuccessful) {
            request.setAttribute("successMessage", "Password updated successfully.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Failed to update the password.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    } else {
        request.setAttribute("errorMessage", "Invalid action.");
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
    
}

}