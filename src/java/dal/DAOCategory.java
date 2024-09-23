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

    public Vector<Category> getCategory(String sql) {
        Vector<Category> list = new Vector<Category>();
        try {
            Statement state = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String cateid = rs.getString(1);
                byte[] icon = rs.getBytes(2);
                String catename = rs.getString(3);
                String pcateid = rs.getString(4);
                Category category = new Category(cateid, icon, catename, pcateid);
                list.add(category);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // In lỗi ra màn hình
        }
        return list;
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
