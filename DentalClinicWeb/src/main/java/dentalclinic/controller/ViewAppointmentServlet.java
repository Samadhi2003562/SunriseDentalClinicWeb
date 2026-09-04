package dentalclinic.controller;

import dentalclinic.model.Appointment;
import dentalclinic.service.AppointmentService;
import dentalclinic.util.ValidationUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/view")
public class ViewAppointmentServlet extends HttpServlet {
    private AppointmentService service;

    @Override
    public void init() {
        service = new AppointmentService();
        System.out.println("✅ ViewAppointmentServlet initialized");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        if (session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String appointmentNumber = request.getParameter("appointmentNumber");
        System.out.println("🔍 Searching for appointment: " + appointmentNumber);

        // Validate appointment number format
        if (appointmentNumber == null || appointmentNumber.trim().isEmpty()) {
            request.setAttribute("error", "Please enter an appointment number!");
            request.getRequestDispatcher("view.jsp").forward(request, response);
            return;
        }

        // Search for appointment
        Appointment appointment = service.getAppointmentDetails(appointmentNumber.trim());
        System.out.println("🔍 Appointment found: " + (appointment != null ? "YES" : "NO"));
        
        if (appointment != null) {
            System.out.println("📋 Appointment Number: " + appointment.getAppointmentNumber());
            System.out.println("👤 Patient: " + appointment.getPatient().getName());
            request.setAttribute("appointment", appointment);
        } else {
            request.setAttribute("error", "Appointment not found! Please check the appointment number.");
        }
        
        request.getRequestDispatcher("view.jsp").forward(request, response);
    }
}