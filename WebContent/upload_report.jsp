<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="com.dms.model.Analyst" %>

<%
    if (session.getAttribute("analyst") == null) {
        response.sendRedirect("analyst_login.jsp");
        return;
    }

    String apptId = request.getParameter("appointmentId");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Upload Report - DMS</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Inter:wght@300;400;500&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(135deg, #e3f2fd, #ffffff);
      min-height: 100vh;
    }

    .upload-card {
      background: rgba(255,255,255,0.97);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      padding: 35px 30px;
      box-shadow: 0 30px 70px rgba(0,0,0,0.08);
      border-top: 6px solid #0052ff;
      margin-top: 50px;
      animation: fadeIn 0.8s ease;
    }

    @keyframes fadeIn {
      from {opacity:0; transform:translateY(20px);}
      to {opacity:1; transform:translateY(0);}
    }

    .page-title {
      font-family: 'Playfair Display', serif;
      color: #004aad;
      text-align: center;
      margin-bottom: 25px;
    }

    .info-box {
      background: #f5f9ff;
      padding: 18px 20px;
      border-radius: 15px;
      margin-bottom: 25px;
      box-shadow: inset 0 0 0 1px rgba(0,0,0,0.04);
    }

    .upload-btn {
      background: linear-gradient(90deg, #28a745, #5fd37a);
      border: none;
      font-weight: 600;
      padding: 14px;
      border-radius: 30px;
      letter-spacing: 0.5px;
      box-shadow: 0 10px 25px rgba(40,167,69,0.25);
      transition: 0.2s ease;
    }

    .upload-btn:hover {
      transform: translateY(-1px);
      box-shadow: 0 15px 30px rgba(40,167,69,0.35);
    }

    .secure-text {
      text-align: center;
      font-size: 13px;
      color: #777;
      margin-top: 10px;
    }
  </style>
</head>
<body>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-7 col-lg-6">

      <div class="upload-card">

        <h3 class="page-title">Upload Report</h3>

        <!-- Appointment Info -->
        <div class="info-box">
          <p><strong>Appointment ID:</strong> #<%= apptId %></p>
          <!-- You can add more info here if needed -->
        </div>

        <!-- Upload Form -->
        <form action="ReportServlet" enctype="multipart/form-data" method="post">
          <input type="hidden" name="action" value="upload">
          <input type="hidden" name="appointmentId" value="<%= apptId %>">

          <div class="mb-3">
            <label class="form-label fw-semibold">Report File (PDF/Image)</label>
            <input type="file" name="reportFile" class="form-control rounded-pill" required>
          </div>

          <div class="mb-3">
            <label class="form-label fw-semibold">Comments</label>
            <textarea name="comments" class="form-control rounded" rows="3"></textarea>
          </div>

          <button type="submit" class="btn upload-btn w-100">Upload Report</button>

          <div class="secure-text">
            🔒 Secure Upload
          </div>
        </form>

      </div>

    </div>
  </div>
</div>

<!-- Footer -->
<footer class="text-center text-muted py-3">
    <small>© 2025 Diagnostic Management System</small>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
