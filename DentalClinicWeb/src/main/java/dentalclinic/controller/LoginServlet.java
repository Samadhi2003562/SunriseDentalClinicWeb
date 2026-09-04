package dentalclinic.controller;

import dentalclinic.dao.UserDAO;
import dentalclinic.model.User;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get login details
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Remove unnecessary spaces
        if (username != null) {
            username = username.trim();
        }

        // Validate input
        if (username == null || username.isEmpty()
                || password == null || password.isEmpty()) {

            request.setAttribute(
                    "error",
                    "Please enter username and password!"
            );

            request.getRequestDispatcher("/index.jsp")
                   .forward(request, response);

            return;
        }

        // Validate user from database
        User user = userDAO.validateUser(username, password);

        if (user != null) {

            // Create session
            HttpSession session = request.getSession(true);

            // Store logged-in user
            session.setAttribute("user", user);
            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRole());

            System.out.println(
                    "✅ Login successful: " + user.getUsername()
            );

            // Go to dashboard
            response.sendRedirect(
                    request.getContextPath() + "/dashboard.jsp"
            );

        } else {

            System.out.println(
                    "❌ Login failed for: " + username
            );

            request.setAttribute(
                    "error",
                    "Invalid username or password!"
            );

            request.getRequestDispatcher("/index.jsp")
                   .forward(request, response);
        }
    }
}