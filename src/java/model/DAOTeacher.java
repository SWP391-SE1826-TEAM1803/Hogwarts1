package model;

import entity.Teacher;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOTeacher extends DBConnect {

    public int insertTeacher(Teacher teacher) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Teacher]\n"
                + "           ([TeacherID]\n"
                + "           ,[UserID]\n"
                + "           ,[Degree])\n"
                + "     VALUES(?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, teacher.getTeacherID());
            pre.setString(2, teacher.getUserID());
            pre.setString(3, teacher.getDegree());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateTeacher(Teacher teacher) {
        int rowsAffected = 0;
        String sql = "UPDATE Teacher SET UserID = ?, Degree = ? WHERE TeacherID = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, teacher.getUserID());
            pstmt.setString(2, teacher.getDegree());
            pstmt.setString(3, teacher.getTeacherID());
            rowsAffected = pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return rowsAffected;
    }

    public int removeTeacher(String teacherID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Teacher] WHERE [TeacherID] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, teacherID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTeacher.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Teacher> getAllTeachers(String sql) {
        Vector<Teacher> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String teacherID = rs.getString(1);
                String userID = rs.getString(2);
                String degree = rs.getString(3);
                Teacher teacher = new Teacher(teacherID, userID, degree);
                vector.add(teacher);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTeacher.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<Teacher> searchTeachers(String keyword) {
        Vector<Teacher> vector = new Vector<>();
        String sql = "SELECT * FROM Teacher WHERE TeacherID LIKE ? OR UserID IN (SELECT UserID FROM [User] WHERE FullName LIKE ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, "%" + keyword + "%");
            pre.setString(2, "%" + keyword + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String teacherID = rs.getString(1);
                String userID = rs.getString(2);
                String degree = rs.getString(3);
                Teacher teacher = new Teacher(teacherID, userID, degree);
                vector.add(teacher);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTeacher.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

//    public Vector<Teacher> getAllBasicTeacherInfoWithFullName() {
//        Vector<Teacher> vector = new Vector<>();
//        String sql = "SELECT Teacher.TeacherID, [User].FullName, Teacher.Degree "
//                + "FROM Teacher "
//                + "INNER JOIN [User] ON Teacher.UserID = [User].UserID";
//        try {
//            PreparedStatement statement = conn.prepareStatement(sql);
//            ResultSet rs = statement.executeQuery();
//            while (rs.next()) {
//                String teacherID = rs.getString("TeacherID");
//                String fullName = rs.getString("FullName");
//                String degree = rs.getString("Degree");
//                // Tạo đối tượng Teacher và thiết lập thông tin
//                Teacher teacher = new Teacher(teacherID, fullName, degree);
//                vector.add(teacher);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(DAOTeacher.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return vector;
//    }

    public Teacher searchTeacherByID(String teacherID) {
        String sql = "SELECT * FROM Teacher WHERE TeacherID = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, teacherID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String userID = rs.getString("UserID");
                String degree = rs.getString("Degree");
                return new Teacher(teacherID, userID, degree);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTeacher.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null; // Trả về null nếu không tìm thấy giáo viên
    }

    public static void main(String[] args) {
        DAOTeacher dao = new DAOTeacher();
//        int n = dao.insertTeacher(new Teacher("T001", "U001", "PhD"));
//        if (n > 0) {
//            System.out.println("Inserted");
//        }
        Teacher new1 = new Teacher("TE002", "TE002", "Basic Degree");
        dao.updateTeacher(new1);
//        for (Teacher teacher : vector) {
//            System.out.println(teacher.getTeacherID() + " - " + teacher.getUserID() + " - " + teacher.getDegree());
//        }
    }
}
