/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.Dao.ProductDao;
import com.Pojo.Product;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Bhatti
 */
@MultipartConfig
@WebServlet(name = "productServlet", urlPatterns = {"/productServlet"})
public class productServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
            try
            {
                Thread.sleep(2000);
            }
            catch(Exception e)
            {
                
            }
            String pname;
            float price;
            int cid;
            Part pic;
           cid=Integer.parseInt(request.getParameter("c_id"));
           pname=request.getParameter("p_name");
           price=Float.parseFloat(request.getParameter("p_price"));
           pic=request.getPart("p_pic");
            Product obj=new Product();
            obj.setC_id(cid);
            obj.setP_price(price);
            obj.setP_pic(pic.getSubmittedFileName());
            obj.setP_pname(pname);
            int i=ProductDao.insert(obj);
            if(i==1)
            {
                InputStream is=pic.getInputStream();
                byte b[]=new byte[is.available()];
                is.read(b);
                File f=new File("C:\\Users\\Bhatti\\Documents\\NetBeansProjects\\mavenproject10\\EcommrceApp\\web\\img\\"+pic.getSubmittedFileName());
                FileOutputStream fos=new FileOutputStream(f);
                fos.write(b);
                fos.close();
             out.print("product saved");
            }
            else
            {
             out.print("errorr....");
            }
        } catch (Exception ex) {
            Logger.getLogger(productServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
