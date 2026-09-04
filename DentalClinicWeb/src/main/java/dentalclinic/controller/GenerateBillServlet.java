package dentalclinic.controller;

import dentalclinic.model.Bill;
import dentalclinic.service.AppointmentService;
import dentalclinic.util.ValidationUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/bill")
public class GenerateBillServlet extends HttpServlet {

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

        String appointmentNumber =
                request.getParameter("appointmentNumber");

        // Validate appointment number
        if (!ValidationUtil.isValidAppointmentNumber(appointmentNumber)) {

            request.setAttribute(
                    "error",
                    "Invalid appointment number format!"
            );

            request.getRequestDispatcher(
                    "/bill.jsp"
            ).forward(request, response);

            return;
        }

        System.out.println(
                "🧾 Generating bill for: "
                + appointmentNumber
        );

        try {

            Bill bill =
                    service.generateBill(appointmentNumber);

            if (bill != null) {

                String receipt =
                        service.generateReceiptText(bill);

                request.setAttribute("bill", bill);
                request.setAttribute("receipt", receipt);

                System.out.println(
                        "✅ Bill generated successfully!"
                );

            } else {

                request.setAttribute(
                        "error",
                        "Appointment not found or no bill to generate!"
                );

                System.out.println(
                        "❌ Bill generation failed!"
                );
            }

        } catch (Exception e) {

            System.err.println(
                    "❌ Bill generation error: "
                    + e.getMessage()
            );

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Error generating bill: "
                    + e.getMessage()
            );
        }

        request.getRequestDispatcher(
                "/bill.jsp"
        ).forward(request, response);
    }
}