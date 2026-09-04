package dentalclinic.model;

import java.util.Date;

public class Bill {
    private String billId;
    private Appointment appointment;
    private double treatmentCost;
    private double consultationFee;
    private double totalCost;
    private Date billDate;

    public Bill() {
        this.consultationFee = 50.00;
        this.billDate = new Date();
    }

    public Bill(Appointment appointment, double treatmentCost) {
    this.appointment = appointment;
    this.treatmentCost = treatmentCost;
    this.consultationFee = 50.00;
    this.totalCost = treatmentCost + consultationFee;
    this.billDate = new Date();
}

    public String getBillId() { return billId; }
    public void setBillId(String billId) { this.billId = billId; }
    public Appointment getAppointment() { return appointment; }
    public void setAppointment(Appointment appointment) { this.appointment = appointment; }
    public double getTreatmentCost() { return treatmentCost; }
    public void setTreatmentCost(double treatmentCost) {
        this.treatmentCost = treatmentCost;
        this.totalCost = treatmentCost + consultationFee;
    }
    public double getConsultationFee() { return consultationFee; }
    public void setConsultationFee(double consultationFee) {
        this.consultationFee = consultationFee;
        this.totalCost = treatmentCost + consultationFee;
    }
    public double getTotalCost() { return totalCost; }
    public void setTotalCost(double totalCost) { this.totalCost = totalCost; }
    public Date getBillDate() { return billDate; }
    public void setBillDate(Date billDate) { this.billDate = billDate; }
}