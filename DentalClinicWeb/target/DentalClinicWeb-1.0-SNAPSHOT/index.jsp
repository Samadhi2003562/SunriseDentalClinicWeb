<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sunrise Dental Clinic Management - Login</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); height: 100vh; display: flex; justify-content: center; align-items: center; }
        .container { background: white; padding: 40px; border-radius: 10px; box-shadow: 0 10px 30px rgba(0,0,0,0.3); width: 400px; }
        h1 { text-align: center; color: #333; margin-bottom: 5px; }
        h2 { text-align: center; color: #666; font-size: 16px; margin-bottom: 30px; font-weight: normal; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; color: #555; font-weight: bold; }
        input { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px; }
        button { width: 100%; padding: 12px; background: #667eea; color: white; border: none; border-radius: 5px; font-size: 16px; cursor: pointer; font-weight: bold; }
        button:hover { background: #5a67d8; }
        .error-message { background: #f8d7da; color: #721c24; padding: 10px; border-radius: 5px; margin-top: 15px; text-align: center; }
        .help-text { text-align: center; margin-top: 15px; color: #888; font-size: 12px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>DENTAL CLINIC</h1>
        <h2>Management System</h2>
        
        <form action="login" method="post">
            <div class="form-group">
                <label>Username:</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message"><%= request.getAttribute("error") %></div>
        <% } %>
        
        <p class="help-text">Default: admin/admin123 or staff/staff123</p>
    </div>
</body>
</html>