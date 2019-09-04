package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
import mypackage.Doctor;

/**
 *
 * @author Laptop
 */
public class AddDoctor extends HttpServlet {

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
        try {
            Doctor d = new Doctor();
           Statement stmt = cn.createStatement();
           String dname = request.getParameter("dname");
           String did = request.getParameter("did");
           String password = request.getParameter("password"); 
           String dspecialization = request.getParameter("dspecialization");
           String gender = request.getParameter("gender");
           String dexperience = request.getParameter("dexperience");
           String dqualification = request.getParameter("dqualification");
           String dwork = request.getParameter("dwork");
           String dmerit = (request.getParameter("dmerit"));
           String mail = request.getParameter("mail");
           String address = request.getParameter("address");
           String mobile = request.getParameter("mobile");
           String dshift = request.getParameter("dshift");
           String query ="insert into doctordetails values ('"+did+"','"+dname+"','"+dspecialization+"','"+dexperience+"','"+dqualification+"','"+dwork+"','"+dshift+"','"+dmerit+"','"+mobile+"','"+mail+"','"+address+"')";
           stmt.executeUpdate(query);
           String query1 ="insert into doctorcredentials values ('"+did+"','"+password+"')";
           stmt.executeUpdate(query1);
            d.setName(dname);
            d.setId(did);
            d.setSpecialization(dspecialization);
            d.setExperience(dexperience);
            d.setQualification(dqualification);
            d.setWorkmode(dwork);
            d.setMerit(dmerit);
            d.setShift(dshift);
            d.setGender(gender);
            Long lmobile = Long.parseLong(mobile);
            d.setMobile(lmobile);
            d.setMail(mail);
            d.setAddress(address);
            d.displayDoctorDetails();
            out.println("<p>Details of Dr."+dname+" has been succesfully upated</p>");
            out.println("<a href="+"adminzone.jsp"+">Admin Zone</a>");
        } catch (Exception ex) {
            out.println("<h1>Error in registering the details of the Doctor..!!</h1>");
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
