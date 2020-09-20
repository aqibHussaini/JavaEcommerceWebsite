/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.Dao.ProductDao;
import com.Pojo.Order;
import com.Pojo.Product;
import com.Pojo.User;
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
@WebServlet(name = "cartServlet", urlPatterns = {"/cartServlet"})
public class cartServlet extends HttpServlet {

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
            out.println("<title>Servlet cartServlet</title> ");            
           out.println("</head>");
            out.println("<body >");
            int id=Integer.parseInt(request.getParameter("id"));
            HttpSession s=request.getSession();
              User u=(User)s.getAttribute("user");
            List<Order> o=(List<Order>)s.getAttribute("cart"+u.getId());
       
            int rememmber=-99;
            for(Order order:o)
            {
               if(order.getP_id()==id)
               {
                  int q= order.getQuantity();
                  q++;
                  order.setQuantity(q);
                  rememmber=1;
                  break;
               }
            }
            if(rememmber==1)
            {
            out.println("<script>alert('items quantity modified....')</script>");
            }
            if(rememmber!=1||o.size()==0)
            {
             storeNewOrder(u,id,o); 
               out.println("<script>alert('addeed to cart')</script>");
            }
            
            s.setAttribute("cart",o);
            out.println("<div ><a href='productpage.jsp'>View Products</a></div>");
            out.println("</body>");
            out.println("</html>");
        } catch (Exception ex) {
            Logger.getLogger(cartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
public  void storeNewOrder(User u ,int id,List<Order> o) throws Exception
{
               Order order  =new Order();
               Product p =  ProductDao.getProductById(id);
               order.setP_id(p.getP_id());
               order.setQuantity(1);
               order.setName(p.getP_pname());
               order.setPrice(p.getP_price());
               order.setUser_id(u.getId());
               order.setUser_name(u.getName());  
               o.add(order);
}
}
