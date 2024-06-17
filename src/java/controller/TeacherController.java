package controller;

import entity.StudentSchoolYearClass;
import entity.Teacher;
import entity.TeacherSchoolYearClass;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOStudentSchoolYearClass;
import model.DAOTeacher;
import model.DAOTeacherSchoolYearClass;

@WebServlet(name = "TeacherController", urlPatterns = {"/TeacherControllerURL"})
public class TeacherController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOTeacher dao = new DAOTeacher();
        HttpSession session = request.getSession(true);
        
                String userName = (String) session.getAttribute("userName");

        
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
            Vector<Teacher> vector = dao.getAllTeachers("SELECT * FROM Teacher");
            request.setAttribute("data", vector);
            request.setAttribute("teacherCount", vector.size()); // Setting teacher count attribute
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
                String teacherID = request.getParameter("TeacherID");
                String userID = request.getParameter("UserID");
                String degree = request.getParameter("Degree");
                Teacher teacher = new Teacher(teacherID, userID, degree);
                dao.updateTeacher(teacher);
                response.sendRedirect("TeacherControllerURL?service=listAll");
            }
        }

        if (service.equals("delete")) {
            String teacherID = request.getParameter("TeacherID");
            dao.removeTeacher(teacherID);
            response.sendRedirect("TeacherControllerURL?service=listAll");
        }
        
        if (service.equals("viewTeacher")) {
            DAOStudentSchoolYearClass daoSSC = new DAOStudentSchoolYearClass();
            DAOTeacherSchoolYearClass daoTSC = new DAOTeacherSchoolYearClass();

            String sID = request.getParameter("sID");
            Vector<StudentSchoolYearClass> vectorSSC = daoSSC.getAllStudentSchoolYearClasses("select * from Student_SchoolYear_Class where StudentID = '" + sID + "'");
//            Vector<SchoolYearClass> vectorSC = daoSC.getAllSchoolYearClasses("select * from SchoolYear_Class where SyC_ID = ' "+sID+"'");
             StudentSchoolYearClass SSyClass = vectorSSC.get(0);


            Vector<TeacherSchoolYearClass> vectorTSC = daoTSC.getAllTeacherSchoolYearClasses("select * from Teacher_SchoolYear_Class where SyC_ID = '"+SSyClass.getSyC_ID()+"'");
              Vector<Teacher> vector = dao.getAllTeachers("select * from Teacher where TeacherID = '"+vectorTSC.get(0).getTeacherID()+"'");
          
            request.setAttribute("data", vector);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ViewTeacher.jsp");
            dispatcher.forward(request, response);
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
