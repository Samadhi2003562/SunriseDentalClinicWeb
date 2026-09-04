<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dental Clinic - Dashboard</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: #f4f4f9; height: 100vh; }
        .dashboard { max-width: 800px; margin: 0 auto; padding: 40px 20px; }
        header { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 20px; border-radius: 10px; margin-bottom: 30px; display: flex; justify-content: space-between; align-items: center; }
        header h1 { font-size: 24px; }
        .user-info { font-size: 14px; }
        .logout-btn { color: white; background: rgba(255,255,255,0.2); padding: 5px 15px; border-radius: 5px; text-decoration: none; margin-left: 15px; }
        .logout-btn:hover { background: rgba(255,255,255,0.3); }
        .menu { display: grid; grid-template-columns: 1fr; gap: 15px; }
        .menu a { display: block; padding: 20px; background: white; color: #333; text-decoration: none; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); font-size: 18px; font-weight: bold; transition: all 0.3s; }
        .menu a:hover { transform: translateX(10px); box-shadow: 0 5px 15px rgba(0,0,0,0.2); background: #667eea; color: white; }
        .exit-btn { background: #f8d7da !important; color: #721c24 !important; }
        .exit-btn:hover { background: #f5c6cb !important; color: #721c24 !important; transform: translateX(10px); }
    </style>
</head>
<body>
    <div class="dashboard">
        <header>
            <h1>🦷 DENTAL CLINIC</h1>
            <div class="user-info">
                Welcome, <%= session.getAttribute("username") %>!
                <a href="logout" class="logout-btn">Logout</a>
            </div>
        </header>
        
        <nav class="menu">
            <a href="register.jsp">📝 1. Register New Appointment</a>
            <a href="view.jsp">🔍 2. View Appointment Details</a>
            <a href="bill.jsp">💰 3. Calculate and Print Bill</a>
            <a href="help.jsp">❓ 4. Help Section</a>
            <a href="logout" class="exit-btn">🚪 5. Exit System</a>
        </nav>
    </div>
</body>
</html>