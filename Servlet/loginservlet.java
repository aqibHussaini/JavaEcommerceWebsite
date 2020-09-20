/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.Dao.UserDao;
import com.Pojo.Order;
import com.Pojo.User;
import com.helper.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Bhatti
 */
@WebServlet(name = "loginservlet", urlPatterns = {"/loginservlet"})
public class loginservlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginservlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginservlet at " + request.getContextPath() + "</h1>");
            String email,password;
            email=request.getParameter("email");
            password=request.getParameter("password");
         User u= UserDao.getUserByEmailAndPassword(email, password);
          if(u==null)
          {  
              Message m=new Message("invalid credentials! try valid credentials....","error","alert-danger");
             HttpSession ses=request.getSession();
               ses.setAttribute("msg", m);
              response.sendRedirect("Login.jsp");
          }
          else  if(u.getType().equals("user"))
          {
              List<Order> cart=new ArrayList<Order>();
               HttpSession ses=request.getSession();
               ses.setAttribute("user", u);
               ses.setAttribute("cart"+u.getId(),cart );
               response.sendRedirect("productpage.jsp");
          }
          else  if(u.getType().equals("admin"))
          {
               HttpSession ses=request.getSession();
               ses.setAttribute("admin", u);
               response.sendRedirect("admindashboard.jsp");
          }
           out.println("<h1>"+email+"</h1><h1>"+password+u.toString()+"</h1>");
            out.println("</body>");
            out.println("</html>");
        } catch (Exception ex) {
            Logger.getLogger(loginservlet.class.getName()).log(Level.SEVERE, null, ex);
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
