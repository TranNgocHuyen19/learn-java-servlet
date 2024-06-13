/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Trần Ngọc Huyền
 */
public class Cart {
    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    //get quantity by id
    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }
    
    //find item by id
    private Item getItemById(int id) {
        for (Item i : items) {
            if(i.getProduct().getId() == id) 
                return i;
        }
        return null;
    }
    
    //add item 
    public void addItem(Item t) {
        if(getItemById(t.getProduct().getId()) != null) {
            Item m = getItemById(t.getProduct().getId());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }
    
    //remove item
    public void removeItem(int id){
        if(getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }
    
    //get total money 
    public double getTotalMoney() {
        double total = 0;
        for(Item i: items){
            total += (i.getQuantity() * i.getProduct().getPrice());
        }
        return total;
    }
    
}
