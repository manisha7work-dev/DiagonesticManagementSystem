<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Analyst Registration - DMS</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Inter:wght@300;400;500&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(135deg, #e0f7fa, #ffffff);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .register-card {
      background: rgba(255, 255, 255, 0.92);
      backdrop-filter: blur(10px);
      border-radius: 25px;
      padding: 45px 35px;
      box-shadow: 0 25px 60px rgba(0,0,0,0.12);
      width: 100%;
      max-width: 480px;
      animation: fadeIn 0.8s ease-in-out;
      border-top: 6px solid #0052ff;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .page-title {
      font-family: 'Playfair Display', serif;
      color: #004aad;
      text-align: center;
      margin-bottom: 25px;
    }

    .form-control {
      border-radius: 12px;
      height: 45px;
      padding-left: 15px;
    }

    .form-control:focus {
      box-shadow: 0 0 0 0.2rem rgba(0, 82, 255, 0.15);
      border-color: #0052ff;
    }

    .btn-register {
      background: linear-gradient(to right, #0052ff, #00c6ff);
      border: none;
      border-radius: 50px;
      padding: 12px;
      font-weight: 500;
      color: #fff;
      transition: 0.3s ease;
      width: 100%;
    }

    .btn-register:hover {
      transform: translateY(-2px);
      box-shadow: 0 10px 25px rgba(0, 82, 255, 0.4);
    }

    .back-link {
      text-align: center;
      margin-top: 15px;
    }

    .back-link a {
      text-decoration: none;
      color: #0052ff;
      font-weight: 500;
    }
  </style>
</head>

<body>

<div class="register-card">

  <h2 class="page-title">Analyst Registration</h2>

  <form action="AnalystServlet" method="post">
    <input type="hidden" name="action" value="register">

    <div class="mb-3">
      <label class="form-label">Full Name</label>
      <input type="text" class="form-control" name="name" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Email Address</label>
      <input type="email" class="form-control" name="email" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Password</label>
      <input type="password" class="form-control" name="password" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Specialization</label>
      <input type="text" class="form-control" name="specialization" placeholder="e.g. Pathology, Radiology,chest-specialization">
    </div>

    <div class="mb-3">
      <label class="form-label">Phone Number</label>
      <input type="text" class="form-control" name="phone" placeholder="+91 XXXXX XXXXX">
    </div>

    <button type="submit" class="btn-register mt-2">Register</button>
  </form>

  <div class="back-link">
    <p class="mt-3 mb-0">
      ← <a href="index.html">Back to Home</a>
    </p>
  </div>

</div>

<!--footer -->
<footer class="text-center text-muted py-3">
    <small>© 2025 Diagnostic Management System</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
