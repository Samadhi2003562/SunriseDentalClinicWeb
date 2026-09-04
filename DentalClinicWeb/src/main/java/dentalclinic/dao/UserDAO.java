package dentalclinic.dao;

import dentalclinic.model.User;
import dentalclinic.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public User validateUser(String username, String password) {

    String sql = "SELECT username, password, role " +
                 "FROM users " +
                 "WHERE username = ? AND password = ?";

    System.out.println("=================================");
    System.out.println("Username: [" + username + "]");
    System.out.println("Password: [" + password + "]");

    try {

        Connection conn = DBConnection.getInstance().getConnection();

        if (conn == null) {
            System.out.println("❌ CONNECTION IS NULL!");
            return null;
        }

        System.out.println("✅ Database connection OK!");

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);

            System.out.println("🔎 Executing login query...");

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {

                    System.out.println("✅ USER FOUND!");
                    System.out.println("Role: " + rs.getString("role"));

                    return new User(
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("role")
                    );

                } else {

                    System.out.println("❌ USER NOT FOUND!");
                }
            }
        }

    } catch (SQLException e) {

        System.out.println("❌ SQL ERROR!");
        e.printStackTrace();
    }

    return null;
}
}