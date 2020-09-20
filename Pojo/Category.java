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
public class Category 
{
    private int c_id;
    private String c_name,c_description;

    @Override
    public String toString() {
        return "Category{" + "c_id=" + c_id + ", c_name=" + c_name + ", c_description=" + c_description + '}';
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public String getC_description() {
        return c_description;
    }

    public void setC_description(String c_description) {
        this.c_description = c_description;
    }

    public Category() {
    }

    public Category(int c_id, String c_name, String c_description) {
        this.c_id = c_id;
        this.c_name = c_name;
        this.c_description = c_description;
    }

    public Category(String c_name, String c_description) {
        this.c_name = c_name;
        this.c_description = c_description;
    }
    
}
