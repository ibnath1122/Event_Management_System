/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author meher
 */
public class CateringInfo {
    
    private int catering_id, quantity, price;
    private String categories, item;

    public CateringInfo(int catering_id, int quantity, int price,  String categories, String item) {
        this.catering_id = catering_id;
        this.quantity = quantity;
        this.price = price;
        this.categories=categories;
        this.item = item;
        

    }

    public int getcatering_id() {
        return catering_id;
    }

    public int getquantity() {
        return quantity;
    }

    public int getprice() {
        return price;
    }
    
   

    public String getcategories() {
        return categories;
    }

    public String getitem() {
        return item;
    }

    
    
}
