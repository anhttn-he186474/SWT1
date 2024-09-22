/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author kan3v
 */
public class DAOCategory extends DBContext {

    public int removeCategory(int CategoryID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Category] WHERE [CategoryID] = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
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
                + "           ([CategoryID], [Icon], [CategoryName], [ParentCategoryID])"
                + "     VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, category.getCategoryID());
            pre.setBytes(2, category.getIcon());
            pre.setString(3, category.getCategoryName());
            pre.setString(4, category.getParentCategoryID());
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
                + "       [Icon] = ?,\n"
                + "       [ParentCategoryID] = ?,\n"
                + " WHERE [CategoryID] = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, category.getCategoryName());
            pre.setBytes(2, category.getIcon());
            pre.setString(3, category.getParentCategoryID());
            pre.setString(4, category.getCategoryID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public ArrayList<Category> listCategory() {
        ArrayList<Category> CategoryList = new ArrayList<>();
        try {
            String sql = "SELECT CategoryID,Icon, CategoryName, ParentCategoryID from Category";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryID(rs.getString("CategoryID"));
                category.setIcon(rs.getBytes("Icon"));
                category.setCategoryName(rs.getString("CategoryName"));
                category.setParentCategoryID(rs.getString("ParentCategoryID"));
                CategoryList.add(category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }

        return CategoryList;
    }

    public void listAll() {
        String sql = "select * from Category";
        try {
            Statement state = connection.createStatement();
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String categoryid = rs.getString(1);
                byte[] icon = rs.getBytes(2);
                String categoryname = rs.getString(3);
                String pcategoryid = rs.getString(4);
                Category category = new Category(categoryid, icon, categoryname, pcategoryid);
                System.out.println(category);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
