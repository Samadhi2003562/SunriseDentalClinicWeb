package dentalclinic.dao;

import dentalclinic.model.Patient;
import dentalclinic.util.DBConnection;
import java.sql.*;

public class PatientDAO {

    public int savePatient(Patient patient) {

        String sql = "INSERT INTO patients (name, address, contact) VALUES (?, ?, ?)";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            conn = DBConnection.getInstance().getConnection();

            if (conn == null) {
                System.err.println("❌ PatientDAO: Database connection is NULL!");
                return -1;
            }

            pstmt = conn.prepareStatement(
                    sql,
                    Statement.RETURN_GENERATED_KEYS
            );

            pstmt.setString(1, patient.getName());
            pstmt.setString(2, patient.getAddress());
            pstmt.setString(3, patient.getContactNumber());

            System.out.println("👤 Saving patient...");
            System.out.println("   Name: " + patient.getName());
            System.out.println("   Address: " + patient.getAddress());
            System.out.println("   Contact: " + patient.getContactNumber());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {

                rs = pstmt.getGeneratedKeys();

                if (rs.next()) {

                    int id = rs.getInt(1);

                    System.out.println(
                            "✅ Patient saved successfully! ID: " + id
                    );

                    return id;
                }
            }

        } catch (SQLException e) {

            System.err.println(
                    "❌ PatientDAO SQL Error: " + e.getMessage()
            );

            e.printStackTrace();

        } finally {

            try {
                if (rs != null) rs.close();
            } catch (SQLException e) {
            }

            try {
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
            }

            // ❗ DO NOT close singleton connection here
        }

        return -1;
    }
}