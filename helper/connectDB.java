/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Bhatti
 */
public class connectDB {
    public static Connection getConnection() throws Exception {
        Connection con=null;
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost/eshopping","root","");
        return con;
    }
}
