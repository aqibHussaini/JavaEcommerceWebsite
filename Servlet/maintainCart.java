/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.Pojo.Order;
import com.Pojo.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "maintainCart", urlPatterns = {"/maintainCart"})
public class maintainCart extends HttpServlet {

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
            String work;
            int id;
                int k=0;
           work= request.getParameter("do");
           id=Integer.parseInt(request.getParameter("id"));
           // fetching session data
                HttpSession ses=request.getSession();
                User u=(User)ses.getAttribute("user");
             List<Order> list  = (List<Order>)ses.getAttribute("cart"+u.getId());
            if(work.equals("add"))
            {
               
              for(Order order:list)
            {
               if(order.getP_id()==id)
               {
                  int q= order.getQuantity();
                  q++;
                  order.setQuantity(q);
                  k=1;
                  break;
               }
            }
              
            }
            else  if(work.equals("sub"))
            {
                
              for(Order order:list)
            {
               if(order.getP_id()==id)
               {
                   
                  int q= order.getQuantity();
                  q--;
                  order.setQuantity(q);
                  k=1;
                  break;
               }
            }
            }
            else  if(work.equals("remove"))
            {
         
              for(Order order:list)
            {
               if(order.getP_id()==id)
               {
                   
                  list.remove(order);
                  k=1;
                  break;
               }
            }
            }
                
            if(k==1 && work.equals("add"))
            {
                out.print("quantity increased....");
            }
            else if(k==1 && work.equals("sub"))
            {
                out.print("quantity decreased....."); 
            }
            else if(k==1 && work.equals("remove"))
            {
                out.print("item removed...."); 
            }
               ses.setAttribute("cart"+u.getId(), list);
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
