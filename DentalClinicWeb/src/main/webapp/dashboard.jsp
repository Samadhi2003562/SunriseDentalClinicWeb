<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental - Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: #f0ecf5; min-height: 100vh; }
        .dashboard { max-width: 1100px; margin: 0 auto; padding: 30px 20px; }
        .header {
            background: linear-gradient(135deg, #8B7DA6, #6B5D8A);
            padding: 25px 30px;
            border-radius: 18px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            box-shadow: 0 10px 30px rgba(139, 125, 166, 0.25);
        }
        .header .brand { display: flex; align-items: center; gap: 12px; }
        .header .brand h1 { font-size: 22px; font-weight: 800; }
        .header .brand h1 span { font-weight: 300; opacity: 0.7; }
        .header .user-section { display: flex; align-items: center; gap: 15px; }
        .header .user-section .avatar {
            width: 40px; height: 40px; border-radius: 50%;
            background: rgba(255,255,255,0.2);
            display: flex; align-items: center; justify-content: center;
            font-weight: 700; font-size: 16px;
        }
        .header .user-section .logout-btn {
            color: rgba(255,255,255,0.7);
            text-decoration: none; padding: 8px 18px;
            border-radius: 10px; background: rgba(255,255,255,0.1);
            font-size: 13px; font-weight: 500; transition: 0.3s;
        }
        .header .user-section .logout-btn:hover { background: rgba(255,255,255,0.2); color: white; }
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }
        .menu-card {
            background: white;
            padding: 25px 20px;
            border-radius: 16px;
            text-decoration: none;
            color: #2d1b0e;
            box-shadow: 0 2px 10px rgba(0,0,0,0.04);
            transition: all 0.3s;
            text-align: center;
        }
        .menu-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.1);
        }
        .menu-card .icon { font-size: 38px; margin-bottom: 10px; display: block; }
        .menu-card h3 { font-size: 16px; font-weight: 700; }
        .menu-card p { font-size: 13px; color: #aaa; margin-top: 3px; }
        .exit-card { background: #fff5f5; }
        .exit-card .icon { color: #e53e3e; }
        @media (max-width: 768px) {
            .menu-grid { grid-template-columns: 1fr; }
            .header { flex-direction: column; gap: 15px; text-align: center; }
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <header class="header">
            <div class="brand"><h1>🌅 Sunrise <span>Dental</span></h1></div>
            <div class="user-section">
                <div class="avatar"><%= session.getAttribute("username").toString().charAt(0) %></div>
                <span>Welcome, <%= session.getAttribute("username") %></span>
                <a href="logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </header>

        <div class="menu-grid">
            <a href="register.jsp" class="menu-card">
                <span class="icon">📝</span>
                <h3>Register Appointment</h3>
                <p>Add new patient appointment</p>
            </a>
            <a href="view.jsp" class="menu-card">
                <span class="icon">🔍</span>
                <h3>View Appointment</h3>
                <p>Search appointment details</p>
            </a>
            <a href="bill.jsp" class="menu-card">
                <span class="icon">💰</span>
                <h3>Generate Bill</h3>
                <p>Calculate and print receipt</p>
            </a>
            <a href="help.jsp" class="menu-card">
                <span class="icon">❓</span>
                <h3>Help Section</h3>
                <p>Step-by-step guide</p>
            </a>
            <a href="logout" class="menu-card exit-card">
                <span class="icon">🚪</span>
                <h3>Exit System</h3>
                <p>Close the application</p>
            </a>
        </div>
    </div>
</body>
</html>