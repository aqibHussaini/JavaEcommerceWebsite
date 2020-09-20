/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Dao;

import com.Pojo.Product;
import com.Pojo.User;
import com.helper.connectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Bhatti
 */
public class UserDao {

    public static int saveUser(User obj) throws Exception {
        int i = 999;
        Connection c = connectDB.getConnection();
        String sql = "INSERT INTO `user`( `name`, `email`, `about`, `password`, `Gender`, `pic`, `type`) VALUES (?,?,?,?,?,?,'user')";
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setString(1, obj.getName());
        ps.setString(2, obj.getEmail());
        ps.setString(3, obj.getAbout());
        ps.setString(4, obj.getPassword());
        ps.setString(5, obj.getGender());
        ps.setString(6, obj.getPic());
        i = ps.executeUpdate();
        return i;
    }

    public static User getUserByEmailAndPassword(String email, String password) throws Exception {
        String q = "SELECT * FROM `user` ";
        Connection con = connectDB.getConnection();
        PreparedStatement ps = (PreparedStatement) con.prepareStatement(q);
        ResultSet rs = ps.executeQuery();
        User u = null;
        while (rs.next()) {
            String email1 = rs.getString("email");
            String password1 = rs.getString("password");
            if (email1.equals(email) && password1.equals(password)) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setPic(rs.getString("pic"));
                u.setAbout(rs.getString("about"));
                u.setType(rs.getString("type"));
                u.setGender(rs.getString("gender"));
                u.setTime(rs.getTimestamp("time"));
                break;
            }

        }
        return u;
    }

    public static List<User> select() throws Exception {
        List<User> list = new ArrayList<>();
        String sql = "select * from `User`";
        Connection con = connectDB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            User u = new User();
            u.setId(rs.getInt("id"));
            u.setName(rs.getString("name"));
            u.setEmail(rs.getString("email"));
            u.setPassword(rs.getString("password"));
            u.setPic(rs.getString("pic"));
            u.setAbout(rs.getString("about"));
            u.setType(rs.getString("type"));
            u.setGender(rs.getString("gender"));
            u.setTime(rs.getTimestamp("time"));
            list.add(u);
        }
        return list;
    }
}
