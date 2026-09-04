<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental - Register</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #1a0f0a;
            background: linear-gradient(135deg, #1a0f0a 0%, #3d1f12 40%, #6b3a1f 70%, #8b4a28 100%);
            padding: 30px 20px;
            position: relative;
            overflow: hidden;
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
            max-width: 620px;
            width: 100%;
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255,200,100,0.08);
            border-radius: 28px;
            padding: 45px 40px;
            box-shadow: 0 30px 80px rgba(0,0,0,0.4);
            animation: fadeInUp 0.8s ease-out;
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .header-section {
            text-align: center;
            margin-bottom: 30px;
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
            margin-top: 2px;
        }

        .form-group {
            margin-bottom: 16px;
        }
        .form-group label {
            display: block;
            color: rgba(255,255,255,0.6);
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 5px;
            letter-spacing: 0.3px;
        }
        .form-group label i {
            color: #f6a085;
            margin-right: 6px;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 12px 16px;
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,200,100,0.08);
            border-radius: 12px;
            font-size: 14px;
            font-family: 'Inter', sans-serif;
            color: white;
            transition: all 0.3s ease;
        }
        .form-group input::placeholder {
            color: rgba(255,255,255,0.2);
        }
        .form-group input:focus, .form-group select:focus {
            outline: none;
            border-color: #f6a085;
            background: rgba(255,255,255,0.08);
            box-shadow: 0 0 0 4px rgba(246, 160, 133, 0.08);
        }
        .form-group select option {
            background: #2d1b0e;
            color: white;
        }

        .btn-primary {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #f6a085, #f7c948);
            color: #1a0f0a;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            font-family: 'Inter', sans-serif;
            margin-top: 4px;
            position: relative;
            overflow: hidden;
        }
        .btn-primary::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255,255,255,0.15), transparent);
            transform: rotate(45deg) translateX(-100%);
            transition: 0.6s;
        }
        .btn-primary:hover::before {
            transform: rotate(45deg) translateX(100%);
        }
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(246, 160, 133, 0.3);
        }
        .btn-primary:active { transform: translateY(0); }
        .btn-primary i { margin-right: 8px; }

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
        .btn-group {
            display: flex;
            gap: 12px;
            margin-top: 20px;
        }

        .message {
            padding: 14px 18px;
            border-radius: 12px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 500;
        }
        .success {
            background: rgba(72, 187, 120, 0.15);
            border: 1px solid rgba(72, 187, 120, 0.15);
            color: #48bb78;
        }
        .error {
            background: rgba(252, 129, 129, 0.12);
            border: 1px solid rgba(252, 129, 129, 0.12);
            color: #fc8181;
        }

        .appointment-number-box {
            background: rgba(246, 160, 133, 0.1);
            border: 1px solid rgba(246, 160, 133, 0.15);
            color: #f6a085;
            padding: 14px;
            border-radius: 10px;
            margin-top: 12px;
            font-size: 18px;
            font-weight: 700;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        .appointment-number-box button {
            padding: 4px 14px;
            border: none;
            border-radius: 6px;
            background: linear-gradient(135deg, #f6a085, #f7c948);
            color: #1a0f0a;
            cursor: pointer;
            font-weight: 600;
            font-size: 12px;
        }
        .appointment-number-box button:hover {
            transform: scale(1.05);
        }
        .appointment-hint {
            margin-top: 8px;
            font-size: 13px;
            color: rgba(246, 160, 133, 0.6);
            text-align: center;
        }

        @media (max-width: 480px) {
            .container { padding: 30px 20px; }
            .header-section h1 { font-size: 22px; }
            .btn-group { flex-direction: column; }
            .btn-secondary { text-align: center; }
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
            <div class="icon-wrapper">📝</div>
            <h1>Register <span>Appointment</span></h1>
            <p class="subtitle">Fill in the patient and appointment details</p>
        </div>

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
                <label><i class="fas fa-user"></i> Patient Name</label>
                <input type="text" name="patientName" placeholder="Enter full name" required>
            </div>
            <div class="form-group">
                <label><i class="fas fa-home"></i> Address</label>
                <input type="text" name="address" placeholder="Enter address">
            </div>
            <div class="form-group">
                <label><i class="fas fa-phone"></i> Contact Number</label>
                <input type="text" name="contact" placeholder="Enter phone number" required>
            </div>
            <div class="form-group">
                <label><i class="fas fa-user-md"></i> Dentist Name</label>
                <input type="text" name="dentistName" placeholder="Enter dentist name" required>
            </div>
            <div class="form-group">
                <label><i class="fas fa-pills"></i> Treatment Type</label>
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
                <label><i class="fas fa-calendar"></i> Date</label>
                <input type="date" name="appointmentDate" required>
            </div>
            <div class="form-group">
                <label><i class="fas fa-clock"></i> Time</label>
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