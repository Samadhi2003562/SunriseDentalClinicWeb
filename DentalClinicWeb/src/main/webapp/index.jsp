<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental - Login</title>
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
            position: relative;
            overflow: hidden;
        }

        /* Sunrise Glow Effects */
        .sunrise-glow-1 {
            position: absolute;
            top: -200px;
            right: -200px;
            width: 600px;
            height: 600px;
            background: radial-gradient(circle, rgba(255, 165, 0, 0.15), transparent 70%);
            border-radius: 50%;
            animation: pulseGlow 6s ease-in-out infinite;
        }
        .sunrise-glow-2 {
            position: absolute;
            bottom: -150px;
            left: -150px;
            width: 450px;
            height: 450px;
            background: radial-gradient(circle, rgba(255, 69, 0, 0.1), transparent 70%);
            border-radius: 50%;
            animation: pulseGlow 8s ease-in-out infinite reverse;
        }
        .sunrise-glow-3 {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 800px;
            height: 800px;
            background: radial-gradient(circle, rgba(255, 200, 100, 0.03), transparent 70%);
            border-radius: 50%;
            pointer-events: none;
        }
        @keyframes pulseGlow {
            0%, 100% { transform: scale(1); opacity: 0.6; }
            50% { transform: scale(1.2); opacity: 1; }
        }

        /* Floating Sun Particles */
        .sun-particles {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
            pointer-events: none;
        }
        .sun-particle {
            position: absolute;
            width: 3px;
            height: 3px;
            background: rgba(255, 200, 100, 0.15);
            border-radius: 50%;
            animation: floatParticle 12s infinite;
        }
        .sun-particle:nth-child(1) { top: 10%; left: 15%; animation-delay: 0s; }
        .sun-particle:nth-child(2) { top: 25%; left: 80%; animation-delay: 1.5s; }
        .sun-particle:nth-child(3) { top: 60%; left: 10%; animation-delay: 3s; }
        .sun-particle:nth-child(4) { top: 75%; left: 85%; animation-delay: 4.5s; }
        .sun-particle:nth-child(5) { top: 40%; left: 50%; animation-delay: 6s; }
        .sun-particle:nth-child(6) { top: 85%; left: 25%; animation-delay: 7.5s; }
        .sun-particle:nth-child(7) { top: 15%; left: 50%; animation-delay: 9s; }
        .sun-particle:nth-child(8) { top: 50%; left: 75%; animation-delay: 10.5s; }

        @keyframes floatParticle {
            0%, 100% { transform: translateY(0) translateX(0); opacity: 0.2; }
            25% { transform: translateY(-50px) translateX(30px); opacity: 0.8; }
            50% { transform: translateY(-100px) translateX(-30px); opacity: 0.2; }
            75% { transform: translateY(-50px) translateX(40px); opacity: 0.8; }
        }

        /* Sun Icon Animation */
        .sun-icon {
            display: inline-block;
            animation: rotateSun 20s linear infinite;
        }
        @keyframes rotateSun {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .login-wrapper {
            position: relative;
            z-index: 10;
            width: 100%;
            max-width: 440px;
            padding: 20px;
        }

        .login-card {
            background: rgba(255,255,255,0.06);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255,200,100,0.12);
            border-radius: 28px;
            padding: 50px 40px;
            box-shadow: 0 30px 80px rgba(0,0,0,0.5);
            animation: fadeInUp 0.8s ease-out;
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .brand {
            text-align: center;
            margin-bottom: 35px;
        }
        .brand .icon-wrapper {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #f6a085, #f7c948);
            border-radius: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            font-size: 42px;
            box-shadow: 0 15px 40px rgba(246, 160, 133, 0.3);
            transition: transform 0.3s ease;
        }
        .brand .icon-wrapper:hover {
            transform: scale(1.05) rotate(-5deg);
        }
        .brand h1 {
            font-size: 30px;
            font-weight: 900;
            color: white;
            letter-spacing: -0.5px;
        }
        .brand h1 span {
            background: linear-gradient(135deg, #f6a085, #f7c948);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .brand .tagline {
            color: rgba(255,200,100,0.4);
            font-size: 11px;
            letter-spacing: 4px;
            text-transform: uppercase;
            margin-top: 2px;
        }
        .brand p {
            color: rgba(255,255,255,0.3);
            font-size: 13px;
            font-weight: 300;
            margin-top: 2px;
        }

        .form-group {
            margin-bottom: 18px;
        }
        .form-group label {
            display: block;
            color: rgba(255,255,255,0.6);
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 6px;
            letter-spacing: 0.3px;
        }
        .form-group .input-wrapper {
            position: relative;
        }
        .form-group .input-wrapper i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255,200,100,0.3);
            font-size: 16px;
        }
        .form-group input {
            width: 100%;
            padding: 14px 16px 14px 48px;
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,200,100,0.1);
            border-radius: 14px;
            font-size: 15px;
            font-family: 'Inter', sans-serif;
            color: white;
            transition: all 0.3s ease;
        }
        .form-group input::placeholder {
            color: rgba(255,255,255,0.2);
        }
        .form-group input:focus {
            outline: none;
            border-color: #f6a085;
            background: rgba(255,255,255,0.08);
            box-shadow: 0 0 0 4px rgba(246, 160, 133, 0.1);
        }

        .btn-login {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #f6a085, #f7c948);
            color: #1a0f0a;
            border: none;
            border-radius: 14px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            font-family: 'Inter', sans-serif;
            margin-top: 6px;
            position: relative;
            overflow: hidden;
        }
        .btn-login::before {
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
        .btn-login:hover::before {
            transform: rotate(45deg) translateX(100%);
        }
        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(246, 160, 133, 0.35);
        }
        .btn-login:active { transform: translateY(0); }
        .btn-login i { margin-right: 8px; }

        .error-message {
            background: rgba(252, 129, 129, 0.12);
            border: 1px solid rgba(252, 129, 129, 0.15);
            color: #fc8181;
            padding: 12px 16px;
            border-radius: 12px;
            margin-top: 16px;
            text-align: center;
            font-size: 14px;
            font-weight: 500;
        }

        .help-text {
            text-align: center;
            margin-top: 20px;
            color: rgba(255,255,255,0.2);
            font-size: 12px;
        }
        .help-text strong {
            color: rgba(255,255,255,0.5);
            font-weight: 600;
        }
        .help-text .divider { margin: 0 8px; opacity: 0.3; }

        .footer-text {
            text-align: center;
            margin-top: 25px;
            color: rgba(255,255,255,0.08);
            font-size: 11px;
            letter-spacing: 1px;
        }

        @media (max-width: 480px) {
            .login-card { padding: 35px 25px; }
            .brand h1 { font-size: 24px; }
            .brand .icon-wrapper { width: 64px; height: 64px; font-size: 32px; }
        }
    </style>
</head>
<body>

    <!-- Sunrise Glows -->
    <div class="sunrise-glow-1"></div>
    <div class="sunrise-glow-2"></div>
    <div class="sunrise-glow-3"></div>

    <!-- Floating Particles -->
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

    <div class="login-wrapper">
        <div class="login-card">
            <div class="brand">
                <div class="icon-wrapper">
                    <span class="sun-icon">🌅</span>
                </div>
                <h1>Sunrise <span>Dental</span></h1>
                <div class="tagline">Your Smile, Our Sunrise</div>
                <p>Clinic Management System</p>
            </div>

            <form action="login" method="post">
                <div class="form-group">
                    <label><i class="fas fa-user" style="margin-right:6px;color:#f6a085;"></i> Username</label>
                    <div class="input-wrapper">
                        <i class="fas fa-user"></i>
                        <input type="text" name="username" placeholder="Enter your username" required>
                    </div>
                </div>
                <div class="form-group">
                    <label><i class="fas fa-lock" style="margin-right:6px;color:#f6a085;"></i> Password</label>
                    <div class="input-wrapper">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="password" placeholder="Enter your password" required>
                    </div>
                </div>
                <button type="submit" class="btn-login">
                    <i class="fas fa-sign-in-alt"></i> Login
                </button>
            </form>

            <% if (request.getAttribute("error") != null) { %>
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <div class="help-text">
                <strong>admin</strong> / <strong>admin123</strong>
                <span class="divider">|</span>
                <strong>staff</strong> / <strong>staff123</strong>
            </div>
            <div class="footer-text">© 2024 Sunrise Dental • Secure Login</div>
        </div>
    </div>

</body>
</html>