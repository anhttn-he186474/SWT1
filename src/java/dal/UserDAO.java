/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author trant
 */
public class UserDAO extends DBContext{
    public User check(String username, String password) {
        String sql = "SELECT * FROM Users WHERE username = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt("user_id"), rs.getString("full_name"), rs.getString("username"),
                        rs.getString("password"), rs.getString("email"), rs.getInt("role_id"), rs.getBoolean("status"), rs.getString("phone"), rs.getString("address"), rs.getString("image"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
