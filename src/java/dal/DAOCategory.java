/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.DBConnect;
/**
 *
 * @author kan3v
 */
public class DAOCategory extends DBConnect{
    
    public int removeCategory(int CategoryID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Category] WHERE [CategoryID] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, CategoryID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int insertCategory(Category category) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Category]\n"
                + "           ([CategoryID], [CategoryName], [ParentCategoryID])"
                + "     VALUES (?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, category.getCategoryID());
            pre.setString(2, category.getCategoryName());
            pre.setInt(3, category.getParentCategoryID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateCategory(Category category) {
        int n = 0;
        String sql = "UPDATE [dbo].[Category]\n"
                + "   SET [CategoryName] = ?,\n"
                + "       [ParentCategoryID] = ?,\n"
                + " WHERE [CategoryID] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(2, category.getCategoryName());
            pre.setInt(3, category.getParentCategoryID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Vector<Category> getCategory(String sql) {
        Vector<Category> vector = new Vector<Category>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                int model_year = rs.getInt(3);
                Category category = new Category(product_id, product_name, model_year);
                vector.add(category);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }

    public void listAll() {
        String sql = "select * from products";
        try {
            Statement state = conn.createStatement();
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                int model_year = rs.getInt(3);
                Category product = new Category(product_id, product_name, model_year);
                System.out.println(product);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
