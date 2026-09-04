package dentalclinic.dao;

import dentalclinic.model.Appointment;
import dentalclinic.model.Patient;
import dentalclinic.util.DBConnection;

import java.sql.*;

public class AppointmentDAO {

    private PatientDAO patientDAO;

    public AppointmentDAO() {
        patientDAO = new PatientDAO();
    }

    // Save Appointment
    public boolean saveAppointment(Appointment appointment) {

    String sql = "INSERT INTO appointments "
            + "(appointment_number, patient_id, dentist_name, "
            + "treatment_type, appointment_date, appointment_time, status) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?)";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {

        conn = DBConnection.getInstance().getConnection();

        if (conn == null) {
            System.err.println("❌ AppointmentDAO: Database connection is NULL!");
            return false;
        }

        // Save patient first
        int patientId = patientDAO.savePatient(
                appointment.getPatient()
        );

        if (patientId <= 0) {
            System.err.println("❌ Patient could not be saved!");
            return false;
        }

        System.out.println("👤 Patient ID: " + patientId);

        pstmt = conn.prepareStatement(sql);

        pstmt.setString(
                1,
                appointment.getAppointmentNumber()
        );

        pstmt.setInt(2, patientId);

        pstmt.setString(
                3,
                appointment.getDentistName()
        );

        pstmt.setString(
                4,
                appointment.getTreatmentType()
        );

        // Date
        java.sql.Date sqlDate =
                new java.sql.Date(
                        appointment.getAppointmentDate().getTime()
                );

        pstmt.setDate(5, sqlDate);

        // Time
        String time = appointment.getAppointmentTime();

        if (time != null && time.length() == 5) {
            time = time + ":00";
        }

        java.sql.Time sqlTime =
                java.sql.Time.valueOf(time);

        pstmt.setTime(6, sqlTime);

        pstmt.setString(
                7,
                appointment.getStatus()
        );

        System.out.println("💾 Saving appointment...");
        System.out.println(
                "   Appointment No: "
                + appointment.getAppointmentNumber()
        );
        System.out.println(
                "   Dentist: "
                + appointment.getDentistName()
        );
        System.out.println(
                "   Treatment: "
                + appointment.getTreatmentType()
        );
        System.out.println(
                "   Date: "
                + sqlDate
        );
        System.out.println(
                "   Time: "
                + sqlTime
        );

        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {

            System.out.println(
                    "✅ Appointment saved successfully!"
            );

            return true;
        }

    } catch (SQLException e) {

        System.err.println(
                "❌ AppointmentDAO SQL Error: "
                + e.getMessage()
        );

        e.printStackTrace();

    } catch (Exception e) {

        System.err.println(
                "❌ AppointmentDAO Error: "
                + e.getMessage()
        );

        e.printStackTrace();

    } finally {

        try {
            if (pstmt != null) {
                pstmt.close();
            }
        } catch (SQLException e) {
        }

        // ❗ DO NOT close singleton connection
    }

    return false;
}

    // Find appointment by appointment number
    public Appointment findByAppointmentNumber(
            String appointmentNumber) {

        String sql =
                "SELECT a.*, " +
                "p.name, p.address, p.contact " +
                "FROM appointments a " +
                "JOIN patients p ON a.patient_id = p.id " +
                "WHERE a.appointment_number = ?";

        try {

            Connection conn =
                    DBConnection.getInstance().getConnection();

            if (conn == null) {

                System.err.println(
                        "❌ Database connection is NULL!"
                );

                return null;
            }

            try (PreparedStatement pstmt =
                         conn.prepareStatement(sql)) {

                pstmt.setString(
                        1,
                        appointmentNumber
                );

                try (ResultSet rs =
                             pstmt.executeQuery()) {

                    if (rs.next()) {

                        // Create Patient
                        Patient patient = new Patient();

                        patient.setPatientId(
                                String.valueOf(
                                        rs.getInt("patient_id")
                                )
                        );

                        patient.setName(
                                rs.getString("name")
                        );

                        patient.setAddress(
                                rs.getString("address")
                        );

                        patient.setContactNumber(
                                rs.getString("contact")
                        );


                        // Create Appointment
                        Appointment appointment =
                                new Appointment();

                        appointment.setAppointmentNumber(
                                rs.getString(
                                        "appointment_number"
                                )
                        );

                        appointment.setPatient(
                                patient
                        );

                        appointment.setDentistName(
                                rs.getString(
                                        "dentist_name"
                                )
                        );

                        appointment.setTreatmentType(
                                rs.getString(
                                        "treatment_type"
                                )
                        );

                        appointment.setAppointmentDate(
                                rs.getDate(
                                        "appointment_date"
                                )
                        );

                        appointment.setAppointmentTime(
                                rs.getString(
                                        "appointment_time"
                                )
                        );

                        appointment.setStatus(
                                rs.getString(
                                        "status"
                                )
                        );

                        System.out.println(
                                "✅ Found appointment: "
                                + appointmentNumber
                        );

                        return appointment;

                    } else {

                        System.out.println(
                                "❌ No appointment found: "
                                + appointmentNumber
                        );
                    }
                }
            }

        } catch (SQLException e) {

            System.err.println(
                    "❌ SQL Error while finding appointment!"
            );

            e.printStackTrace();
        }

        return null;
    }
}