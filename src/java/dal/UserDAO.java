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
public class UserDAO extends DBContext {

    public User check(String username, String password) {
        String sql = "SELECT * FROM Users WHERE username = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(
                        rs.getInt("user_id"),
                        rs.getString("full_name"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getInt("role_id"),
                        rs.getBoolean("status"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("image")
                );
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean updateUser(User user) {
        String sql = "UPDATE users SET full_name = ?, username = ?, email = ?, role_id = ?, status = ?, phone = ?, address = ?, image = ? WHERE user_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            {
                ps.setString(1, user.getFullName());
                ps.setString(2, user.getUsername());
                ps.setString(3, user.getEmail());
                ps.setInt(4, user.getRoleId());
                ps.setBoolean(5, user.isStatus());
                ps.setString(6, user.getPhone());
                ps.setString(7, user.getAddress());
                ps.setString(8, user.getImage());
                ps.setInt(9, user.getUserId());

                int rowsUpdated = ps.executeUpdate();

                return rowsUpdated > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean changePassword(String username, String newPassword) {
        String sql = "UPDATE users SET password = ? WHERE username = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, newPassword);
            ps.setString(2, username);

            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
