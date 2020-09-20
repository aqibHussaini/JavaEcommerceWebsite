/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Pojo;

import java.sql.Timestamp;

/**
 *
 * @author Bhatti
 */
public class Order {
    
    private int user_id,P_id,O_id,quantity;
    private String user_name,name;

    @Override
    public String toString() {
        return "Order{" + "user_id=" + user_id + ", P_id=" + P_id + ", O_id=" + O_id + ", quantity=" + quantity + ", user_name=" + user_name + ", name=" + name + ", price=" + price + ", time=" + time + '}';
    }
    float price;
    Timestamp time;

    public Order(int user_id, int P_id, int O_id, int quantity, String user_name, String name, float price, Timestamp time) {
        this.user_id = user_id;
        this.P_id = P_id;
        this.O_id = O_id;
        this.quantity = quantity;
        this.user_name = user_name;
        this.name = name;
        this.price = price;
        this.time = time;
    }

    public Order(int user_id, int P_id, int quantity, String user_name, String name, float price, Timestamp time) {
        this.user_id = user_id;
        this.P_id = P_id;
        this.quantity = quantity;
        this.user_name = user_name;
        this.name = name;
        this.price = price;
        this.time = time;
    }

    public Order() {
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getP_id() {
        return P_id;
    }

    public void setP_id(int P_id) {
        this.P_id = P_id;
    }

    public int getO_id() {
        return O_id;
    }

    public void setO_id(int O_id) {
        this.O_id = O_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
  
}
