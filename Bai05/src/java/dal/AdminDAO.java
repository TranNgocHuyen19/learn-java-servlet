/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Admin;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Trần Ngọc Huyền
 */
public class AdminDAO extends DBContext {
    //check corrected account
    public Admin check(String username, String password) {
        String sql = "select * from Admin where Username = ? and Password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                Admin a = new Admin(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3));
                return a;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return null;
    }
    
    //insert a new account
    public boolean insert(Admin a){
        String sql = "insert Admin values (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setInt(3, a.getRole());
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return false;
    }
}
