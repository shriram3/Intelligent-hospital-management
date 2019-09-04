package mypackage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 *
 * @author Laptop
 */
public class Appointment extends HttpServlet {

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
        PrintWriter out = response.getWriter();
         String pid = null;
         String did = null;
        try{
            Statement stmt = cn.createStatement();
           pid = request.getParameter("pid");
           did = request.getParameter("did");
           String symptoms = request.getParameter("symptoms");
           String date = request.getParameter("adate");
            System.out.println(pid+did+symptoms+date);
            String query = "insert into appointment values('"+pid+"','"+did+"','"+date+"','"+symptoms+"')";
            int i = stmt.executeUpdate(query);
           //System.out.println("printing i"+i);
            if(i==1){;}
            RequestDispatcher dispatcher = request.getRequestDispatcher("patientzone.jsp");
            request.setAttribute("patientid",pid);
            //request.setAttribute("patid",pid);
            //request.setAttribute("dno",did);
            dispatcher.forward( request, response );
        }catch(Exception ex)
                {
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
