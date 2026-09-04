<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Help Section</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: #f4f4f9; padding: 20px; }
        .container { max-width: 700px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h1 { color: #333; margin-bottom: 20px; text-align: center; }
        h2 { color: #667eea; margin: 20px 0 10px 0; }
        .step { background: #f8f9fa; padding: 15px; border-radius: 5px; margin-bottom: 15px; border-left: 4px solid #667eea; }
        .step-number { display: inline-block; background: #667eea; color: white; padding: 2px 10px; border-radius: 3px; font-size: 14px; font-weight: bold; margin-bottom: 5px; }
        .step p { margin: 5px 0; color: #555; }
        .btn { padding: 12px 25px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; font-weight: bold; background: #6c757d; color: white; text-decoration: none; display: inline-block; margin-top: 20px; }
        .btn:hover { background: #5a6268; }
        .note { background: #fff3cd; padding: 15px; border-radius: 5px; margin-top: 20px; border-left: 4px solid #ffc107; }
    </style>
</head>
<body>
    <div class="container">
        <h1>❓ Help Section</h1>
        <p style="text-align: center; color: #666; margin-bottom: 20px;">Step-by-step guide for new staff</p>
        
        <div class="step">
            <div class="step-number">Step 1</div>
            <h3>Login to the System</h3>
            <p>Enter your username and password on the login page.</p>
            <p><strong>Default credentials:</strong> admin/admin123 or staff/staff123</p>
        </div>
        
        <div class="step">
            <div class="step-number">Step 2</div>
            <h3>Register a New Appointment</h3>
            <p>Click on "Register New Appointment" from the main menu.</p>
            <p>Fill in all patient details (name, address, contact).</p>
            <p>Select the dentist, treatment type, and choose date/time.</p>
            <p>Click "Register Appointment" to save.</p>
        </div>
        
        <div class="step">
            <div class="step-number">Step 3</div>
            <h3>View Appointment Details</h3>
            <p>Click on "View Appointment Details" from the main menu.</p>
            <p>Enter the appointment number (e.g., APT-XXXXXXXX).</p>
            <p>Click "Search" to see all patient and appointment information.</p>
        </div>
        
        <div class="step">
            <div class="step-number">Step 4</div>
            <h3>Generate Bill</h3>
            <p>Click on "Calculate and Print Bill" from the main menu.</p>
            <p>Enter the appointment number.</p>
            <p>The system will calculate treatment cost + consultation fee.</p>
            <p>The receipt will be displayed for printing.</p>
        </div>
        
        <div class="step">
            <div class="step-number">Step 5</div>
            <h3>Exit the System</h3>
            <p>Click "Exit System" from the main menu.</p>
            <p>Confirm that you want to exit.</p>
            <p>The application will close safely.</p>
        </div>
        
        <div class="note">
            <strong>💡 Tip:</strong> Always log out after use by clicking the "Logout" button.
        </div>
        
        <a href="dashboard.jsp" class="btn">Back to Menu</a>
    </div>
</body>
</html>