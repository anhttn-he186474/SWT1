/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author kan3v
 */
public class Category {
    private int CategoryID;
    private String CategoryName;
    private int ParentCategoryID;

    public Category() {
    }

    public Category(int CategoryID, String CategoryName, int ParentCategoryID) {
        this.CategoryID = CategoryID;
        this.CategoryName = CategoryName;
        this.ParentCategoryID = ParentCategoryID;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public int getParentCategoryID() {
        return ParentCategoryID;
    }

    public void setParentCategoryID(int ParentCategoryID) {
        this.ParentCategoryID = ParentCategoryID;
    }

    @Override
    public String toString() {
        return "Category{" + "CategoryID=" + CategoryID + ", CategoryName=" + CategoryName + ", ParentCategoryID=" + ParentCategoryID + '}';
    }
    
    
}
