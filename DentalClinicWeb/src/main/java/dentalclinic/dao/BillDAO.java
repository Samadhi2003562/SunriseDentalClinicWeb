package dentalclinic.dao;

import dentalclinic.model.Bill;
import dentalclinic.model.Appointment;

public class BillDAO {
    
    public boolean saveBill(Bill bill) {
        // Will be implemented after MongoDB setup
        return true;
    }

    public double getTreatmentCost(String treatmentType) {
        // Temporary costs (will be from MongoDB later)
        switch (treatmentType) {
            case "Cleaning": return 50.00;
            case "Filling": return 150.00;
            case "Root Canal": return 800.00;
            case "Crown": return 1200.00;
            case "Extraction": return 200.00;
            case "Whitening": return 300.00;
            default: return 0.0;
        }
    }

    public Bill findBillByAppointmentNumber(String appointmentNumber) {
        // Will be implemented after MongoDB setup
        return null;
    }
}