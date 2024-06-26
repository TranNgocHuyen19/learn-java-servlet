/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;

/**
 *
 * @author Trần Ngọc Huyền
 */
public class ProductDAO extends DBContext {

    private CategoryDAO cdb = new CategoryDAO();

    //get all data in table
    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products p join Categories c on p.cid = c.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getTimestamp(5).toLocalDateTime().toLocalDate(),
                        rs.getString(6),
                        rs.getString(7),
                        cdb.getCatById(rs.getInt(8)));
                list.add(p);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    //insert a category
    public boolean insert(Product p) {
        List<Product> list = new ArrayList<>();
        String sql = "insert Products values (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getId());
            st.setString(2, p.getName());
            st.setInt(3, p.getQuantity());
            st.setDouble(4, p.getPrice());
            st.setTimestamp(5, Timestamp.valueOf(p.getReleaseDate().atStartOfDay()));
            st.setString(2, p.getName());
            st.setString(2, p.getName());
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    //find a category
    public Product getProById(String id) {
        String sql = "select * from Products where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getTimestamp(5).toLocalDateTime().toLocalDate(),
                        rs.getString(6),
                        rs.getString(7),
                        cdb.getCatById(rs.getInt(8)));
                return p;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    //delete a category 
    public boolean delete(String id) {
        List<Product> list = new ArrayList<>();
        String sql = "delete from Produtcts where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    //update a category 
    public boolean update(Product p) {
        List<Product> list = new ArrayList<>();
        String sql = "update Products set name = ?, "
                + "quantity = ?,"
                + "price = ?, "
                + "releaseDate = ?,"
                + " describe = ?,"
                + " images = ?,"
                + " cid = ?,"
                + " where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setInt(2, p.getQuantity());
            st.setDouble(3, p.getPrice());
            st.setTimestamp(4, Timestamp.valueOf(p.getReleaseDate().atStartOfDay()));
            st.setString(5, p.getName());
            st.setString(6, p.getName());
            st.setInt(7, p.getCategory().getId());
            st.setString(8, p.getId());
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    //get products by category id 
    public List<Product> getProductsByCatID(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where 1 = 1";
        if (id != 0) {
            sql += " and cid = " + id;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getTimestamp(5).toLocalDateTime().toLocalDate(),
                        rs.getString(6),
                        rs.getString(7),
                        cdb.getCatById(rs.getInt(8))
                );
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //Search product by name, releaseDate
    public List<Product> search(String key, LocalDate from, LocalDate to,
            Double price1, Double price2, int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where 1 = 1";
        if (key != null && !key.equals("")) {
            sql += " and name like '%" + key + "%'";
        }
        if (from != null) {
            sql += " and releaseDate >='" + from + "'";
        }
        if (to != null) {
            sql += " and releaseDate <='" + to + "'";
        }
        if (price1 != null) {
            sql += " and price >= " + price1;
        }
        if (price2 != null) {
            sql += " and price <= " + price2;
        }
        if (cid != 0) {
            sql += " and cid = " + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getTimestamp(5).toLocalDateTime().toLocalDate(),
                        rs.getString(6),
                        rs.getString(7),
                        cdb.getCatById(rs.getInt(8)));
                list.add(p);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    //get List of products by page
    public List<Product> getListByPage(List<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    //search Product by name
    public List<Product> searchProByName(String name) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getTimestamp(5).toLocalDateTime().toLocalDate(),
                        rs.getString(6),
                        rs.getString(7),
                        cdb.getCatById(rs.getInt(8)));
                list.add(p);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    //search Product by many category names 
    public List<Product> checkProduct(int[] id) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where 1 = 1";
        if (id != null) {
            sql += " and cid in (";
            for (int i = 0; i < id.length; i++) {
                sql += id[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                Product p = new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getTimestamp(5).toLocalDateTime().toLocalDate(),
                        rs.getString(6),
                        rs.getString(7),
                        cdb.getCatById(rs.getInt(8)));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
