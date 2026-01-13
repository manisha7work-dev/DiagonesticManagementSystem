<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Diagnostic Management System</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Premium Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Inter:wght@300;400;500&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(135deg, #e0f7fa, #ffffff);
      overflow-x: hidden;
    }

    /* Navbar */
    .navbar {
      background: linear-gradient(90deg, #0066ff, #00c6ff);
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }

    .navbar-brand {
      font-family: 'Playfair Display', serif;
      font-size: 1.6rem;
      letter-spacing: 1px;
    }

    /* Hero Section */
    .hero-section {
      padding: 70px 0;
    }

    .hero-card {
      background: rgba(255, 255, 255, 0.85);
      backdrop-filter: blur(8px);
      border-radius: 25px;
      padding: 55px 45px;
      box-shadow: 0 25px 60px rgba(0,0,0,0.08);
      animation: floatIn 1s ease-in-out;
    }

    @keyframes floatIn {
      from { opacity: 0; transform: translateY(30px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .hero-card h1 {
      font-family: 'Playfair Display', serif;
      font-size: 2.4rem;
      color: #004aad;
    }

    .hero-card ul li {
      font-size: 1rem;
      margin-bottom: 8px;
    }

    /* Gradient Button */
    .btn-gradient {
      background: linear-gradient(to right, #0052ff, #00c6ff);
      border: none;
      color: white;
      padding: 10px 35px;
      text-align: center;
      font-weight: 500;
      transition: all 0.3s ease;
    }

    .btn-gradient:hover {
      transform: translateY(-2px);
      box-shadow: 0 10px 25px rgba(0, 82, 255, 0.4);
    }

    /* Glass Cards */
    .feature-box {
      background: rgba(255,255,255,0.85);
      backdrop-filter: blur(6px);
      border-radius: 18px;
      padding: 35px 20px;
      text-align: center;
      box-shadow: 0 20px 40px rgba(0,0,0,0.05);
      transition: 0.3s ease;
    }

    .feature-box:hover {
      transform: translateY(-8px) scale(1.01);
    }

    /* Icons */
    .icon-circle {
      font-size: 2rem;
      margin-bottom: 15px;
      color: #007bff;
    }

    /* Footer */
    footer {
      background: linear-gradient(90deg, #0066ff, #00c6ff);
      color: white !important;
      margin-top: 90px;
      padding: 35px 0;
      font-size: 14px;
    }
  </style>
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="index.jsp">🧬 Diagnostic Management System</a>
    <div>
      <a href="patient_login.jsp" class="btn btn-light btn-sm mx-1">Patient Login</a>
      <a href="analyst_login.jsp" class="btn btn-light btn-sm mx-1">Analyst Login</a>
      <a href="admin_login.jsp" class="btn btn-light btn-sm mx-1">Admin Login</a>
    </div>
  </div>
</nav>

<div class="container text-center mt-5">
  <h1 class="fw-bold text-primary">Welcome to Diagnostic Management System</h1>
  <p class="lead">Book medical tests, view reports, and manage diagnostics online.</p>
  <a href="patient_register.jsp" class="btn btn-primary btn-lg mt-3">Register as Patient</a>
  
  <p class="mt-3 text-center">
    New analyst? <a href="analyst_register.jsp">Register here</a>
  </p>
  
</div>

</body>
</html>
