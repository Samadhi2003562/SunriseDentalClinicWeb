package dentalclinic.service;

import dentalclinic.dao.AppointmentDAO;
import dentalclinic.dao.BillDAO;
import dentalclinic.model.Appointment;
import dentalclinic.model.Bill;
import dentalclinic.model.Patient;
import java.util.Date;
import java.util.UUID;

public class AppointmentService {
    private AppointmentDAO appointmentDAO;
    private BillDAO billDAO;

    public AppointmentService() {
        this.appointmentDAO = new AppointmentDAO();
        this.billDAO = new BillDAO();
    }

    public String generateAppointmentNumber() {
        return "APT-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }

    public String registerAppointmentAndGetNumber(String patientName, String address, String contact,
                                                   String dentistName, String treatmentType, 
                                                   Date date, String time) {
        try {
            System.out.println("📝 Registering appointment for: " + patientName);
            
            Patient patient = new Patient();
            patient.setName(patientName);
            patient.setAddress(address);
            patient.setContactNumber(contact);

            Appointment appointment = new Appointment();
            String appointmentNumber = generateAppointmentNumber();
            appointment.setAppointmentNumber(appointmentNumber);
            appointment.setPatient(patient);
            appointment.setDentistName(dentistName);
            appointment.setTreatmentType(treatmentType);
            appointment.setAppointmentDate(date);
            appointment.setAppointmentTime(time);
            appointment.setStatus("SCHEDULED");

            boolean saved = appointmentDAO.saveAppointment(appointment);
            
            if (saved) {
                System.out.println("✅ Appointment saved! Number: " + appointmentNumber);
                return appointmentNumber;
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // ⬇️⬇️⬇️ THIS METHOD GOES HERE ⬇️⬇️⬇️
    public Appointment getAppointmentDetails(String appointmentNumber) {
        System.out.println("🔍 Searching for appointment: " + appointmentNumber);
        return appointmentDAO.findByAppointmentNumber(appointmentNumber);
    }
    // ⬆️⬆️⬆️ THIS METHOD GOES HERE ⬆️⬆️⬆️

    public Bill generateBill(String appointmentNumber) {
        Appointment appointment = appointmentDAO.findByAppointmentNumber(appointmentNumber);
        if (appointment == null) {
            return null;
        }

        double treatmentCost = billDAO.getTreatmentCost(appointment.getTreatmentType());
        Bill bill = new Bill(appointment, treatmentCost);
        billDAO.saveBill(bill);
        return bill;
    }

    public String generateReceiptText(Bill bill) {
        StringBuilder receipt = new StringBuilder();
        receipt.append("====================================\n");
        receipt.append("       DENTAL CLINIC RECEIPT\n");
        receipt.append("====================================\n\n");
        receipt.append("Bill #: ").append(bill.getBillId()).append("\n");
        receipt.append("Date: ").append(bill.getBillDate()).append("\n\n");
        receipt.append("Patient: ").append(bill.getAppointment().getPatient().getName()).append("\n");
        receipt.append("Treatment: ").append(bill.getAppointment().getTreatmentType()).append("\n");
        receipt.append("Dentist: ").append(bill.getAppointment().getDentistName()).append("\n\n");
        receipt.append("Charges:\n");
        receipt.append("  Treatment: $").append(String.format("%.2f", bill.getTreatmentCost())).append("\n");
        receipt.append("  Consultation: $").append(String.format("%.2f", bill.getConsultationFee())).append("\n");
        receipt.append("  ----------------------------------\n");
        receipt.append("  TOTAL: $").append(String.format("%.2f", bill.getTotalCost())).append("\n");
        receipt.append("====================================\n");
        receipt.append("     Thank you for your visit!\n");
        receipt.append("====================================\n");
        return receipt.toString();
    }
}