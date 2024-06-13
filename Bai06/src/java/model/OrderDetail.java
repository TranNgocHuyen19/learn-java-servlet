/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Trần Ngọc Huyền
 */
public class OrderDetail {
    private Order o;
    private Product p;
    private int quantity;
    private double price;

    public OrderDetail() {
    }

    public OrderDetail(Order o, Product p, int quantity, double price) {
        this.o = o;
        this.p = p;
        this.quantity = quantity;
        this.price = price;
    }

    public Order getO() {
        return o;
    }

    public void setO(Order o) {
        this.o = o;
    }

    public Product getP() {
        return p;
    }

    public void setP(Product p) {
        this.p = p;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
}
