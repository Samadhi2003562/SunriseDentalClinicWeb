package dentalclinic.controller;

import dentalclinic.service.AppointmentService;
import dentalclinic.util.ValidationUtil;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterAppointmentServlet extends HttpServlet {

    private AppointmentService service;

    @Override
    public void init() throws ServletException {
        service = new AppointmentService();
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(
                    request.getContextPath() + "/index.jsp"
            );
            return;
        }

        try {

            // Get form data
            String name = request.getParameter("patientName");
            String address = request.getParameter("address");
            String contact = request.getParameter("contact");
            String dentist = request.getParameter("dentistName");
            String treatment = request.getParameter("treatmentType");
            String dateStr = request.getParameter("appointmentDate");
            String time = request.getParameter("appointmentTime");

            System.out.println("=================================");
            System.out.println("📝 Appointment Form Data");
            System.out.println("=================================");
            System.out.println("Patient Name : " + name);
            System.out.println("Address      : " + address);
            System.out.println("Contact      : " + contact);
            System.out.println("Dentist      : " + dentist);
            System.out.println("Treatment    : " + treatment);
            System.out.println("Date         : " + dateStr);
            System.out.println("Time         : " + time);
            System.out.println("=================================");

            // Validate name
            if (name == null || !ValidationUtil.isValidName(name)) {

                request.setAttribute(
                        "error",
                        "Invalid patient name!"
                );

                request.getRequestDispatcher("/register.jsp")
                       .forward(request, response);

                return;
            }

            // Validate phone
            if (contact == null ||
                    !ValidationUtil.isValidPhoneNumber(contact)) {

                request.setAttribute(
                        "error",
                        "Invalid phone number!"
                );

                request.getRequestDispatcher("/register.jsp")
                       .forward(request, response);

                return;
            }

            // Check date
            if (dateStr == null || dateStr.trim().isEmpty()) {

                request.setAttribute(
                        "error",
                        "Please select appointment date!"
                );

                request.getRequestDispatcher("/register.jsp")
                       .forward(request, response);

                return;
            }

            // Check time
            if (time == null || time.trim().isEmpty()) {

                request.setAttribute(
                        "error",
                        "Please select appointment time!"
                );

                request.getRequestDispatcher("/register.jsp")
                       .forward(request, response);

                return;
            }

            // Convert String → Date
            SimpleDateFormat sdf =
                    new SimpleDateFormat("yyyy-MM-dd");

            sdf.setLenient(false);

            Date date = sdf.parse(dateStr);

            // Register appointment
            String appointmentNumber =
                    service.registerAppointmentAndGetNumber(
                            name,
                            address,
                            contact,
                            dentist,
                            treatment,
                            date,
                            time
                    );

            // Success
            if (appointmentNumber != null) {

                System.out.println(
                        "✅ Appointment registered!"
                );

                System.out.println(
                        "📋 Appointment Number: "
                        + appointmentNumber
                );

                request.setAttribute(
                        "message",
                        "Appointment registered successfully!"
                );

                request.setAttribute(
                        "appointmentNumber",
                        appointmentNumber
                );

            } else {

                System.err.println(
                        "❌ Failed to register appointment!"
                );

                request.setAttribute(
                        "error",
                        "Failed to register appointment!"
                );
            }

        } catch (Exception e) {

            System.err.println(
                    "❌ Appointment registration error!"
            );

            System.err.println(
                    "Message: " + e.getMessage()
            );

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Error: " + e.getMessage()
            );
        }

        request.getRequestDispatcher("/register.jsp")
               .forward(request, response);
    }
}