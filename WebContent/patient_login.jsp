<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
   
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Patient Login</title>

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
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }

    .login-card {
      background: rgba(255, 255, 255, 0.9);
      backdrop-filter: blur(10px);
      border-radius: 25px;
      padding: 45px 35px;
      box-shadow: 0 25px 60px rgba(0,0,0,0.12);
      width: 100%;
      max-width: 420px;
      animation: fadeIn 0.8s ease-in-out;
      border-top: 6px solid #0052ff;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .login-title {
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
    .content-wrapper {
  margin-top: 60px;   /* moves content to middle area */
}
    

    .btn-login {
      background: linear-gradient(to right, #0052ff, #00c6ff);
      border: none;
      border-radius: 50px;
      padding: 12px;
      font-weight: 500;
      color: #fff;
      width: 100%;
    }

    .btn-login:hover {
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

<div class="content-wrapper">
  <div class="login-card">
    <h2 class="login-title">Patient Login</h2>

    <form action="PatientServlet" method="post">
      <input type="hidden" name="action" value="login">

      <div class="mb-3">
        <label class="form-label">Email Address</label>
        <input type="email" class="form-control" name="email" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Password</label>
        <input type="password" class="form-control" name="password" required>
      </div>

      <button type="submit" class="btn-login mt-2">Login</button>
    </form>

    <div class="back-link">
      ← <a href="index.jsp">Back to Home</a>
    </div>
  </div>

  <!-- Footer just under the card -->
  <footer class="text-center text-muted py-3">
    <small>© 2025 Diagnostic Management System</small>
  </footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

