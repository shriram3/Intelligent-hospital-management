/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Laptop
 */
public class Admincheckservlet extends HttpServlet {
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            Statement stmt = cn.createStatement();
            String id =request.getParameter("id");
            String password = request.getParameter("password");
            System.out.println(id+" , "+password);
            String query="select * from admincredentials where id='"+id+"'";
            ResultSet rs = stmt.executeQuery(query);
            String rpassword = null,rid = null;
            while(rs.next())
            {
               rpassword = rs.getString("password");
               rid = rs.getString("id");
            }
            if(rpassword.equals(password) && rid.equals(id))
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            else
            {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Invalid Credentials</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet Admincheckservlet at " + id + "</h1><h>"+id+"<h>");
                out.println("</body>");
                out.println("</html>");
            
        }
        }catch(Exception ex){System.out.println(ex);}
    }
    public void destroy()
       {
          try
          {
             if (cn!=null) 
             {
                 cn.close();
             }
          } catch (Exception ex) {
            System.out.println(ex);
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
