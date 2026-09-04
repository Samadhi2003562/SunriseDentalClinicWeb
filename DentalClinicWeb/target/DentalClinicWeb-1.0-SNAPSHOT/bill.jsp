<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dentalclinic.model.Bill"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental - Bill</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: #f0ecf5; padding: 30px 20px; }
        .container {
            max-width: 650px; margin: 0 auto; background: white;
            padding: 40px 45px; border-radius: 20px;
            box-shadow: 0 15px 50px rgba(0,0,0,0.08);
        }
        h1 { text-align: center; color: #2d1b0e; font-size: 26px; font-weight: 800; }
        .subtitle { text-align: center; color: #aaa; font-size: 14px; margin-bottom: 25px; }
        .search-box { display: flex; gap: 12px; margin-bottom: 20px; }
        .search-box input {
            flex: 1; padding: 14px 18px;
            border: 2px solid #e8e4ed; border-radius: 12px;
            font-size: 14px; font-family: 'Inter', sans-serif;
            transition: 0.3s; background: #faf8fc;
        }
        .search-box input:focus {
            outline: none; border-color: #8B7DA6;
            box-shadow: 0 0 0 4px rgba(139, 125, 166, 0.12);
        }
        .search-box button {
            padding: 14px 30px;
            background: linear-gradient(135deg, #8B7DA6, #6B5D8A);
            color: white; border: none; border-radius: 12px;
            font-weight: 700; cursor: pointer;
            font-family: 'Inter', sans-serif; transition: 0.3s;
            white-space: nowrap;
        }
        .search-box button:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(139, 125, 166, 0.3);
        }
        .error { background: #f8d7da; color: #721c24; padding: 12px 16px; border-radius: 12px; margin-bottom: 20px; text-align: center; }
        .receipt-box {
            background: #faf8fc; padding: 25px; border-radius: 12px;
            border: 2px dashed #8B7DA6;
            font-family: 'Courier New', monospace;
            white-space: pre-wrap; font-size: 14px; line-height: 1.6;
        }
        .action-buttons { display: flex; gap: 12px; margin-top: 15px; flex-wrap: wrap; }
        .btn-print {
            padding: 10px 22px; background: #28a745; color: white;
            border: none; border-radius: 8px; font-weight: 600; cursor: pointer;
        }
        .btn-txt {
            padding: 10px 22px; background: #007bff; color: white;
            border: none; border-radius: 8px; font-weight: 600; cursor: pointer;
        }
        .btn-pdf {
            padding: 10px 22px; background: #dc3545; color: white;
            border: none; border-radius: 8px; font-weight: 600; cursor: pointer;
            text-decoration: none; display: inline-block;
        }
        .btn-secondary {
            padding: 12px 25px; background: #e8e4ed;
            color: #555; border: none; border-radius: 12px;
            font-weight: 600; text-decoration: none; display: inline-block;
            font-family: 'Inter', sans-serif; font-size: 14px; transition: 0.3s;
        }
        .btn-secondary:hover { background: #d5cce3; }
        .btn-group { margin-top: 20px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>💰 Generate Bill</h1>
        <p class="subtitle">Enter appointment number to generate receipt</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %></div>
        <% } %>

        <form action="bill" method="post">
            <div class="search-box">
                <input type="text" name="appointmentNumber" placeholder="APT-XXXXXXXX" required>
                <button type="submit"><i class="fas fa-calculator"></i> Generate</button>
            </div>
        </form>

        <%
            String receipt = (String) request.getAttribute("receipt");
            Bill bill = (Bill) request.getAttribute("bill");
            if (receipt != null && bill != null) {
        %>
        <div class="receipt-box" id="receiptContent"><%= receipt %></div>
        <div class="action-buttons">
            <button onclick="window.print()" class="btn-print"><i class="fas fa-print"></i> Print</button>
            <button onclick="downloadReceipt()" class="btn-txt"><i class="fas fa-file-alt"></i> TXT</button>
            <a href="pdfbill?appointmentNumber=<%= bill.getAppointment().getAppointmentNumber() %>" class="btn-pdf"><i class="fas fa-file-pdf"></i> PDF</a>
        </div>
        <% } %>

        <div class="btn-group">
            <a href="dashboard.jsp" class="btn-secondary"><i class="fas fa-arrow-left"></i> Back to Menu</a>
        </div>
    </div>
    <script>
        function downloadReceipt() {
            var text = document.getElementById("receiptContent").innerText;
            var blob = new Blob([text], {type: "text/plain"});
            var link = document.createElement("a");
            link.href = URL.createObjectURL(blob);
            link.download = "receipt.txt";
            link.click();
        }
    </script>
</body>
</html>