package model;

import entity.Curriculum;
import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOCurriculum extends DBConnect {

    public int insertCurriculum(Curriculum curriculum) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Curriculum] (CurID, CurName, CateID) VALUES (?, ?, ?)";
        try (PreparedStatement pre = conn.prepareStatement(sql)) {
            pre.setString(1, curriculum.getCurID());
            pre.setString(2, curriculum.getCurName());
            pre.setString(3, curriculum.getCateID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCurriculum.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateCurriculum(Curriculum curriculum) {
        int n = 0;
        String sql = "UPDATE [dbo].[Curriculum] SET CurName = ?, CateID = ? WHERE CurID = ?";
        try (PreparedStatement pre = conn.prepareStatement(sql)) {
            pre.setString(1, curriculum.getCurName());
            pre.setString(2, curriculum.getCateID());
            pre.setString(3, curriculum.getCurID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCurriculum.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int removeCurriculum(String curID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Curriculum] WHERE CurID = ?";
        try (PreparedStatement pre = conn.prepareStatement(sql)) {
            pre.setString(1, curID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCurriculum.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Curriculum> getAllCurriculums(String sql) {
        Vector<Curriculum> vector = new Vector<>();
        try (Statement state = conn.createStatement(
                ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_UPDATABLE); ResultSet rs = state.executeQuery(sql)) {
            while (rs.next()) {
                String curID = rs.getString("CurID");
                String curName = rs.getString("CurName");
                String cateID = rs.getString("CateID");
                Curriculum curriculum = new Curriculum(curID, curName, cateID);
                vector.add(curriculum);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCurriculum.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Curriculum getCurriculumByID(String curID) {
        Curriculum curriculum = null;
        String sql = "SELECT * FROM Curriculum WHERE CurID = ?";
        try (PreparedStatement pre = conn.prepareStatement(sql)) {
            pre.setString(1, curID);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    String curName = rs.getString("CurName");
                    String cateID = rs.getString("CateID");
                    curriculum = new Curriculum(curID, curName, cateID);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCurriculum.class.getName()).log(Level.SEVERE, null, ex);
        }
        return curriculum;
    }

    public static void main(String[] args) {
        DAOCurriculum dao = new DAOCurriculum();
        int n = dao.insertCurriculum(new Curriculum("CR001", "Mathematics Curriculum", "CC001"));
        if (n > 0) {
            System.out.println("Inserted");
        }
        Vector<Curriculum> vector = dao.getAllCurriculums("SELECT * FROM Curriculum");
        for (Curriculum curriculum : vector) {
            System.out.println(curriculum.getCurID() + " - " + curriculum.getCurName() + " - " + curriculum.getCateID());
        }
    }
}
