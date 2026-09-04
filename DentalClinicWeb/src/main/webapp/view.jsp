<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dentalclinic.model.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="dentalclinic.service.AppointmentService"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental - View</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            background: #1a0f0a;
            background: linear-gradient(135deg, #1a0f0a 0%, #3d1f12 40%, #6b3a1f 70%, #8b4a28 100%);
            padding: 30px 20px;
            position: relative;
            overflow-x: hidden;
        }

        /* Sunrise Glow Effects */
        .sunrise-glow-1 {
            position: fixed;
            top: -200px;
            right: -200px;
            width: 600px;
            height: 600px;
            background: radial-gradient(circle, rgba(255, 165, 0, 0.12), transparent 70%);
            border-radius: 50%;
            pointer-events: none;
            z-index: 0;
            animation: pulseGlow 6s ease-in-out infinite;
        }
        .sunrise-glow-2 {
            position: fixed;
            bottom: -150px;
            left: -150px;
            width: 450px;
            height: 450px;
            background: radial-gradient(circle, rgba(255, 69, 0, 0.08), transparent 70%);
            border-radius: 50%;
            pointer-events: none;
            z-index: 0;
            animation: pulseGlow 8s ease-in-out infinite reverse;
        }
        @keyframes pulseGlow {
            0%, 100% { transform: scale(1); opacity: 0.6; }
            50% { transform: scale(1.2); opacity: 1; }
        }

        /* Floating Sun Particles */
        .sun-particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
            overflow: hidden;
        }
        .sun-particle {
            position: absolute;
            width: 3px;
            height: 3px;
            background: rgba(255, 200, 100, 0.1);
            border-radius: 50%;
            animation: floatParticle 14s infinite;
        }
        .sun-particle:nth-child(1) { top: 10%; left: 5%; animation-delay: 0s; }
        .sun-particle:nth-child(2) { top: 20%; left: 85%; animation-delay: 1.5s; }
        .sun-particle:nth-child(3) { top: 60%; left: 10%; animation-delay: 3s; }
        .sun-particle:nth-child(4) { top: 80%; left: 75%; animation-delay: 4.5s; }
        .sun-particle:nth-child(5) { top: 40%; left: 50%; animation-delay: 6s; }
        .sun-particle:nth-child(6) { top: 70%; left: 30%; animation-delay: 7.5s; }
        .sun-particle:nth-child(7) { top: 30%; left: 60%; animation-delay: 9s; }
        .sun-particle:nth-child(8) { top: 90%; left: 45%; animation-delay: 10.5s; }

        @keyframes floatParticle {
            0%, 100% { transform: translateY(0) translateX(0); opacity: 0.2; }
            25% { transform: translateY(-50px) translateX(30px); opacity: 0.8; }
            50% { transform: translateY(-100px) translateX(-30px); opacity: 0.2; }
            75% { transform: translateY(-50px) translateX(40px); opacity: 0.8; }
        }

        .container {
            position: relative;
            z-index: 1;
            max-width: 1000px;
            margin: 0 auto;
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255,200,100,0.08);
            border-radius: 28px;
            padding: 40px 45px;
            box-shadow: 0 30px 80px rgba(0,0,0,0.4);
            animation: fadeInUp 0.8s ease-out;
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .header-section {
            text-align: center;
            margin-bottom: 25px;
        }
        .header-section .icon-wrapper {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #f6a085, #f7c948);
            border-radius: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 12px;
            font-size: 28px;
            box-shadow: 0 10px 30px rgba(246, 160, 133, 0.2);
        }
        .header-section h1 {
            color: white;
            font-size: 26px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }
        .header-section h1 span {
            background: linear-gradient(135deg, #f6a085, #f7c948);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .header-section .subtitle {
            color: rgba(255,255,255,0.3);
            font-size: 14px;
            font-weight: 300;
        }

        .search-box {
            display: flex;
            gap: 12px;
            margin-bottom: 25px;
        }
        .search-box input {
            flex: 1;
            padding: 14px 18px;
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,200,100,0.08);
            border-radius: 12px;
            font-size: 14px;
            font-family: 'Inter', sans-serif;
            color: white;
            transition: all 0.3s ease;
        }
        .search-box input::placeholder {
            color: rgba(255,255,255,0.2);
        }
        .search-box input:focus {
            outline: none;
            border-color: #f6a085;
            background: rgba(255,255,255,0.08);
            box-shadow: 0 0 0 4px rgba(246, 160, 133, 0.08);
        }
        .search-box button {
            padding: 14px 30px;
            background: linear-gradient(135deg, #f6a085, #f7c948);
            color: #1a0f0a;
            border: none;
            border-radius: 12px;
            font-weight: 700;
            cursor: pointer;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s ease;
            white-space: nowrap;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .search-box button:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(246, 160, 133, 0.3);
        }

        .error {
            background: rgba(252, 129, 129, 0.12);
            border: 1px solid rgba(252, 129, 129, 0.12);
            color: #fc8181;
            padding: 12px 16px;
            border-radius: 12px;
            margin-bottom: 20px;
            text-align: center;
        }

        .detail-card {
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,200,100,0.06);
            border-radius: 16px;
            padding: 25px 30px;
            margin-top: 20px;
            border-left: 4px solid #f6a085;
        }
        .detail-card h3 {
            color: white;
            font-size: 18px;
            margin-bottom: 15px;
        }
        .detail-card h3 i {
            color: #f6a085;
            margin-right: 8px;
        }
        .detail-row {
            display: flex;
            padding: 8px 0;
            border-bottom: 1px solid rgba(255,255,255,0.05);
        }
        .detail-row:last-child {
            border-bottom: none;
        }
        .detail-row .label {
            font-weight: 600;
            color: rgba(255,255,255,0.5);
            width: 150px;
            flex-shrink: 0;
        }
        .detail-row .value {
            color: rgba(255,255,255,0.9);
        }
        .status-badge {
            display: inline-block;
            padding: 3px 16px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }
        .status-scheduled {
            background: rgba(246, 160, 133, 0.15);
            color: #f6a085;
        }
        .status-completed {
            background: rgba(72, 187, 120, 0.15);
            color: #48bb78;
        }
        .status-cancelled {
            background: rgba(252, 129, 129, 0.15);
            color: #fc8181;
        }

        /* Appointment List Table */
        .appointment-list {
            margin-top: 25px;
        }
        .appointment-list h3 {
            color: white;
            font-size: 18px;
            margin-bottom: 15px;
        }
        .appointment-list h3 i {
            color: #f6a085;
            margin-right: 8px;
        }
        .table-wrapper {
            overflow-x: auto;
            border-radius: 12px;
            border: 1px solid rgba(255,200,100,0.06);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            min-width: 600px;
        }
        thead {
            background: rgba(255,255,255,0.04);
        }
        thead th {
            padding: 14px 16px;
            text-align: left;
            color: rgba(255,255,255,0.5);
            font-weight: 600;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        tbody td {
            padding: 14px 16px;
            color: rgba(255,255,255,0.8);
            border-bottom: 1px solid rgba(255,255,255,0.04);
        }
        tbody tr:hover {
            background: rgba(255,255,255,0.03);
        }
        tbody tr:last-child td {
            border-bottom: none;
        }
        .table-status {
            display: inline-block;
            padding: 3px 14px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
        }
        .table-status.scheduled {
            background: rgba(246, 160, 133, 0.15);
            color: #f6a085;
        }
        .table-status.completed {
            background: rgba(72, 187, 120, 0.15);
            color: #48bb78;
        }
        .table-status.cancelled {
            background: rgba(252, 129, 129, 0.15);
            color: #fc8181;
        }
        .table-view-btn {
            padding: 4px 14px;
            background: rgba(246, 160, 133, 0.1);
            color: #f6a085;
            border: 1px solid rgba(246, 160, 133, 0.15);
            border-radius: 6px;
            cursor: pointer;
            font-size: 12px;
            font-weight: 600;
            transition: 0.3s;
            font-family: 'Inter', sans-serif;
        }
        .table-view-btn:hover {
            background: rgba(246, 160, 133, 0.2);
        }

        .no-appointments {
            text-align: center;
            padding: 40px 20px;
            color: rgba(255,255,255,0.3);
        }
        .no-appointments .big-icon {
            font-size: 48px;
            display: block;
            margin-bottom: 12px;
            opacity: 0.5;
        }

        .btn-group {
            margin-top: 25px;
        }
        .btn-secondary {
            padding: 12px 25px;
            background: rgba(255,255,255,0.05);
            color: rgba(255,255,255,0.5);
            border: 1px solid rgba(255,200,100,0.06);
            border-radius: 12px;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
            font-family: 'Inter', sans-serif;
            font-size: 14px;
            transition: all 0.3s;
        }
        .btn-secondary:hover {
            background: rgba(255,255,255,0.08);
            color: white;
            border-color: rgba(255,200,100,0.12);
        }

        @media (max-width: 768px) {
            .container { padding: 25px 20px; }
            .search-box { flex-direction: column; }
            .detail-row { flex-direction: column; padding: 6px 0; }
            .detail-row .label { width: auto; }
        }
        @media (max-width: 480px) {
            .container { padding: 20px 15px; }
            .header-section h1 { font-size: 22px; }
            table { font-size: 12px; min-width: 480px; }
            thead th, tbody td { padding: 10px 12px; }
        }
    </style>
</head>
<body>

    <!-- Sunrise Glows -->
    <div class="sunrise-glow-1"></div>
    <div class="sunrise-glow-2"></div>

    <!-- Floating Sun Particles -->
    <div class="sun-particles">
        <div class="sun-particle"></div>
        <div class="sun-particle"></div>
        <div class="sun-particle"></div>
        <div class="sun-particle"></div>
        <div class="sun-particle"></div>
        <div class="sun-particle"></div>
        <div class="sun-particle"></div>
        <div class="sun-particle"></div>
    </div>

    <div class="container">
        <div class="header-section">
            <div class="icon-wrapper">🔍</div>
            <h1>View <span>Appointment</span></h1>
            <p class="subtitle">Enter appointment number to view details</p>
        </div>

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
            // Get all appointments
            AppointmentService service = new AppointmentService();
            List<Appointment> appointments = service.getAllAppointments();
            
            // Check if search result exists
            Appointment appointment = (Appointment) request.getAttribute("appointment");
            
            if (appointment != null) {
        %>
        <div class="detail-card">
            <h3><i class="fas fa-file-medical"></i> Appointment Details</h3>
            <div class="detail-row">
                <span class="label">Number</span>
                <span class="value"><strong><%= appointment.getAppointmentNumber() %></strong></span>
            </div>
            <div class="detail-row">
                <span class="label">Patient Name</span>
                <span class="value"><%= appointment.getPatient().getName() %></span>
            </div>
            <div class="detail-row">
                <span class="label">Address</span>
                <span class="value"><%= appointment.getPatient().getAddress() %></span>
            </div>
            <div class="detail-row">
                <span class="label">Contact</span>
                <span class="value"><%= appointment.getPatient().getContactNumber() %></span>
            </div>
            <div class="detail-row">
                <span class="label">Dentist</span>
                <span class="value"><%= appointment.getDentistName() %></span>
            </div>
            <div class="detail-row">
                <span class="label">Treatment</span>
                <span class="value"><%= appointment.getTreatmentType() %></span>
            </div>
            <div class="detail-row">
                <span class="label">Date</span>
                <span class="value"><%= appointment.getAppointmentDate() %></span>
            </div>
            <div class="detail-row">
                <span class="label">Time</span>
                <span class="value"><%= appointment.getAppointmentTime() %></span>
            </div>
            <div class="detail-row">
                <span class="label">Status</span>
                <span class="value">
                    <span class="status-badge status-<%= appointment.getStatus().toLowerCase() %>">
                        <%= appointment.getStatus() %>
                    </span>
                </span>
            </div>
        </div>
        <% } %>

        <!-- All Appointments List -->
        <div class="appointment-list">
            <h3><i class="fas fa-list"></i> All Registered Appointments</h3>
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Appointment No</th>
                            <th>Patient</th>
                            <th>Treatment</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (appointments != null && !appointments.isEmpty()) {
                                int count = 1;
                                for (Appointment apt : appointments) {
                        %>
                        <tr>
                            <td><%= count++ %></td>
                            <td><strong><%= apt.getAppointmentNumber() %></strong></td>
                            <td><%= apt.getPatient().getName() %></td>
                            <td><%= apt.getTreatmentType() %></td>
                            <td><%= apt.getAppointmentDate() %></td>
                            <td>
                                <span class="table-status <%= apt.getStatus().toLowerCase() %>">
                                    <%= apt.getStatus() %>
                                </span>
                            </td>
                            <td>
                                <form action="view" method="post" style="display:inline;">
                                    <input type="hidden" name="appointmentNumber" value="<%= apt.getAppointmentNumber() %>">
                                    <button type="submit" class="table-view-btn">View</button>
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="7">
                                <div class="no-appointments">
                                    <span class="big-icon">📋</span>
                                    <p>No appointments registered yet.</p>
                                    <p style="font-size:12px;margin-top:4px;">Register a new appointment to see it here.</p>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="btn-group">
            <a href="dashboard.jsp" class="btn-secondary"><i class="fas fa-arrow-left"></i> Back to Menu</a>
        </div>
    </div>

</body>
</html>