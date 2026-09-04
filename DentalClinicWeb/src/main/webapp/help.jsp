<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental - Help</title>
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
            max-width: 850px;
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
            font-size: 28px;
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

        .step {
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,200,100,0.06);
            border-radius: 16px;
            padding: 20px 24px;
            margin-bottom: 16px;
            border-left: 4px solid #f6a085;
            transition: all 0.3s ease;
        }
        .step:hover {
            background: rgba(255,255,255,0.07);
            transform: translateX(6px);
            border-color: rgba(255,200,100,0.15);
        }
        .step-number {
            display: inline-block;
            background: linear-gradient(135deg, #f6a085, #f7c948);
            color: #1a0f0a;
            padding: 2px 14px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
            margin-bottom: 4px;
        }
        .step h3 {
            color: white;
            font-size: 17px;
            font-weight: 700;
            margin-bottom: 3px;
        }
        .step h3 i {
            color: #f6a085;
            margin-right: 8px;
        }
        .step p {
            color: rgba(255,255,255,0.65);
            font-size: 14px;
            line-height: 1.6;
            margin: 2px 0;
        }
        .step .highlight {
            color: #f6a085;
            font-weight: 600;
        }

        .tip {
            background: rgba(255, 200, 100, 0.06);
            border: 1px solid rgba(255, 200, 100, 0.1);
            border-radius: 16px;
            padding: 16px 22px;
            margin-top: 20px;
            border-left: 4px solid #f7c948;
        }
        .tip strong {
            color: #f7c948;
        }
        .tip p {
            color: rgba(255,255,255,0.6);
            font-size: 14px;
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
            .header-section h1 { font-size: 24px; }
            .step { padding: 16px 18px; }
            .step h3 { font-size: 15px; }
            .step p { font-size: 13px; }
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
            <div class="icon-wrapper">❓</div>
            <h1>Help <span>Section</span></h1>
            <p class="subtitle">Step-by-step guide for new staff</p>
        </div>

        <div class="step">
            <span class="step-number">Step 1</span>
            <h3><i class="fas fa-lock"></i> Login to the System</h3>
            <p>Enter your <span class="highlight">username</span> and <span class="highlight">password</span> on the login page.</p>
            <p><strong style="color:rgba(255,255,255,0.7);">Default credentials:</strong> <span class="highlight">admin</span> / <span class="highlight">admin123</span> or <span class="highlight">staff</span> / <span class="highlight">staff123</span></p>
        </div>

        <div class="step">
            <span class="step-number">Step 2</span>
            <h3><i class="fas fa-pen"></i> Register a New Appointment</h3>
            <p>Click on <span class="highlight">"Register New Appointment"</span> from the main menu.</p>
            <p>Fill in all patient details (name, address, contact).</p>
            <p>Select the <span class="highlight">dentist</span>, <span class="highlight">treatment type</span>, and choose <span class="highlight">date/time</span>.</p>
            <p>Click <span class="highlight">"Register Appointment"</span> to save.</p>
        </div>

        <div class="step">
            <span class="step-number">Step 3</span>
            <h3><i class="fas fa-search"></i> View Appointment Details</h3>
            <p>Click on <span class="highlight">"View Appointment Details"</span> from the main menu.</p>
            <p>Enter the <span class="highlight">appointment number</span> (e.g., APT-XXXXXXXX).</p>
            <p>Click <span class="highlight">"Search"</span> to see all patient and appointment information.</p>
        </div>

        <div class="step">
            <span class="step-number">Step 4</span>
            <h3><i class="fas fa-file-invoice-dollar"></i> Generate Bill</h3>
            <p>Click on <span class="highlight">"Generate Bill"</span> from the main menu.</p>
            <p>Enter the <span class="highlight">appointment number</span>.</p>
            <p>The system will calculate treatment cost + consultation fee.</p>
            <p>The <span class="highlight">receipt</span> will be displayed for printing or PDF download.</p>
        </div>

        <div class="step">
            <span class="step-number">Step 5</span>
            <h3><i class="fas fa-sign-out-alt"></i> Exit the System</h3>
            <p>Click <span class="highlight">"Exit System"</span> from the main menu.</p>
            <p>Confirm that you want to exit.</p>
            <p>The application will close safely.</p>
        </div>

        <div class="tip">
            <p>💡 <strong>Tip:</strong> Always log out after use by clicking the <strong>"Logout"</strong> button.</p>
        </div>

        <div class="btn-group">
            <a href="dashboard.jsp" class="btn-secondary"><i class="fas fa-arrow-left"></i> Back to Menu</a>
        </div>
    </div>

</body>
</html>