package dentalclinic.model;

import java.util.Date;

public class Appointment {
    private String appointmentNumber;
    private Patient patient;
    private String dentistName;
    private String treatmentType;
    private Date appointmentDate;
    private String appointmentTime;
    private String status;

    public Appointment() {
        this.status = "SCHEDULED";
    }

    public String getAppointmentNumber() { return appointmentNumber; }
    public void setAppointmentNumber(String appointmentNumber) { this.appointmentNumber = appointmentNumber; }
    public Patient getPatient() { return patient; }
    public void setPatient(Patient patient) { this.patient = patient; }
    public String getDentistName() { return dentistName; }
    public void setDentistName(String dentistName) { this.dentistName = dentistName; }
    public String getTreatmentType() { return treatmentType; }
    public void setTreatmentType(String treatmentType) { this.treatmentType = treatmentType; }
    public Date getAppointmentDate() { return appointmentDate; }
    public void setAppointmentDate(Date appointmentDate) { this.appointmentDate = appointmentDate; }
    public String getAppointmentTime() { return appointmentTime; }
    public void setAppointmentTime(String appointmentTime) { this.appointmentTime = appointmentTime; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}