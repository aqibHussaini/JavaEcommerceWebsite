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
public class User {
    private int id ;
   private String name,email,about,password,Gender,pic,type;
  private  Timestamp time;

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + ", email=" + email + ", about=" + about + ", password=" + password + ", Gender=" + Gender + ", pic=" + pic + ", type=" + type + ", time=" + time + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
    public User(String name, String email, String about, String password, String Gender, String pic, String type, Timestamp time) {
        this.name = name;
        this.email = email;
        this.about = about;
        this.password = password;
        this.Gender = Gender;
        this.pic = pic;
        this.type = type;
        this.time = time;
    }

    public User(int id, String name, String email, String about, String password, String Gender, String pic, String type, Timestamp time) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.about = about;
        this.password = password;
        this.Gender = Gender;
        this.pic = pic;
        this.type = type;
        this.time = time;
    }

    public User() {
    }

}