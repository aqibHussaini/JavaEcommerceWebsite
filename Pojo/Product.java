/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Pojo;

/**
 *
 * @author Bhatti
 */
public class Product {
 private int p_id,c_id;
 private String P_pname,P_pic;

    public Product() {
    }
 private float p_price;

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getP_pname() {
        return P_pname;
    }

    public void setP_pname(String P_pname) {
        this.P_pname = P_pname;
    }

    public String getP_pic() {
        return P_pic;
    }

    public void setP_pic(String P_pic) {
        this.P_pic = P_pic;
    }

    public float getP_price() {
        return p_price;
    }

    public void setP_price(float p_price) {
        this.p_price = p_price;
    }

    public Product(int c_id, String P_pname, String P_pic, float p_price) {
        this.c_id = c_id;
        this.P_pname = P_pname;
        this.P_pic = P_pic;
        this.p_price = p_price;
    }

    public Product(int p_id, int c_id, String P_pname, String P_pic, float p_price) {
        this.p_id = p_id;
        this.c_id = c_id;
        this.P_pname = P_pname;
        this.P_pic = P_pic;
        this.p_price = p_price;
    }
}
