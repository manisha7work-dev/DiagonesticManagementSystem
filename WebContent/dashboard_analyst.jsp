<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Analyst Dashboard - DMS</title>

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

    .navbar {
      background: linear-gradient(90deg, #0052ff, #00c6ff);
      box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    }

    .navbar-brand {
      font-family: 'Playfair Display', serif;
    }

    .glass-card {
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      padding: 35px 30px;
      box-shadow: 0 25px 60px rgba(0,0,0,0.08);
      border-top: 6px solid #0052ff;
      animation: fadeIn 0.8s ease-in-out;
      margin-top: 60px;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .welcome-text {
      font-family: 'Playfair Display', serif;
      color: #0052ff;
      text-align: center;
      margin-bottom: 10px;
    }

    .subtitle-text {
      text-align: center;
      color: #6c757d;
      margin-bottom: 30px;
      font-size: 14px;
    }

    .action-btn {
      display: flex;
      align-items: center;
      justify-content: space-between;
      font-size: 18px;
      padding: 18px 20px;
      border-radius: 15px;
      margin-bottom: 15px;
      font-weight: 500;
      transition: all 0.3s ease;
      background: #f8fbff;
      border: none;
    }

    .action-btn:hover {
      transform: translateY(-3px);
      box-shadow: 0 10px 30px rgba(0,82,255, 0.25);
      background: #eef5ff;
    }

  </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid px-4">
    <a class="navbar-brand fw-bold" href="#">🧪 Analyst Dashboard</a>
    <a href="index.jsp" class="btn btn-light btn-sm rounded-pill px-3">Logout</a>
  </div>
</nav>

<!-- Dashboard Card -->
<div class="container">
  <div class="glass-card mx-auto" style="max-width: 650px;">

    <h3 class="welcome-text">
      Welcome, ${sessionScope.analystName} 👋
    </h3>

    <p class="subtitle-text">Manage appointments and upload reports easily</p>

    <div class="list-group">

      <a href="view_appointments.jsp" class="list-group-item action-btn list-group-item-action">
        🧾 View Assigned Appointments
        <span>→</span>
      </a>

      <a href="upload_report.jsp" class="list-group-item action-btn list-group-item-action">
        📤 Upload Test Reports
        <span>→</span>
      </a>

    </div>

  </div>
</div>
<!--footer -->
<footer class="text-center text-muted py-3">
    <small>© 2025 Diagnostic Management System</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
