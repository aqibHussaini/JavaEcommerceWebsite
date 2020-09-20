/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Dao;

import com.Pojo.Order;
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
public class OrderDao {
    public static int SaveOrder(Order obj)throws Exception
    {
        int i=9999;
        String sql="INSERT INTO `ordertable`( `user_id`, `P_id`, `user_name`, `name`, `price`, `quantity`) VALUES (?,?,?,?,?,?)";
        Connection con=connectDB.getConnection();
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setInt(1, obj.getUser_id());
        ps.setInt(2, obj.getP_id());
        ps.setString(3, obj.getUser_name());
        ps.setString(4, obj.getName());
        ps.setFloat(5, obj.getPrice()* obj.getQuantity());
        ps.setInt(6, obj.getQuantity());
        i=ps.executeUpdate();
        return i;
    }
        public static List<Order> select() throws Exception {
        List<Order> list = new ArrayList<>();
        String sql = "select * from `ordertable`";
        Connection con = connectDB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Order o = new Order();
           o.setO_id(rs.getInt("O_id"));
           o.setP_id(rs.getInt("P_id"));
           o.setQuantity(rs.getInt("quantity"));
           o.setUser_id(rs.getInt("user_id"));
           o.setName(rs.getString("name"));
           o.setUser_name(rs.getString("user_name"));
           o.setPrice(rs.getFloat("price"));
           o.setTime(rs.getTimestamp("time"));
            list.add(o);
        }
        return list;
    }
}
