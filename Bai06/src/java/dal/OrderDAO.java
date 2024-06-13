/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.time.LocalDate;
import model.Cart;
import model.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import model.Item;

/**
 *
 * @author Trần Ngọc Huyền
 */
public class OrderDAO extends DBContext {
    //add Order
    public void addOrder(Customer u, Cart c) {
        LocalDate curDate = LocalDate.now();
        try {
            //add into Order table
            String sql = "insert [Order] values (?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setTimestamp(1, Timestamp.valueOf(curDate.atStartOfDay()));
            st.setInt(2, u.getId());
            st.setDouble(3, c.getTotalMoney());
            st.executeUpdate();
            
            //get order id 
            String sql1 = "select top 1 id from [Order] " +
                            "order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            
            //add into OrderLine table
            if(rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : c.getItems()) {
                    String sql2 = "insert OrderLine values (?, ?, ?, ?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
