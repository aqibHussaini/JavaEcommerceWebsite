/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.Dao.CategoryDao;
import com.Pojo.Category;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bhatti
 */
@WebServlet(name = "Categoryservlet", urlPatterns = {"/Categoryservlet"})
public class Categoryservlet extends HttpServlet {

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
            out.println("<title>Servlet Categoryservlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Categoryservlet at " + request.getContextPath() + "</h1>");
            String cname,cdescription;
            cname=request.getParameter("c_name");
            cdescription=request.getParameter("c_description");
            Category obj=new Category();
            obj.setC_name(cname);
            obj.setC_description(cdescription);
           int i= CategoryDao.insert(obj);
          if(i==1)
           {
              out.println("<script>alert('category saved')</script>");  
           out.println("<a href='category_form.jsp'>back</a>");
           }
           else
           {
               out.println("<script>alert('errorr ')</script>"); 
                out.println("<a href='category_form.jsp'>back</a>");
           }
           
            out.println("</body>");
            out.println("</html>");
        } catch (Exception ex) {
              response.getWriter().println("<h1>"+ex.getMessage()+"</h1>");
            Logger.getLogger(Categoryservlet.class.getName()).log(Level.SEVERE, null, ex);
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
