<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental - Register</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: #f0ecf5; padding: 30px 20px; }
        .container {
            max-width: 620px; margin: 0 auto; background: white;
            padding: 40px 45px; border-radius: 20px;
            box-shadow: 0 15px 50px rgba(0,0,0,0.08);
        }
        h1 { text-align: center; color: #2d1b0e; font-size: 26px; font-weight: 800; }
        .subtitle { text-align: center; color: #aaa; font-size: 14px; margin-bottom: 25px; }
        .form-group { margin-bottom: 16px; }
        .form-group label {
            display: block; font-weight: 600; color: #555;
            margin-bottom: 5px; font-size: 13px;
        }
        .form-group input, .form-group select {
            width: 100%; padding: 12px 16px;
            border: 2px solid #e8e4ed; border-radius: 12px;
            font-size: 14px; font-family: 'Inter', sans-serif;
            transition: 0.3s; background: #faf8fc;
        }
        .form-group input:focus, .form-group select:focus {
            outline: none; border-color: #8B7DA6;
            box-shadow: 0 0 0 4px rgba(139, 125, 166, 0.12);
        }
        .btn-primary {
            width: 100%; padding: 14px;
            background: linear-gradient(135deg, #8B7DA6, #6B5D8A);
            color: white; border: none; border-radius: 12px;
            font-size: 16px; font-weight: 700; cursor: pointer;
            transition: 0.3s; font-family: 'Inter', sans-serif;
        }
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(139, 125, 166, 0.35);
        }
        .btn-secondary {
            padding: 12px 25px; background: #e8e4ed;
            color: #555; border: none; border-radius: 12px;
            font-weight: 600; text-decoration: none; display: inline-block;
            font-family: 'Inter', sans-serif; font-size: 14px; transition: 0.3s;
        }
        .btn-secondary:hover { background: #d5cce3; }
        .btn-group { display: flex; gap: 12px; margin-top: 20px; }
        .message {
            padding: 14px 18px; border-radius: 12px;
            margin-bottom: 20px; text-align: center; font-weight: 500;
        }
        .success { background: #d4edda; color: #155724; }
        .error { background: #f8d7da; color: #721c24; }
        .appointment-number-box {
            background: #e8e4ed; color: #6B5D8A;
            padding: 14px; border-radius: 10px; margin-top: 12px;
            font-size: 18px; font-weight: 700;
            border: 2px dashed #8B7DA6;
            display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap;
        }
        .appointment-number-box button {
            padding: 4px 14px; border: none; border-radius: 6px;
            background: #8B7DA6; color: white; cursor: pointer;
            font-weight: 600; font-size: 12px;
        }
        .appointment-number-box button:hover { background: #6B5D8A; }
        .appointment-hint {
            margin-top: 8px; font-size: 13px; color: #6B5D8A; text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📝 Register Appointment</h1>
        <p class="subtitle">Fill in the patient and appointment details</p>

        <% if (request.getAttribute("message") != null) { %>
            <div class="message success">
                <i class="fas fa-check-circle"></i> <%= request.getAttribute("message") %>
                <% if (request.getAttribute("appointmentNumber") != null) { %>
                    <div class="appointment-number-box">
                        <span>📋 <span id="apptNum"><%= request.getAttribute("appointmentNumber") %></span></span>
                        <button onclick="copyApptNumber()">📄 Copy</button>
                    </div>
                    <div class="appointment-hint">💡 Copy this number to view appointment and generate bill</div>
                <% } %>
            </div>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
            <div class="message error"><i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %></div>
        <% } %>

        <form action="register" method="post">
            <div class="form-group">
                <label><i class="fas fa-user" style="color:#8B7DA6;"></i> Patient Name</label>
                <input type="text" name="patientName" placeholder="Enter full name" required>
            </div>
            <div class="form-group">
                <label><i class="fas fa-home" style="color:#8B7DA6;"></i> Address</label>
                <input type="text" name="address" placeholder="Enter address">
            </div>
            <div class="form-group">
                <label><i class="fas fa-phone" style="color:#8B7DA6;"></i> Contact Number</label>
                <input type="text" name="contact" placeholder="Enter phone number" required>
            </div>
            <div class="form-group">
                <label><i class="fas fa-user-md" style="color:#8B7DA6;"></i> Dentist Name</label>
                <input type="text" name="dentistName" placeholder="Enter dentist name" required>
            </div>
            <div class="form-group">
                <label><i class="fas fa-pills" style="color:#8B7DA6;"></i> Treatment Type</label>
                <select name="treatmentType" required>
                    <option value="">Select Treatment</option>
                    <option value="Cleaning">🧹 Cleaning</option>
                    <option value="Filling">🦷 Filling</option>
                    <option value="Root Canal">🦷 Root Canal</option>
                    <option value="Crown">👑 Crown</option>
                    <option value="Extraction">🔧 Extraction</option>
                    <option value="Whitening">✨ Whitening</option>
                </select>
            </div>
            <div class="form-group">
                <label><i class="fas fa-calendar" style="color:#8B7DA6;"></i> Date</label>
                <input type="date" name="appointmentDate" required>
            </div>
            <div class="form-group">
                <label><i class="fas fa-clock" style="color:#8B7DA6;"></i> Time</label>
                <input type="time" name="appointmentTime" required>
            </div>
            <button type="submit" class="btn-primary"><i class="fas fa-check-circle"></i> Register Appointment</button>
        </form>

        <div class="btn-group">
            <a href="dashboard.jsp" class="btn-secondary"><i class="fas fa-arrow-left"></i> Back to Menu</a>
        </div>
    </div>
    <script>
        function copyApptNumber() {
            var text = document.getElementById("apptNum").innerText;
            navigator.clipboard.writeText(text).then(function() {
                alert("📋 Appointment number copied: " + text);
            });
        }
    </script>
</body>
</html>