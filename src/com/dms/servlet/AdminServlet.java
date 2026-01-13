package com.dms.servlet;

import com.dms.controller.AdminController;
import com.dms.model.Admin;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminServlet extends HttpServlet {

	private final AdminController controller = new AdminController();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String action = req.getParameter("action");
       System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
       if ("login".equalsIgnoreCase(action)) {
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            Admin a = controller.login(email, password);
            if (a != null) {
            	System.out.println("cccccccccccccccccccccccccc");
                HttpSession session = req.getSession(true);
                session.setAttribute("admin", a);
                session.setAttribute("adminName", a.getName());
                System.out.println("ddddddddddddddddddddddddddd");
                resp.sendRedirect(req.getContextPath() + "/dashboard_admin.jsp");            
            } else {
            	System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeeeeee");
                req.setAttribute("error", "Invalid credentials");
                req.getRequestDispatcher("/admin_login.jsp").forward(req, resp);
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unsupported action");
        }
    }
}
