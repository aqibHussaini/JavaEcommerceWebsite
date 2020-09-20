/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.Dao.UserDao;
import com.Pojo.User;
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
@WebServlet(name = "registerServlet", urlPatterns = {"/registerServlet"})
public class registerServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            try
            {
                Thread.sleep(2000);
            }
            catch(Exception e)
            {
                
            }
            String name,email,password,gender,about;
            Part pic;
            name=request.getParameter("name");
            email=request.getParameter("email");
            password=request.getParameter("password");
            gender=request.getParameter("Gender");
            about=request.getParameter("about");
            pic=request.getPart("pic");
            User obj=new User();
            obj.setName(name);
            obj.setEmail(email);
            obj.setAbout(about);
            obj.setGender(gender);
            obj.setPassword(password);
            obj.setPic(pic.getSubmittedFileName());
           int i= UserDao.saveUser(obj);
  
        if(i==1)
            {
                InputStream is=pic.getInputStream();
                byte b[]=new byte[is.available()];
                is.read(b);
                File f=new File("C:\\Users\\Bhatti\\Documents\\NetBeansProjects\\mavenproject10\\EcommrceApp\\web\\img\\"+pic.getSubmittedFileName());
                FileOutputStream fos=new FileOutputStream(f);
                fos.write(b);
                fos.close();
                out.println("servlet says success");  
            }
          
        else
        {
                 out.println("servlet says error"); 
                }
        } catch (Exception ex) {
            Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
