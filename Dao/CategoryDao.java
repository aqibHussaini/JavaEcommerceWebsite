/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Dao;

import com.Pojo.Category;
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
public class CategoryDao {

    public static int insert(Category obj) throws Exception {
        String sql = "insert into `category`(`c_name`,`c_description`) values(?,?)";
        int i = 99;
        Connection con = connectDB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, obj.getC_name());
        ps.setString(2, obj.getC_description());
        i = ps.executeUpdate();
        return i;
    }

    public static List<Category> select() throws Exception {
        List<Category> list = new ArrayList<>();
        String sql = "select * from `category`";
        Connection con = connectDB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Category c = new Category();
            c.setC_id(rs.getInt("c_id"));
            c.setC_name(rs.getString("c_name"));
            c.setC_description(rs.getString("c_description"));
            list.add(c);
        }
        return list;
    }

    public static Category select(int id) throws Exception {
        Category obj = new Category();
        String sql = "select * from `category`";
        Connection con = connectDB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.next();
        obj.setC_id(rs.getInt("c_id"));
        obj.setC_name(rs.getString("c_name"));
        obj.setC_description(rs.getString("c_description"));
        return obj;
    }

    public static int delete(int id) throws Exception {
        int i = 99;
        String sql = "delete * from `category` where c_id " + id;
        Connection con = connectDB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        i = ps.executeUpdate();
        return i;
    }

    public static int delete(Category obj) throws Exception {
        int i = 99;
        String sql = "UPDATE `category` SET `c_name`=?,`c_description`=?  where c_id " + obj.getC_id();
        Connection con = connectDB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, obj.getC_name());
        ps.setString(2, obj.getC_description());
        i = ps.executeUpdate();
        return i;
    }
}
