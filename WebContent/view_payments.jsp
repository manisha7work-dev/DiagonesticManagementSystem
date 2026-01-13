<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dms.dao.PaymentDAO" %>
<%@ page import="com.dms.model.Payment" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
    PaymentDAO dao = new PaymentDAO();
    List<Payment> payments = dao.getAllPayments();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>All Payments</title>

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

    /* Navbar (Blue theme) */
    .navbar {
      background: linear-gradient(90deg, #0052ff, #00c6ff);
      box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    }

    /* Glass Card */
    .glass-card {
      background: rgba(255,255,255,0.95);
      backdrop-filter: blur(15px);
      border-radius: 20px;
      padding: 35px 30px;
      box-shadow: 0 25px 60px rgba(0,0,0,0.08);
      border-top: 6px solid #0052ff;
      margin-top: 50px;
      animation: fadeIn 0.8s ease-in-out;
    }

    @keyframes fadeIn {
      from {opacity:0; transform:translateY(20px);}
      to {opacity:1; transform:translateY(0);}
    }

    .page-title {
      font-family: 'Playfair Display', serif;
      color: #0052ff;
      text-align: center;
      margin-bottom: 5px;
    }

    .page-subtitle {
      text-align: center;
      color: #555;
      font-size: 14px;
      margin-bottom: 25px;
    }

    table {
      border-radius: 18px;
      overflow: hidden;
      background: white;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    }

    thead {
      background-color: #eef5ff;
      color: #0052ff;
      font-weight: 600;
      font-size: 14px;
    }

    tbody tr {
      transition: all 0.2s ease;
    }

    tbody tr:hover {
      background-color: #f0f8ff;
      transform: scale(1.003);
    }

    /* Status Badges */
    .status-badge {
      padding: 6px 14px;
      border-radius: 20px;
      font-size: 12px;
      font-weight: 500;
    }

    .status-success { background: #d4edda; color: #155724; }
    .status-pending { background: #fff3cd; color: #856404; }
    .status-failed  { background: #f8d7da; color: #721c24; }

    .amount {
      font-weight: 600;
      color: #0052ff;
    }

    .no-data {
      text-align: center;
      padding: 25px;
      color: #aaa;
      font-size: 14px;
    }

    @media (max-width: 768px) {
      .table-responsive { overflow-x: auto; }
    }
  </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid px-4">
    <a class="navbar-brand fw-bold" href="admin_dashboard.jsp">💳 Payment Dashboard</a>
    <a href="LogoutServlet" class="btn btn-light btn-sm rounded-pill px-3">Logout</a>
  </div>
</nav>

<!-- Content -->
<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-11">
      <div class="glass-card">

        <h3 class="page-title">All Payments</h3>
        <div class="page-subtitle">View and manage all transaction records</div>

        <div class="table-responsive">
          <table class="table table-borderless align-middle">
            <thead>
              <tr>
                <th>Payment ID</th>
                <th>Appointment ID</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Payment Date</th>
              </tr>
            </thead>
            <tbody>

            <% if (payments == null || payments.isEmpty()) { %>
              <tr>
                <td colspan="5" class="no-data">No payment records found.</td>
              </tr>
            <% } else {
                 for (Payment p : payments) {
                     String statusClass = "";
                     switch(p.getStatus().toLowerCase()) {
                         case "success": 
                         case "paid":    
                             statusClass = "status-success"; break;
                         case "pending": 
                             statusClass = "status-pending"; break;
                         case "failed":  
                             statusClass = "status-failed"; break;
                         default: 
                             statusClass = "status-pending";
                     }
            %>
              <tr>
                <td>#<%= p.getPaymentId() %></td>
                <td>#<%= p.getAppointmentId() %></td>
                <td class="amount">₹<%= p.getAmount() %></td>
                <td>
                  <span class="status-badge <%= statusClass %>">
                    <%= p.getStatus() %>
                  </span>
                </td>
                <td><%= p.getPaymentDate() %></td>
              </tr>
            <% } } %>

            </tbody>
          </table>
        </div>

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
