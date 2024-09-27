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
    
private static final String UPLOAD_DIRECTORY = "images/users";
    
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
            // Tạo đường dẫn để lưu ảnh
        String originalPath = getServletContext().getRealPath("");
        String modifiedPath = originalPath.replace("\\build\\web\\", "\\web\\");
        String uploadPath = modifiedPath + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();  // Tạo thư mục nếu chưa tồn tại
        }

        // Xử lý upload ảnh
        Part filePart = request.getPart("imgProfile");  // Lấy file từ request
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Lấy tên file
        fileName = fileName.replaceAll("[^a-zA-Z0-9.\\-_]", "_"); // Thay thế ký tự không hợp lệ
        String filePath = uploadPath + File.separator + fileName;

        // Lưu file vào thư mục
        filePart.write(filePath);

        // Cập nhật các giá trị
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setImage("images/users/"+fileName);

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