package mypackage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
public class AlotRoomServlet extends HttpServlet {

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
        String act = request.getParameter("mybutton");
        try (PrintWriter out = response.getWriter()) {
            String var;
            var = (String) request.getSession().getAttribute("v1");
            if(act.equals("Alot R_01"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_01";
                String query = "update roomallot set rstatus ='"+var+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("VACATE R_01"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_01";
                String status="vacated";
                String query = "update roomallot set rstatus ='"+status+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("Alot R_02"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_02";
                String query = "update roomallot set rstatus ='"+var+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("VACATE R_02"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_02";
                String status="vacated";
                String query = "update roomallot set rstatus ='"+status+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("Alot R_03"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_03";
                String query = "update roomallot set rstatus ='"+var+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("VACATE R_03"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_03";
                String status="vacated";
                String query = "update roomallot set rstatus ='"+status+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("Alot R_05"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_05";
                String query = "update roomallot set rstatus ='"+var+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("VACATE R_05"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_05";
                String status="vacated";
                String query = "update roomallot set rstatus ='"+status+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("Alot R_06"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_06";
                String query = "update roomallot set rstatus ='"+var+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("VACATE R_06"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_06";
                String status="vacated";
                String query = "update roomallot set rstatus ='"+status+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("Alot R_08"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_08";
                String query = "update roomallot set rstatus ='"+var+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("VACATE R_08"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_08";
                String status="vacated";
                String query = "update roomallot set rstatus ='"+status+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("Alot R_09"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_09";
                String query = "update roomallot set rstatus ='"+var+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("VACATE R_09"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_09";
                String status="vacated";
                String query = "update roomallot set rstatus ='"+status+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("Alot R_10"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_10";
                String query = "update roomallot set rstatus ='"+var+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            if(act.equals("VACATE R_10"))
            {
                try{
                Statement stmt = cn.createStatement();
                String id = "r_10";
                String status="vacated";
                String query = "update roomallot set rstatus ='"+status+"' where roomid='"+id+"'";
                stmt.executeUpdate(query);
                }catch(Exception ex){System.out.println(ex);}
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminzone.jsp");
                dispatcher.forward( request, response );
            }
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet check</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet check at " + var+act+request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
