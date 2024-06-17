package controller;

import entity.Menu;
import entity.Class;
import entity.ClassCategory;
import entity.ClassCategoryMenu;
import entity.SchoolYearClass;
import entity.StudentSchoolYearClass;
import entity.TeacherSchoolYearClass;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOClass;
import model.DAOClassCategory;
import model.DAOClassCategoryMenu;
import model.DAOMenu;
import model.DAOSchoolYearClass;
import model.DAOStudentSchoolYearClass;
import model.DAOTeacherSchoolYearClass;

@WebServlet(name = "MenuController", urlPatterns = {"/MenuControllerURL"})
public class MenuController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOMenu dao = new DAOMenu();
        HttpSession session = request.getSession(true);
        
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("addMenu")) {
            String menuID = request.getParameter("MenuID");
            String food = request.getParameter("Food");
            Menu menu = new Menu(menuID, food);
            dao.insertMenu(menu);
            response.sendRedirect("MenuControllerURL?service=listAll");
        }

        if (service.equals("listAll")) {
            Vector<Menu> vector = dao.getAllMenus("SELECT * FROM Menu");
            request.setAttribute("data", vector);
            RequestDispatcher dispatcher = request.getRequestDispatcher("MenuList.jsp");
            dispatcher.forward(request, response);
        }

        if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                String menuID = request.getParameter("MenuID");
                Vector<Menu> vector = dao.getAllMenus("SELECT * FROM Menu WHERE MenuID='" + menuID + "'");
                request.setAttribute("vector", vector);
                RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateMenu.jsp");
                dispatcher.forward(request, response);
            } else {
                String menuID = request.getParameter("MenuID");
                String food = request.getParameter("Food");
                Menu menu = new Menu(menuID, food);
                dao.updateMenu(menu);
                response.sendRedirect("MenuControllerURL?service=listAll");
            }
        }

        if (service.equals("delete")) {
            String menuID = request.getParameter("MenuID");
            dao.removeMenu(menuID);
            response.sendRedirect("MenuControllerURL?service=listAll");
        }
        
        if (service.equals("viewTeacher")) {
            DAOStudentSchoolYearClass daoSSC = new DAOStudentSchoolYearClass();
            DAOTeacherSchoolYearClass daoTSC = new DAOTeacherSchoolYearClass();

            String sID = request.getParameter("sID");
            Vector<StudentSchoolYearClass> vectorSSC = daoSSC.getAllStudentSchoolYearClasses("select * from Student_SchoolYear_Class where StudentID = '" + sID + "'");
//            Vector<SchoolYearClass> vectorSC = daoSC.getAllSchoolYearClasses("select * from SchoolYear_Class where SyC_ID = ' "+sID+"'");
             StudentSchoolYearClass SSyClass = vectorSSC.get(0);


            Vector<TeacherSchoolYearClass> vector = daoTSC.getAllTeacherSchoolYearClasses("select * from TeacherSchoolYearClass where SyC_ID = '"+SSyClass.getSyC_ID()+"'");
            request.setAttribute("data", vector);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ViewTeacher.jsp");
            dispatcher.forward(request, response);
        }
        
        if (service.equals("viewMenu")) {
            DAOStudentSchoolYearClass daoSSC = new DAOStudentSchoolYearClass();
            DAOSchoolYearClass daoSC = new DAOSchoolYearClass();
            DAOClass daoC = new DAOClass();
            DAOClassCategory daoCC = new DAOClassCategory();
            DAOClassCategoryMenu daoCCM = new DAOClassCategoryMenu();

            String sID = request.getParameter("sID");
            Vector<StudentSchoolYearClass> vectorSSC = daoSSC.getAllStudentSchoolYearClasses("select * from Student_SchoolYear_Class where StudentID = '" + sID + "'");


            Vector<SchoolYearClass> vectorSC = daoSC.getAllSchoolYearClasses("select * from SchoolYear_Class where SyC_ID = '"+vectorSSC.get(0).getSyC_ID()+"'");
            Vector<Class> vectorC = daoC.getAllClasses("select * from Class where ClassID = '"+vectorSC.get(0).getClassID()+"'");
//            Vector<ClassCategory> vectorCC = daoCC.getAllClassCategories("select * from ClassCategoty where CateID = '"+vectorC.get(0).getCateID()+"'");
            Vector<ClassCategoryMenu> vectorCCM = daoCCM.getAllClassCategoryMenus("select * from ClassCategory_Menu where CateID = '"+vectorC.get(0).getCateID()+"'");

            request.setAttribute("data", vectorCCM);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ViewMenu.jsp");
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
        return "Menu Controller";
    }
}
