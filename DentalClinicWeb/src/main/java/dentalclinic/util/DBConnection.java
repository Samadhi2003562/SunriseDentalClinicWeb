package dentalclinic.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static DBConnection instance;
    private Connection connection;

    private static final String URL =
            "jdbc:postgresql://localhost:5432/dentalclinic_db";

    private static final String USER = "postgres";

    private static final String PASSWORD = "admin123";

    // Private constructor
    private DBConnection() {
        connect();
    }

    // Create database connection
    private void connect() {

        try {
            Class.forName("org.postgresql.Driver");

            connection = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            System.out.println("=================================");
            System.out.println("✅ Connected to PostgreSQL!");
            System.out.println("=================================");

        } catch (ClassNotFoundException e) {

            System.err.println("❌ PostgreSQL JDBC Driver not found!");
            e.printStackTrace();

            connection = null;

        } catch (SQLException e) {

            System.err.println("❌ Database connection failed!");
            System.err.println("Message: " + e.getMessage());
            e.printStackTrace();

            connection = null;
        }
    }

    // Singleton instance
    public static synchronized DBConnection getInstance() {

        if (instance == null) {
            instance = new DBConnection();
        }

        return instance;
    }

    // Get database connection
    public Connection getConnection() {

        try {

            // If connection is null
            if (connection == null) {
                System.out.println("⚠️ Connection is NULL. Trying to reconnect...");
                connect();
            }

            // If connection is closed
            else if (connection.isClosed()) {
                System.out.println("⚠️ Connection is closed. Trying to reconnect...");
                connect();
            }

        } catch (SQLException e) {

            System.err.println("❌ Connection check failed!");
            e.printStackTrace();
        }

        return connection;
    }

    // Close connection
    public void closeConnection() {

        try {

            if (connection != null && !connection.isClosed()) {

                connection.close();

                System.out.println("🔌 PostgreSQL connection closed.");
            }

        } catch (SQLException e) {

            System.err.println("❌ Error while closing connection!");
            e.printStackTrace();
        }
    }
}