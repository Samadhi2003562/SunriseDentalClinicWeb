<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental Clinic - Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #f0ecf5 0%, #e4dcee 50%, #d5cce3 100%);
        }
        .login-card {
            background: white;
            padding: 45px 40px;
            border-radius: 20px;
            box-shadow: 0 15px 50px rgba(0,0,0,0.1);
            width: 420px;
            max-width: 90%;
        }
        .login-card h1 {
            text-align: center;
            color: #2d1b0e;
            font-size: 30px;
            font-weight: 800;
        }
        .login-card h1 span {
            background: linear-gradient(135deg, #8B7DA6, #6B5D8A);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .login-card .tagline {
            text-align: center;
            color: rgba(60, 40, 80, 0.35);
            font-size: 11px;
            letter-spacing: 3px;
            text-transform: uppercase;
            margin-top: 2px;
        }
        .login-card p {
            text-align: center;
            color: #888;
            font-size: 14px;
            margin-bottom: 25px;
        }
        .form-group { margin-bottom: 18px; }
        .form-group label {
            display: block;
            font-weight: 600;
            color: #555;
            margin-bottom: 6px;
            font-size: 13px;
        }
        .form-group input {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid #e8e4ed;
            border-radius: 12px;
            font-size: 14px;
            font-family: 'Inter', sans-serif;
            transition: 0.3s;
            background: #faf8fc;
        }
        .form-group input:focus {
            outline: none;
            border-color: #8B7DA6;
            box-shadow: 0 0 0 4px rgba(139, 125, 166, 0.12);
            background: white;
        }
        .btn-login {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #8B7DA6, #6B5D8A);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s;
            font-family: 'Inter', sans-serif;
        }
        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(139, 125, 166, 0.35);
        }
        .error-message {
            background: #f8d7da;
            color: #721c24;
            padding: 12px;
            border-radius: 10px;
            margin-top: 15px;
            text-align: center;
        }
        .help-text {
            text-align: center;
            margin-top: 18px;
            font-size: 12px;
            color: #aaa;
        }
        .help-text strong { color: #666; }
        .footer-text {
            text-align: center;
            margin-top: 20px;
            font-size: 11px;
            color: #ccc;
            letter-spacing: 0.5px;
        }
    </style>
</head>
<body>
    <div class="login-card">
        <h1>Sunrise <span>Dental</span></h1>
        <div class="tagline">Your Smile, Our Sunrise</div>
        <p>Clinic Management System</p>

        <form action="login" method="post">
            <div class="form-group">
                <label><i class="fas fa-user" style="color:#8B7DA6;margin-right:6px;"></i> Username</label>
                <input type="text" name="username" placeholder="Enter your username" required>
            </div>
            <div class="form-group">
                <label><i class="fas fa-lock" style="color:#8B7DA6;margin-right:6px;"></i> Password</label>
                <input type="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn-login"><i class="fas fa-sign-in-alt"></i> Login</button>
        </form>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message"><i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %></div>
        <% } %>

        <div class="help-text">
            <strong>admin</strong> / admin123 &nbsp;|&nbsp; <strong>staff</strong> / staff123
        </div>
        <div class="footer-text">© 2024 Sunrise Dental • Secure Login</div>
    </div>
</body>
</html>