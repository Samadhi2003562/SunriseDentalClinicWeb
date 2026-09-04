<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dentalclinic.model.Appointment"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental - View</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: #f0ecf5; padding: 30px 20px; }
        .container {
            max-width: 720px; margin: 0 auto; background: white;
            padding: 40px 45px; border-radius: 20px;
            box-shadow: 0 15px 50px rgba(0,0,0,0.08);
        }
        h1 { text-align: center; color: #2d1b0e; font-size: 26px; font-weight: 800; }
        .subtitle { text-align: center; color: #aaa; font-size: 14px; margin-bottom: 25px; }
        .search-box { display: flex; gap: 12px; margin-bottom: 20px; }
        .search-box input {
            flex: 1; padding: 14px 18px;
            border: 2px solid #e8e4ed; border-radius: 12px;
            font-size: 14px; font-family: 'Inter', sans-serif;
            transition: 0.3s; background: #faf8fc;
        }
        .search-box input:focus {
            outline: none; border-color: #8B7DA6;
            box-shadow: 0 0 0 4px rgba(139, 125, 166, 0.12);
        }
        .search-box button {
            padding: 14px 30px;
            background: linear-gradient(135deg, #8B7DA6, #6B5D8A);
            color: white; border: none; border-radius: 12px;
            font-weight: 700; cursor: pointer;
            font-family: 'Inter', sans-serif; transition: 0.3s;
            white-space: nowrap;
        }
        .search-box button:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(139, 125, 166, 0.3);
        }
        .error { background: #f8d7da; color: #721c24; padding: 12px 16px; border-radius: 12px; margin-bottom: 20px; text-align: center; }
        .detail-card {
            background: #faf8fc; border-radius: 16px;
            padding: 25px 30px; margin-top: 20px;
            border-left: 4px solid #8B7DA6;
        }
        .detail-card h3 { color: #2d1b0e; margin-bottom: 15px; }
        .detail-row {
            display: flex; padding: 8px 0;
            border-bottom: 1px solid #eee;
        }
        .detail-row:last-child { border-bottom: none; }
        .detail-row .label { font-weight: 600; color: #555; width: 150px; flex-shrink: 0; }
        .detail-row .value { color: #2d1b0e; }
        .status-badge {
            display: inline-block; padding: 3px 16px;
            border-radius: 20px; font-size: 12px; font-weight: 700;
        }
        .status-scheduled { background: #e8e4ed; color: #6B5D8A; }
        .status-completed { background: #d4edda; color: #155724; }
        .status-cancelled { background: #f8d7da; color: #721c24; }
        .btn-secondary {
            padding: 12px 25px; background: #e8e4ed;
            color: #555; border: none; border-radius: 12px;
            font-weight: 600; text-decoration: none; display: inline-block;
            font-family: 'Inter', sans-serif; font-size: 14px; transition: 0.3s;
        }
        .btn-secondary:hover { background: #d5cce3; }
        .btn-group { margin-top: 20px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🔍 View Appointment</h1>
        <p class="subtitle">Enter appointment number to view details</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %></div>
        <% } %>

        <form action="view" method="post">
            <div class="search-box">
                <input type="text" name="appointmentNumber" placeholder="APT-XXXXXXXX" required>
                <button type="submit"><i class="fas fa-search"></i> Search</button>
            </div>
        </form>

        <%
            Appointment appointment = (Appointment) request.getAttribute("appointment");
            if (appointment != null) {
        %>
        <div class="detail-card">
            <h3><i class="fas fa-file-medical" style="color:#8B7DA6;"></i> Appointment Details</h3>
            <div class="detail-row"><span class="label">Number</span><span class="value"><strong><%= appointment.getAppointmentNumber() %></strong></span></div>
            <div class="detail-row"><span class="label">Patient Name</span><span class="value"><%= appointment.getPatient().getName() %></span></div>
            <div class="detail-row"><span class="label">Address</span><span class="value"><%= appointment.getPatient().getAddress() %></span></div>
            <div class="detail-row"><span class="label">Contact</span><span class="value"><%= appointment.getPatient().getContactNumber() %></span></div>
            <div class="detail-row"><span class="label">Dentist</span><span class="value"><%= appointment.getDentistName() %></span></div>
            <div class="detail-row"><span class="label">Treatment</span><span class="value"><%= appointment.getTreatmentType() %></span></div>
            <div class="detail-row"><span class="label">Date</span><span class="value"><%= appointment.getAppointmentDate() %></span></div>
            <div class="detail-row"><span class="label">Time</span><span class="value"><%= appointment.getAppointmentTime() %></span></div>
            <div class="detail-row"><span class="label">Status</span>
                <span class="value">
                    <span class="status-badge status-<%= appointment.getStatus().toLowerCase() %>">
                        <%= appointment.getStatus() %>
                    </span>
                </span>
            </div>
        </div>
        <% } %>

        <div class="btn-group">
            <a href="dashboard.jsp" class="btn-secondary"><i class="fas fa-arrow-left"></i> Back to Menu</a>
        </div>
    </div>
</body>
</html>