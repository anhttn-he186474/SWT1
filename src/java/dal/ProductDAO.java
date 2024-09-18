package dal;

import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Ingredient;

public class ProductDAO extends DBContext {

    public ProductDAO() {
    }

    // Function to add a product to the database
    public boolean addProduct(Product product) {
        String sql = "INSERT INTO Product (CategoryID, Brand, ProductID, ProductName, PharmaceuticalForm, "
                + "BrandOrigin, Manufacturer, CountryOfProduction, ShortDescription, RegistrationNumber, "
                + "ProductDescription, ContentReviewer, FAQ, ProductReviews, Status, Sold, DateCreated, "
                + "ProductVersion, PrescriptionRequired, TargetAudience) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, product.getCategoryID());
            ps.setString(2, product.getBrand());
            ps.setString(3, product.getProductID());
            ps.setString(4, product.getProductName());
            ps.setString(5, product.getPharmaceuticalForm());
            ps.setString(6, product.getBrandOrigin());
            ps.setString(7, product.getManufacturer());
            ps.setString(8, product.getCountryOfProduction());
            ps.setString(9, product.getShortDescription());
            ps.setString(10, product.getRegistrationNumber());
            ps.setString(11, product.getProductDescription());
            ps.setString(12, product.getContentReviewer());
            ps.setString(13, product.getFaq());
            ps.setString(14, product.getProductReviews());
            ps.setInt(15, product.getStatus());
            ps.setInt(16, product.getSold());
            ps.setDate(17, java.sql.Date.valueOf(product.getDateCreated()));
            ps.setInt(18, product.getProductVersion());
            ps.setString(19, product.getPrescriptionRequired());
            ps.setString(20, product.getTargetAudience());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Hàm để thêm danh sách các nguyên liệu vào bảng Ingredient
    public boolean addIngredients(String productID, List<Ingredient> ingredients) {
        String sql = "INSERT INTO Ingredient (ProductIngredientID, ProductID, IngredientName, Quantity, Unit) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            // Bắt đầu giao dịch
            connection.setAutoCommit(false);

            for (int i = 0; i < ingredients.size(); i++) {
                Ingredient ingredient = ingredients.get(i);

                // Thiết lập ProductIngredientID bằng cách kết hợp ProductID và số thứ tự của thành phần
                String productIngredientID = productID + "_" + (i + 1);  // VD: P001_1, P001_2, ...

                ps.setString(1, productIngredientID); // ProductIngredientID
                ps.setString(2, productID);            // ProductID
                ps.setString(3, ingredient.getIngredientName()); // Tên nguyên liệu
                ps.setFloat(4, ingredient.getQuantity());        // Số lượng
                ps.setString(5, ingredient.getUnit());           // Đơn vị

                // Thêm vào batch
                ps.addBatch();
            }

            // Thực thi batch
            ps.executeBatch();

            // Commit giao dịch
            connection.commit();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                // Nếu có lỗi, rollback giao dịch
                connection.rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            return false;
        } finally {
            try {
                // Đảm bảo reset lại auto-commit về true sau khi giao dịch kết thúc
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
