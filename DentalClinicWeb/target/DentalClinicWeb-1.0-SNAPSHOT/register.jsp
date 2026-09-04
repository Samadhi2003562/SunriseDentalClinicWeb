<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Appointment</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: #f4f4f9; padding: 20px; }
        .container { max-width: 600px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h1 { color: #333; margin-bottom: 20px; text-align: center; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; color: #555; font-weight: bold; }
        input, select { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px; }
        .btn-group { display: flex; gap: 10px; margin-top: 20px; }
        .btn { padding: 12px 25px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; font-weight: bold; }
        .btn-primary { background: #667eea; color: white; }
        .btn-primary:hover { background: #5a67d8; }
        .btn-secondary { background: #6c757d; color: white; }
        .btn-secondary:hover { background: #5a6268; }
        .message { padding: 15px; border-radius: 5px; margin-bottom: 20px; text-align: center; }
        .success { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .error { background: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        .appointment-number-box {
            background: #cce5ff;
            color: #004085;
            padding: 15px;
            border-radius: 5px;
            margin-top: 10px;
            font-size: 18px;
            font-weight: bold;
            border: 2px dashed #004085;
        }
        .appointment-hint {
            margin-top: 10px;
            font-size: 14px;
            color: #004085;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📝 Register New Appointment</h1>
        
        <!-- MESSAGE DISPLAY - FIXED JSP SYNTAX -->
        <% if (request.getAttribute("message") != null) { %>
            <div class="message success">
                <%= request.getAttribute("message") %>
                
                <% if (request.getAttribute("appointmentNumber") != null) { %>
                    <div class="appointment-number-box">
                        📋 Appointment Number: <%= request.getAttribute("appointmentNumber") %>
                    </div>
                    <div class="appointment-hint">
                        💡 Please copy this number to view appointment and generate bill!
                    </div>
                <% } %>
            </div>
        <% } %>
        
        <!-- ERROR DISPLAY -->
        <% if (request.getAttribute("error") != null) { %>
            <div class="message error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <!-- REGISTRATION FORM -->
        <form action="register" method="post">
            <div class="form-group">
                <label>Patient Name:</label>
                <input type="text" name="patientName" required>
            </div>
            <div class="form-group">
                <label>Address:</label>
                <input type="text" name="address">
            </div>
            <div class="form-group">
                <label>Contact Number:</label>
                <input type="text" name="contact" required>
            </div>
            <div class="form-group">
                <label>Dentist Name:</label>
                <input type="text" name="dentistName" required>
            </div>
            <div class="form-group">
                <label>Treatment Type:</label>
                <select name="treatmentType" required>
                    <option value="">Select Treatment</option>
                    <option value="Cleaning">Cleaning</option>
                    <option value="Filling">Filling</option>
                    <option value="Root Canal">Root Canal</option>
                    <option value="Crown">Crown</option>
                    <option value="Extraction">Extraction</option>
                    <option value="Whitening">Whitening</option>
                </select>
            </div>
            <div class="form-group">
                <label>Date (YYYY-MM-DD):</label>
                <input type="date" name="appointmentDate" required>
            </div>
            <div class="form-group">
                <label>Time (HH:MM):</label>
                <input type="time" name="appointmentTime" required>
            </div>
            
            <button type="submit" class="btn btn-primary" style="width:100%;">Register Appointment</button>
        </form>
        
        <div class="btn-group">
            <a href="dashboard.jsp" class="btn btn-secondary">Back to Menu</a>
        </div>
    </div>
</body>
</html>