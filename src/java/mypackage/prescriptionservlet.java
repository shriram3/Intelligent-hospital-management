/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Laptop
 */
public class prescriptionservlet extends HttpServlet {

private Connection cn = null;
    public void init(ServletConfig sc) throws ServletException
    {
        
        try
        {
            super.init(sc);
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdldb","root","shri");
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        } 
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try  {
            response.setContentType("text/html;charset=UTF-8");
            Statement stmt = cn.createStatement();
            PrintWriter out = response.getWriter();
            try  {
                
                String pid = request.getParameter("pid");
                String did = request.getParameter("did");
                String prescriptions = request.getParameter("prescription");
                String date = request.getParameter("date");
                String query = "insert into prescriptions values('"+pid+"','"+did+"','"+prescriptions+"','"+date+"')";
                stmt.executeUpdate(query);
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet prescriptionservlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet prescriptionservlet at " + request.getContextPath() + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }catch(Exception ex)
            {
                System.out.println(ex);}
        }catch(SQLException ex)
        {   
            Logger.getLogger(prescriptionservlet.class.getName()).log(Level.SEVERE, null,ex);}
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