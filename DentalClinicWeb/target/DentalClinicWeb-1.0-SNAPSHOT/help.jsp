<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental - Help</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: #f0ecf5; padding: 30px 20px; }
        .container {
            max-width: 800px; margin: 0 auto; background: white;
            padding: 40px 45px; border-radius: 20px;
            box-shadow: 0 15px 50px rgba(0,0,0,0.08);
        }
        h1 { text-align: center; color: #2d1b0e; font-size: 28px; font-weight: 800; }
        .subtitle { text-align: center; color: #aaa; font-size: 14px; margin-bottom: 25px; }
        .step {
            background: #faf8fc; padding: 18px 22px; border-radius: 12px;
            margin-bottom: 14px; border-left: 4px solid #8B7DA6;
            transition: 0.3s;
        }
        .step:hover {
            background: #f0ecf5; transform: translateX(5px);
        }
        .step-number {
            display: inline-block; background: #8B7DA6; color: white;
            padding: 2px 14px; border-radius: 20px; font-size: 11px; font-weight: 700;
            margin-bottom: 4px;
        }
        .step h3 { color: #2d1b0e; font-size: 16px; }
        .step p { color: #555; font-size: 14px; line-height: 1.6; }
        .highlight { color: #8B7DA6; font-weight: 600; }
        .tip {
            background: #fff3cd; padding: 16px 20px; border-radius: 12px;
            margin-top: 20px; border-left: 4px solid #ffc107;
        }
        .btn-secondary {
            padding: 12px 30px; background: #e8e4ed;
            color: #555; border: none; border-radius: 12px;
            font-weight: 600; text-decoration: none; display: inline-block;
            font-family: 'Inter', sans-serif; font-size: 14px; transition: 0.3s;
            margin-top: 20px;
        }
        .btn-secondary:hover { background: #d5cce3; }
    </style>
</head>
<body>
    <div class="container">
        <h1>❓ Help Section</h1>
        <p class="subtitle">Step-by-step guide for new staff</p>

        <div class="step">
            <span class="step-number">Step 1</span>
            <h3><i class="fas fa-lock" style="color:#8B7DA6;"></i> Login to the System</h3>
            <p>Enter your <span class="highlight">username</span> and <span class="highlight">password</span> on the login page.</p>
            <p><strong>Default credentials:</strong> <span class="highlight">admin</span> / <span class="highlight">admin123</span> or <span class="highlight">staff</span> / <span class="highlight">staff123</span></p>
        </div>

        <div class="step">
            <span class="step-number">Step 2</span>
            <h3><i class="fas fa-pen" style="color:#8B7DA6;"></i> Register a New Appointment</h3>
            <p>Click on <span class="highlight">"Register New Appointment"</span> from the main menu.</p>
            <p>Fill in all patient details (name, address, contact).</p>
            <p>Select the <span class="highlight">dentist</span>, <span class="highlight">treatment type</span>, and choose <span class="highlight">date/time</span>.</p>
            <p>Click <span class="highlight">"Register Appointment"</span> to save.</p>
        </div>

        <div class="step">
            <span class="step-number">Step 3</span>
            <h3><i class="fas fa-search" style="color:#8B7DA6;"></i> View Appointment Details</h3>
            <p>Click on <span class="highlight">"View Appointment Details"</span> from the main menu.</p>
            <p>Enter the <span class="highlight">appointment number</span> (e.g., APT-XXXXXXXX).</p>
            <p>Click <span class="highlight">"Search"</span> to see all patient and appointment information.</p>
        </div>

        <div class="step">
            <span class="step-number">Step 4</span>
            <h3><i class="fas fa-file-invoice-dollar" style="color:#8B7DA6;"></i> Generate Bill</h3>
            <p>Click on <span class="highlight">"Generate Bill"</span> from the main menu.</p>
            <p>Enter the <span class="highlight">appointment number</span>.</p>
            <p>The system will calculate treatment cost + consultation fee.</p>
            <p>The <span class="highlight">receipt</span> will be displayed for printing or PDF download.</p>
        </div>

        <div class="step">
            <span class="step-number">Step 5</span>
            <h3><i class="fas fa-sign-out-alt" style="color:#8B7DA6;"></i> Exit the System</h3>
            <p>Click <span class="highlight">"Exit System"</span> from the main menu.</p>
            <p>Confirm that you want to exit.</p>
            <p>The application will close safely.</p>
        </div>

        <div class="tip">
            💡 <strong>Tip:</strong> Always log out after use by clicking the <strong>"Logout"</strong> button.
        </div>

        <a href="dashboard.jsp" class="btn-secondary"><i class="fas fa-arrow-left"></i> Back to Menu</a>
    </div>
</body>
</html>