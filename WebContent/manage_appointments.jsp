<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List" %>
<%@ page import="com.dms.dao.AnalystDAO" %>
<%@ page import="com.dms.model.Analyst" %>
<%@ page import="com.dms.dao.AppointmentDAO" %>
<%@ page import="com.dms.model.Appointment" %>

<%
    // Only admin can access
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }

    // load all analysts (for dropdown)
    AnalystDAO analystDao = new AnalystDAO();
    List<Analyst> analysts = analystDao.getAllAnalysts();

    // load all appointments
    AppointmentDAO dao = new AppointmentDAO();
    List<Appointment> list = dao.getAllAppointments();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Appointments</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Inter:wght@300;400;500&display=swap" rel="stylesheet">

    <style>
        body{
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #ffffff);
            min-height: 100vh;
        }

        .navbar{
            background: linear-gradient(90deg, #0052ff, #00c6ff) !important;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .page-card{
            background: rgba(255,255,255,0.97);
            backdrop-filter: blur(10px);
            border-radius: 22px;
            padding: 30px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.08);
            margin-top: 40px;
        }

        .page-title{
            font-family: 'Playfair Display', serif;
            color: #004aad;
            text-align: center;
            margin-bottom: 25px;
        }

        thead{
            background: linearasl-gradient(90deg, #0052ff, #00c6ff);
            color: white;
        }

        thead th, tbody td{
            text-align: center;
            font-size: 14px;
            vertical-align: middle;
        }

        tbody tr:hover{
            background-color: #f3f9ff;
        }

        .btn-update{
            background: linear-gradient(to right, #198754, #157347);
            border: none;
            border-radius: 50px;
            padding: 6px 14px;
            font-size: 13px;
            color: white;
        }

        .form-select, .form-control{
            border-radius: 12px;
            font-size: 13px;
        }
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="dashboard_admin.jsp">🛠️ Admin Dashboard</a>
        <div>
            <a href="LogoutServlet" class="btn btn-light btn-sm rounded-pill px-3">Logout</a>
        </div>
    </div>
</nav>

<!-- Content -->
<div class="container">
    <div class="page-card">

        <h3 class="page-title">📅 Manage Appointments</h3>

        <div class="table-responsive">
            <table class="table table-bordered table-striped align-middle">
        <tr>
            <th>ID</th>
            <th>Patient</th>
            <th>Test</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>
            <th>Assigned Analyst</th>
            <th>Action</th>
        </tr>

        <% for (Appointment a : list) { 
               // find current analyst name (if any)
               String analystName = "-";
               String analystSpec = "";
               for (Analyst an : analysts) {
                   if (an.getAnalystId() == a.getAnalystId()) {
                       analystName = an.getName();
                       analystSpec = an.getSpecialization();
                       break;
                   }
               }
        %>
        <tr>
            <td><%= a.getAppointmentId() %></td>
            <td><%= a.getPatientId() %></td>
            <td><%= a.getTestId() %></td>
            <td><%= a.getAppointmentDate() %></td>
            <td><%= a.getAppointmentTime() %></td>
            <td><span class="badge bg-info"><%= a.getStatus() %></span></td>

            <!-- shows currently assigned analyst -->
            <td>
                <% if (!"-".equals(analystName)) { %>
                    <strong><%= analystName %></strong><br/>
                    <small><%= analystSpec %></small>
                <% } else { %>
                    <span class="text-muted">Not assigned</span>
                <% } %>
            </td>

            <!-- form to ASSIGN / CHANGE analyst -->
            <td>
    			<% if (a.getAnalystId() == 0) { %>
        		<!-- Show form ONLY when no analyst assigned -->
        		<form action="AppointmentServlet" method="post" class="d-flex">
            		<input type="hidden" name="action" value="assignAnalyst">
            		<input type="hidden" name="appointmentId" value="<%= a.getAppointmentId() %>">

            		<select name="analystId" class="form-select form-select-sm me-2" required>
                		<option value="">-- Select Analyst --</option>
               			 <% for (Analyst an : analysts) { %>
                    		<option value="<%= an.getAnalystId() %>">
                        		<%= an.getName() %> - <%= an.getSpecialization() %>
                    		</option>
                		<% } %>
            		</select>

           	 		<button class="btn btn-primary btn-sm">Assign</button>
        		</form>
   				 <% } else { %>
       	 			<!-- Show assigned badge when already assigned -->
        			<button class="btn btn-success btn-sm" disabled>Assigned</button>
    			<% } %>
			</td>

        </tr>
        <% } %>
    </table>
        </div>

    </div>
</div>

</body>
</html>
