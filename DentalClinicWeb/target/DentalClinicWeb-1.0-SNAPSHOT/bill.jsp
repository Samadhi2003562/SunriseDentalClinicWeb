<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dentalclinic.model.Bill"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental - Bill</title>
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
            background: radial-gradient(circle, rgba(255, 165, 0, 0.1), transparent 70%);
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
            max-width: 650px;
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

        .receipt-box {
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,200,100,0.06);
            border-radius: 16px;
            padding: 25px 30px;
            margin-top: 20px;
            border-left: 4px solid #f6a085;
            font-family: 'Courier New', monospace;
            white-space: pre-wrap;
            font-size: 14px;
            line-height: 1.6;
            color: rgba(255,255,255,0.8);
        }

        .action-buttons {
            display: flex;
            gap: 12px;
            margin-top: 15px;
            flex-wrap: wrap;
        }
        .action-buttons .btn {
            padding: 10px 22px;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            font-family: 'Inter', sans-serif;
            font-size: 13px;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #1a0f0a;
        }
        .btn-print {
            background: #48bb78;
        }
        .btn-print:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(72, 187, 120, 0.3);
        }
        .btn-txt {
            background: #4299e1;
        }
        .btn-txt:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(66, 153, 225, 0.3);
        }
        .btn-pdf {
            background: #fc8181;
        }
        .btn-pdf:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(252, 129, 129, 0.3);
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

        @media (max-width: 480px) {
            .container { padding: 25px 20px; }
            .search-box { flex-direction: column; }
            .header-section h1 { font-size: 22px; }
            .action-buttons { flex-direction: column; }
            .action-buttons .btn { justify-content: center; }
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
            <div class="icon-wrapper">💰</div>
            <h1>Generate <span>Bill</span></h1>
            <p class="subtitle">Enter appointment number to generate receipt</p>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %></div>
        <% } %>

        <form action="bill" method="post">
            <div class="search-box">
                <input type="text" name="appointmentNumber" placeholder="APT-XXXXXXXX" required>
                <button type="submit"><i class="fas fa-calculator"></i> Generate</button>
            </div>
        </form>

        <%
            String receipt = (String) request.getAttribute("receipt");
            Bill bill = (Bill) request.getAttribute("bill");
            if (receipt != null && bill != null) {
        %>
        <div class="receipt-box" id="receiptContent"><%= receipt %></div>
        <div class="action-buttons">
            <button onclick="window.print()" class="btn btn-print"><i class="fas fa-print"></i> Print</button>
            <button onclick="downloadReceipt()" class="btn btn-txt"><i class="fas fa-file-alt"></i> TXT</button>
            <a href="pdfbill?appointmentNumber=<%= bill.getAppointment().getAppointmentNumber() %>" class="btn btn-pdf"><i class="fas fa-file-pdf"></i> PDF</a>
        </div>
        <% } %>

        <div class="btn-group">
            <a href="dashboard.jsp" class="btn-secondary"><i class="fas fa-arrow-left"></i> Back to Menu</a>
        </div>
    </div>

    <script>
        function downloadReceipt() {
            var text = document.getElementById("receiptContent").innerText;
            var blob = new Blob([text], {type: "text/plain"});
            var link = document.createElement("a");
            link.href = URL.createObjectURL(blob);
            link.download = "receipt.txt";
            link.click();
        }
    </script>

</body>
</html>