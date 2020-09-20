/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Dao;

import com.Pojo.Category;
import com.Pojo.Product;
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
public class ProductDao {

    public static int insert(Product obj) throws Exception {
        int i = 99;
        String sql = "INSERT INTO `product`(`P_name`, `P_price`, `P_pic`, `c_id`) VALUES (?,?,?,?)";
        Connection con = connectDB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, obj.getP_pname());
        ps.setString(3, obj.getP_pic());
        ps.setFloat(2, obj.getP_price());
        ps.setInt(4, obj.getC_id());
        i = ps.executeUpdate();

        return i;
    }

    public static List<Product> select() throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "select * from `product`";
        Connection con = connectDB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Product p = new Product();
            p.setC_id(rs.getInt("c_id"));
            p.setP_id(rs.getInt("P_id"));
            p.setP_pic(rs.getString("P_pic"));
            p.setP_price(rs.getFloat("P_price"));
            p.setP_pname(rs.getString("P_name"));
            list.add(p);
        }
        return list;
    }

    public static Product getProductById(int id) throws Exception {
        Product obj = new Product();
        String sql = "select * from `product` where P_id = " + id;
        Connection con = connectDB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.next();
        obj.setC_id(rs.getInt("c_id"));
        obj.setP_id(rs.getInt("P_id"));
        obj.setP_pic(rs.getString("P_pic"));
        obj.setP_price(rs.getFloat("P_price"));
        obj.setP_pname(rs.getString("P_name"));
        return obj;
    }

    public static List<Product> select(int id) throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "select * from `product` where c_id = " + id;
        Connection con = connectDB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Product p = new Product();
            p.setC_id(rs.getInt("c_id"));
            p.setP_id(rs.getInt("P_id"));
            p.setP_pic(rs.getString("P_pic"));
            p.setP_price(rs.getFloat("P_price"));
            p.setP_pname(rs.getString("P_name"));
            list.add(p);
        }
        return list;
    }

    public static List<Product> getLatestProduct() throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "select * from `product` ORDER BY P_id DESC LIMIT 3";
        Connection con = connectDB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Product p = new Product();
            p.setC_id(rs.getInt("c_id"));
            p.setP_id(rs.getInt("P_id"));
            p.setP_pic(rs.getString("P_pic"));
            p.setP_price(rs.getFloat("P_price"));
            p.setP_pname(rs.getString("P_name"));
            list.add(p);
        }
        return list;
    }

    public static int delete(int id) throws Exception{
        int i = -1;
        String sql = "delete * `product` where `P_id` = " + id;
        Connection con = connectDB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
       i= ps.executeUpdate();
        return i;
    }
    public static int update(Product obj) throws Exception{
        int i = -1;
        String sql = "UPDATE `product` SET `P_name`=?,`P_price`=?,`P_pic`=? WHERE `P_id` = "+obj.getP_id();
        Connection con = connectDB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, obj.getP_pname());
        ps.setFloat(2, obj.getP_price());
        ps.setString(3, obj.getP_pic());
       i= ps.executeUpdate();
        return i;
    }
    
}
