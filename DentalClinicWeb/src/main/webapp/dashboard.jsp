<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental - Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            font-family: 'Inter', sans-serif;
            background: #1a0f0a;
            background: linear-gradient(135deg, #1a0f0a 0%, #3d1f12 40%, #6b3a1f 70%, #8b4a28 100%);
            min-height: 100vh;
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
            background: rgba(255, 200, 100, 0.12);
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
        .sun-particle:nth-child(9) { top: 50%; left: 20%; animation-delay: 12s; }
        .sun-particle:nth-child(10) { top: 15%; left: 40%; animation-delay: 13.5s; }

        @keyframes floatParticle {
            0%, 100% { transform: translateY(0) translateX(0); opacity: 0.2; }
            25% { transform: translateY(-50px) translateX(30px); opacity: 0.8; }
            50% { transform: translateY(-100px) translateX(-30px); opacity: 0.2; }
            75% { transform: translateY(-50px) translateX(40px); opacity: 0.8; }
        }

        .dashboard {
            position: relative;
            z-index: 1;
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px 25px;
        }

        /* Header - Glassmorphism with Sunrise Theme */
        .header {
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255,200,100,0.08);
            border-radius: 24px;
            padding: 22px 30px;
            margin-bottom: 35px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 15px 40px rgba(0,0,0,0.3);
            animation: slideDown 0.6s ease-out;
        }
        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .header .brand {
            display: flex;
            align-items: center;
            gap: 14px;
        }
        .header .brand .logo-icon {
            width: 48px;
            height: 48px;
            background: linear-gradient(135deg, #f6a085, #f7c948);
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            box-shadow: 0 8px 25px rgba(246, 160, 133, 0.25);
        }
        .header .brand h1 {
            font-size: 24px;
            font-weight: 800;
            color: white;
            letter-spacing: -0.5px;
        }
        .header .brand h1 span {
            font-weight: 300;
            opacity: 0.5;
        }
        .header .brand .subtitle {
            font-size: 10px;
            color: rgba(255,200,100,0.3);
            letter-spacing: 2px;
            text-transform: uppercase;
            display: block;
            margin-top: -2px;
        }
        .header .user-section {
            display: flex;
            align-items: center;
            gap: 18px;
        }
        .header .user-section .avatar {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: linear-gradient(135deg, #f6a085, #f7c948);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #1a0f0a;
            font-weight: 700;
            font-size: 16px;
            box-shadow: 0 5px 15px rgba(246, 160, 133, 0.2);
        }
        .header .user-section .user-name {
            color: rgba(255,255,255,0.85);
            font-weight: 500;
            font-size: 14px;
        }
        .header .user-section .logout-btn {
            color: rgba(255,255,255,0.5);
            text-decoration: none;
            padding: 8px 20px;
            border-radius: 12px;
            background: rgba(255,255,255,0.05);
            font-size: 13px;
            font-weight: 500;
            transition: all 0.3s;
            border: 1px solid rgba(255,200,100,0.05);
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .header .user-section .logout-btn:hover {
            background: rgba(255,200,100,0.1);
            color: white;
            transform: translateY(-2px);
            border-color: rgba(255,200,100,0.15);
        }

        /* Stats Cards - Sunrise Theme */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 35px;
            animation: fadeInUp 0.8s ease-out;
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .stat-card {
            background: rgba(255,255,255,0.04);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255,200,100,0.06);
            border-radius: 18px;
            padding: 22px 24px;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
        }
        .stat-card::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(246, 160, 133, 0.06), transparent 70%);
            border-radius: 50%;
            transition: 0.5s;
        }
        .stat-card:hover::before {
            transform: scale(1.5);
        }
        .stat-card:hover {
            transform: translateY(-6px);
            border-color: rgba(246, 160, 133, 0.2);
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
        }
        .stat-card .stat-icon {
            font-size: 28px;
            margin-bottom: 8px;
            display: block;
        }
        .stat-card .stat-number {
            font-size: 30px;
            font-weight: 800;
            color: white;
            letter-spacing: -0.5px;
        }
        .stat-card .stat-label {
            color: rgba(255,255,255,0.4);
            font-size: 13px;
            font-weight: 400;
            margin-top: 2px;
        }
        .stat-card .stat-trend {
            font-size: 11px;
            color: #f6a085;
            margin-top: 6px;
            display: inline-block;
            background: rgba(246, 160, 133, 0.1);
            padding: 2px 12px;
            border-radius: 20px;
        }

        /* Menu Grid - Sunrise Theme */
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            animation: fadeInUp 1s ease-out;
        }
        .menu-card {
            background: rgba(255,255,255,0.04);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255,200,100,0.06);
            border-radius: 20px;
            padding: 28px 24px;
            text-decoration: none;
            color: white;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
            text-align: center;
        }
        .menu-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(246, 160, 133, 0.05), rgba(247, 201, 72, 0.05));
            opacity: 0;
            transition: 0.4s;
        }
        .menu-card:hover::before {
            opacity: 1;
        }
        .menu-card::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0%;
            height: 3px;
            background: linear-gradient(90deg, #f6a085, #f7c948);
            transition: 0.4s;
        }
        .menu-card:hover::after {
            width: 100%;
        }
        .menu-card:hover {
            transform: translateY(-8px);
            border-color: rgba(246, 160, 133, 0.15);
            box-shadow: 0 20px 50px rgba(0,0,0,0.3);
        }
        .menu-card .card-icon {
            font-size: 42px;
            display: block;
            margin-bottom: 12px;
            transition: 0.3s;
        }
        .menu-card:hover .card-icon {
            transform: scale(1.1) rotate(-5deg);
        }
        .menu-card h3 {
            font-size: 17px;
            font-weight: 700;
            color: white;
            margin-bottom: 4px;
        }
        .menu-card p {
            font-size: 13px;
            color: rgba(255,255,255,0.35);
            margin-bottom: 12px;
        }
        .menu-card .arrow {
            color: rgba(255,255,255,0.2);
            font-size: 14px;
            transition: 0.3s;
            display: inline-block;
        }
        .menu-card:hover .arrow {
            color: #f6a085;
            transform: translateX(5px);
        }
        .menu-card .card-number {
            position: absolute;
            top: 12px;
            right: 16px;
            font-size: 11px;
            color: rgba(255,200,100,0.06);
            font-weight: 800;
        }

        .menu-card.exit-card {
            border-color: rgba(229, 62, 62, 0.1);
        }
        .menu-card.exit-card:hover {
            border-color: rgba(229, 62, 62, 0.2);
        }
        .menu-card.exit-card .card-icon {
            color: #fc8181;
        }

        /* Responsive */
        @media (max-width: 992px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            .menu-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        @media (max-width: 600px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
            .menu-grid {
                grid-template-columns: 1fr;
            }
            .header {
                flex-direction: column;
                gap: 15px;
                text-align: center;
                padding: 20px;
            }
            .header .brand .logo-icon {
                width: 40px;
                height: 40px;
                font-size: 20px;
            }
            .header .brand h1 {
                font-size: 20px;
            }
            .header .user-section {
                flex-wrap: wrap;
                justify-content: center;
            }
            .stat-card .stat-number {
                font-size: 24px;
            }
        }
        @media (max-width: 400px) {
            .dashboard { padding: 15px 12px; }
            .header { padding: 15px; }
            .menu-card { padding: 20px 16px; }
            .menu-card .card-icon { font-size: 32px; }
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
        <div class="sun-particle"></div>
        <div class="sun-particle"></div>
    </div>

    <div class="dashboard">
        <!-- Header -->
        <header class="header">
            <div class="brand">
                <div class="logo-icon">🌅</div>
                <div>
                    <h1>Sunrise <span>Dental</span></h1>
                    <span class="subtitle">Your Smile, Our Sunrise</span>
                </div>
            </div>
            <div class="user-section">
                <div class="avatar"><%= session.getAttribute("username").toString().charAt(0) %></div>
                <span class="user-name">Welcome, <%= session.getAttribute("username") %></span>
                <a href="logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </header>

        <!-- Stats -->
        <div class="stats-grid">
            <div class="stat-card">
                <span class="stat-icon">📋</span>
                <div class="stat-number">0</div>
                <div class="stat-label">Total Appointments</div>
                <span class="stat-trend">+0% this month</span>
            </div>
            <div class="stat-card">
                <span class="stat-icon">👤</span>
                <div class="stat-number">0</div>
                <div class="stat-label">Total Patients</div>
                <span class="stat-trend">+0% this month</span>
            </div>
            <div class="stat-card">
                <span class="stat-icon">💰</span>
                <div class="stat-number">$0</div>
                <div class="stat-label">Revenue Today</div>
                <span class="stat-trend" style="color:#f7c948;">+0% this month</span>
            </div>
            <div class="stat-card">
                <span class="stat-icon">🦷</span>
                <div class="stat-number">0</div>
                <div class="stat-label">Treatments Done</div>
                <span class="stat-trend">+0% this month</span>
            </div>
        </div>

        <!-- Menu -->
        <div class="menu-grid">
            <a href="register.jsp" class="menu-card">
                <span class="card-number">01</span>
                <span class="card-icon">📝</span>
                <h3>Register Appointment</h3>
                <p>Add new patient appointment</p>
                <span class="arrow">→</span>
            </a>
            <a href="view.jsp" class="menu-card">
                <span class="card-number">02</span>
                <span class="card-icon">🔍</span>
                <h3>View Appointment</h3>
                <p>Search appointment details</p>
                <span class="arrow">→</span>
            </a>
            <a href="bill.jsp" class="menu-card">
                <span class="card-number">03</span>
                <span class="card-icon">💰</span>
                <h3>Generate Bill</h3>
                <p>Calculate and print receipt</p>
                <span class="arrow">→</span>
            </a>
            <a href="help.jsp" class="menu-card">
                <span class="card-number">04</span>
                <span class="card-icon">❓</span>
                <h3>Help Section</h3>
                <p>Step-by-step guide</p>
                <span class="arrow">→</span>
            </a>
            <a href="logout" class="menu-card exit-card">
                <span class="card-number">05</span>
                <span class="card-icon">🚪</span>
                <h3>Exit System</h3>
                <p>Close the application</p>
                <span class="arrow">→</span>
            </a>
        </div>
    </div>

</body>
</html>