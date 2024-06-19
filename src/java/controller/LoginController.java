package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.DAOUser;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginControllerURL"})
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOUser dao = new DAOUser();
        HttpSession session = request.getSession(true);

        String service = request.getParameter("service");

        if (service.equals("Login")) {
            String role = request.getParameter("role");
            String user = request.getParameter("email");
            String password = request.getParameter("password");
            boolean account = dao.login(role, user, password);

            if (account) {
                session.setAttribute("userName", user);
                session.setAttribute("role", role);

                switch (role) {
                    case "Admin":
                        response.sendRedirect("HomeAdmin.jsp");
                        break;
                    case "Parent":
                        
                        response.sendRedirect("StudentControllerURL?service=listKids");
                        break;
                    case "Teacher":
                        response.sendRedirect("TeacherSYearClassControllerURL?service=listClasses");
                        break;
                    default:
                        response.sendRedirect("Login.jsp");
                        break;
                }
            } else {
                response.sendRedirect("Login.jsp");
            }
        }

        if (service.equals("Logout")) {
            session = request.getSession(false);
            if (session != null) {
                session.invalidate();
                response.sendRedirect("Login.jsp"); // Redirect to your login page after logout
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
