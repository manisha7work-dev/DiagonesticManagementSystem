<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ page import="java.util.List" %>
<%@ page import="com.dms.model.Appointment" %>
<%@ page import="com.dms.model.Payment" %>
<%@ page import="com.dms.dao.PaymentDAO" %>


<%
    // Get the data passed from servlet
    List<Appointment> appts = (List<Appointment>) request.getAttribute("appts");
    PaymentDAO payDao = (PaymentDAO) request.getAttribute("payDao");
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Appointments & Payments - DMS</title>

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
            background: linear-gradient(90deg, #0052ff, #00c6ff) !important;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.97);
            backdrop-filter: blur(8px);
            border-radius: 22px;
            padding: 30px;
            margin-top: 40px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.08);
            animation: fadeIn 0.7s ease-in-out;
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

        table {
            border-radius: 16px;
            overflow: hidden;
        }

        thead {
            background: linear-gradient(90deg, #0052ff, #00c6ff);
            color: white;
        }

        thead th {
            border: none !important;
            text-align: center;
            font-size: 14px;
            padding: 14px 10px;
            vertical-align: middle;
        }

        tbody td {
            text-align: center;
            vertical-align: middle;
            font-size: 14px;
            padding: 12px;
        }

        tbody tr:hover {
            background-color: #f1f7ff;
            transition: 0.2s ease;
        }

        .badge {
            font-size: 12px;
            border-radius: 50px;
            padding: 6px 12px;
        }

        .btn-primary {
            border-radius: 50px;
            padding: 6px 16px;
            font-size: 13px;
        }

        .btn-primary:hover {
            box-shadow: 0 10px 25px rgba(0,82,255,0.3);
            transform: translateY(-1px);
        }

        .empty-state {
            text-align: center;
            color: #777;
            font-size: 14px;
            padding: 30px 10px;
        }
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="dashboard_patient.jsp">🧬 Patient Dashboard</a>
        <div>
            <a href="LogoutServlet" class="btn btn-light btn-sm rounded-pill px-3">Logout</a>
        </div>
    </div>
</nav>

<!-- Content -->
<div class="container">
    <div class="glass-card">

        <h3 class="page-title">📅 My Appointments & Payments</h3>

        <div class="table-responsive">
            <table class="table table-borderless align-middle mb-0">
                <thead>
                    <tr>
                        <th>Appt ID</th>
                        <th>Test ID</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Status</th>
                        <th>Payment</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    if (appts == null || appts.isEmpty()) {
                %>
                    <tr>
                        <td colspan="7" class="empty-state">
                            No appointments found ✨
                        </td>
                    </tr>
                <%
                    } else {
                        for (Appointment a : appts) {
                            Payment payment = payDao.getPaymentByAppointment(a.getAppointmentId());
                %>
                    <tr>
                        <td><%= a.getAppointmentId() %></td>
                        <td><%= a.getTestId() %></td>
                        <td><%= a.getAppointmentDate() %></td>
                        <td><%= a.getAppointmentTime() %></td>
                        <td>
                            <span class="badge bg-info">
                                <%= a.getStatus() %>
                            </span>
                        </td>

                        <td>
                        <% if (payment != null && "Paid".equalsIgnoreCase(payment.getStatus())) { %>
                            <span class="badge bg-success">Paid</span><br>
                            <small class="text-muted">₹<%= payment.getAmount() %></small>
                        <% } else { %>
                            <span class="badge bg-warning text-dark">Not Paid</span>
                        <% } %>
                        </td>

                        <td>
                        <% if (payment == null || !"Paid".equalsIgnoreCase(payment.getStatus())) { %>
                            <a href="payment_page.jsp?appointmentId=<%= a.getAppointmentId() %>" 
                               class="btn btn-primary btn-sm">
                                Pay Now
                            </a>
                        <% } else { %>
                            <small class="text-muted">No action</small>
                        <% } %>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>

    </div>
</div>

</body>
</html>
