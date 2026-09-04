<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dentalclinic.model.Bill"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate Bill</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: #f4f4f9; padding: 20px; }
        .container { max-width: 600px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h1 { color: #333; margin-bottom: 20px; text-align: center; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; color: #555; font-weight: bold; }
        input { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px; }
        .btn-group { display: flex; gap: 10px; margin-top: 20px; }
        .btn { padding: 12px 25px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; font-weight: bold; }
        .btn-primary { background: #667eea; color: white; }
        .btn-primary:hover { background: #5a67d8; }
        .btn-secondary { background: #6c757d; color: white; }
        .btn-secondary:hover { background: #5a6268; }
        .error { background: #f8d7da; color: #721c24; padding: 10px; border-radius: 5px; margin-bottom: 20px; text-align: center; }
        .receipt { background: #f8f9fa; padding: 20px; border-radius: 5px; margin-top: 20px; font-family: monospace; white-space: pre-wrap; border: 2px dashed #ddd; }
    </style>
</head>
<body>
    <div class="container">
        <h1>💰 Generate Bill</h1>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>
        
        <form action="bill" method="post">
            <div class="form-group">
                <label>Appointment Number:</label>
                <input type="text" name="appointmentNumber" placeholder="APT-XXXXXXXX" required>
            </div>
            <button type="submit" class="btn btn-primary">Generate Bill</button>
        </form>
        
        <%
            String receipt = (String) request.getAttribute("receipt");
            if (receipt != null) {
        %>
        <div class="receipt"><%= receipt %></div>
        <% } %>
        
        <div class="btn-group">
            <a href="dashboard.jsp" class="btn btn-secondary">Back to Menu</a>
        </div>
    </div>
</body>
</html>