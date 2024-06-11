package controller;

import entity.Teacher;
import model.DAOTeacher;

import java.io.IOException;
import java.util.Vector;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "TeacherController", urlPatterns = {"/TeacherControllerURL"})
public class TeacherController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOTeacher dao = new DAOTeacher();
        HttpSession session = request.getSession(true);

        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("addTeacher")) {
            String teacherID = request.getParameter("TeacherID");
            String userID = request.getParameter("UserID");
            String degree = request.getParameter("Degree");
            Teacher teacher = new Teacher(teacherID, userID, degree);
            dao.insertTeacher(teacher);
            response.sendRedirect("TeacherControllerURL?service=listAll");
        }

        if (service.equals("listAll")) {
            Vector<Teacher> vector = dao.getAllTeachers("select * from Teacher");
            request.setAttribute("data", vector);
            RequestDispatcher dispatcher = request.getRequestDispatcher("TeacherManager.jsp");
            dispatcher.forward(request, response);
        }

        if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                String teacherID = request.getParameter("TeacherID");
                Vector<Teacher> vector = dao.getAllTeachers("SELECT * FROM Teacher WHERE TeacherID='" + teacherID + "'");
                request.setAttribute("vector", vector);
                RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateTeacher.jsp");
                dispatcher.forward(request, response);
            } else {
                String teacherID = request.getParameter("teacherID");
                String userID = request.getParameter("userID");
                String degree = request.getParameter("degree");
                Teacher teacher = new Teacher(teacherID, userID, degree);
                int rowsAffected = dao.updateTeacher(teacher);
                if (rowsAffected > 0) {
                    session.setAttribute("updateSuccess", "Cập nhật giáo viên thành công!");
                } else {
                    session.setAttribute("updateError", "Cập nhật giáo viên thất bại.");
                }
                response.sendRedirect("TeacherControllerURL?service=listAll");
            }
        }

        if (service.equals("delete")) {
            String teacherID = request.getParameter("TeacherID");
            dao.removeTeacher(teacherID);
            response.sendRedirect("TeacherControllerURL?service=listAll");
            session.removeAttribute("deleteSuccess");
            session.removeAttribute("deleteError");
        }
        if (service.equals("search")) {
            String teacherID = request.getParameter("searchQuery");
            if (teacherID != null && !teacherID.trim().isEmpty()) {
                Teacher teacher = dao.searchTeacherByID(teacherID);
                Vector<Teacher> allTeachers = dao.getAllTeachers("select * from Teacher");
                if (teacher != null) {
                    Vector<Teacher> searchResult = new Vector<>();
                    searchResult.add(teacher);
                    request.setAttribute("data", searchResult);
                    request.setAttribute("searchSuccess", "Tìm thấy giáo viên!");
                } else {
                    request.setAttribute("data", allTeachers);
                    request.setAttribute("searchError", "Không tìm thấy giáo viên với ID: " + teacherID);
                }
            } else {
                Vector<Teacher> allTeachers = dao.getAllTeachers("select * from Teacher");
                request.setAttribute("data", allTeachers);
                request.setAttribute("searchError", "Vui lòng nhập ID giáo viên để tìm kiếm.");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("TeacherManager.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        // Xóa các session attribute liên quan đến cập nhật và xóa giáo viên
        HttpSession session = request.getSession();
        session.removeAttribute("updateSuccess");
        session.removeAttribute("updateError");
        session.removeAttribute("deleteSuccess");
        session.removeAttribute("deleteError");
        session.removeAttribute("searchError");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        // Xóa các session attribute liên quan đến cập nhật và xóa giáo viên
        HttpSession session = request.getSession();
        session.removeAttribute("updateSuccess");
        session.removeAttribute("updateError");
        session.removeAttribute("deleteSuccess");
        session.removeAttribute("deleteError");
        session.removeAttribute("searchError");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public static void main(String[] args) {
        DAOTeacher dao = new DAOTeacher();
//        int n = dao.insertTeacher(new Teacher("T001", "U001", "PhD"));
//        if (n > 0) {
//            System.out.println("Inserted");
//        }
        Teacher new1 = new Teacher("TE002", "TE002", "300");
        dao.updateTeacher(new1);
//        for (Teacher teacher : vector) {
//            System.out.println(teacher.getTeacherID() + " - " + teacher.getUserID() + " - " + teacher.getDegree());
//        }
    }
}
