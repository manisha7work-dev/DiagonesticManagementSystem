<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Patient Registration - DMS</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Inter:wght@300;400;500&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(135deg, #e3f2fd, #ffffff);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }

    .glass-card {
      background: rgba(255, 255, 255, 0.97);
      backdrop-filter: blur(10px);
      border-radius: 22px;
      padding: 40px 30px;
      box-shadow: 0 25px 60px rgba(0,0,0,0.08);
      border-top: 6px solid #0052ff;
      width: 100%;
      max-width: 700px;
      animation: fadeIn 0.8s ease-in-out;
    }

    @keyframes fadeIn {
      from {opacity:0; transform:translateY(20px);}
      to {opacity:1; transform:translateY(0);}
    }

    .page-title {
      font-family: 'Playfair Display', serif;
      color: #004aad;
      text-align: center;
      margin-bottom: 30px;
      font-weight: 600;
    }

    .form-control, .form-select {
      border-radius: 12px;
      height: 45px;
    }

    textarea.form-control {
      height: auto;
    }

    .form-control:focus, .form-select:focus {
      box-shadow: 0 0 0 0.2rem rgba(0,82,255,0.15);
      border-color: #0052ff;
    }

    .btn-gradient {
      background: linear-gradient(to right, #0052ff, #00c6ff);
      border: none;
      border-radius: 50px;
      padding: 12px;
      font-weight: 500;
      color: #fff;
      font-size: 16px;
      transition: all 0.3s ease;
    }

    .btn-gradient:hover {
      transform: translateY(-2px);
      box-shadow: 0 12px 30px rgba(0,82,255,0.4);
    }

    .hint-text {
      font-size: 13px;
      color: #777;
      text-align: center;
      margin-top: 15px;
    }
  </style>
</head>

<body>

<div class="glass-card">

  <h2 class="page-title">🧑‍⚕️ Patient Registration</h2>

  <form action="PatientServlet" method="post">
    <input type="hidden" name="action" value="register">

    <div class="row">
      <div class="col-md-6 mb-3">
        <label class="form-label fw-semibold">Full Name</label>
        <input type="text" class="form-control" name="name" placeholder="Enter your full name" required>
      </div>

      <div class="col-md-6 mb-3">
        <label class="form-label fw-semibold">Email Address</label>
        <input type="email" class="form-control" name="email" placeholder="example@email.com" required>
      </div>
    </div>

    <div class="row">
      <div class="col-md-6 mb-3">
        <label class="form-label fw-semibold">Password</label>
        <input type="password" class="form-control" name="password" placeholder="Create a strong password" required>
      </div>

      <div class="col-md-6 mb-3">
        <label class="form-label fw-semibold">Phone Number</label>
        <input type="text" class="form-control" name="phone" placeholder="10-digit phone number" required>
      </div>
    </div>

    <div class="row">
      <div class="col-md-6 mb-3">
        <label class="form-label fw-semibold">Gender</label>
        <select class="form-select" name="gender" required>
          <option value="">Select Gender</option>
          <option>Male</option>
          <option>Female</option>
          <option>Other</option>
        </select>
      </div>

      <div class="col-md-6 mb-3">
        <label class="form-label fw-semibold">Age</label>
        <input type="number" class="form-control" name="age" placeholder="Your age" required>
      </div>
    </div>

    <div class="mb-3">
      <label class="form-label fw-semibold">Address</label>
      <textarea class="form-control" name="address" rows="3" placeholder="Enter your full address" required></textarea>
    </div>

    <button type="submit" class="btn-gradient w-100">
      Create Account
    </button>

    <div class="hint-text">
      Already registered? <a href="patient_login.jsp" class="text-primary fw-semibold text-decoration-none">Login here</a>
    </div>

  </form>

</div>
<!--footer -->
<footer class="text-center">
    <small>© 2025 Diagnostic Management System</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
