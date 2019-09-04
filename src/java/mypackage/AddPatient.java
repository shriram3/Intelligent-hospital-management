package mypackage;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import mypackage.Patient;
public class AddPatient extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            Statement stmt = cn.createStatement();
            String pname = request.getParameter("pname");
           String pid = request.getParameter("pid");
           int height = Integer.parseInt(request.getParameter("height"));
           int weight = Integer.parseInt(request.getParameter("weight"));
           String pcategory = request.getParameter("pcategory");
           String gender = request.getParameter("gender");
           String bgroup = request.getParameter("bgroup");
           String dob = request.getParameter("dob");
           String mobile = (request.getParameter("mobile"));
           String mail = request.getParameter("mail");
           String address = request.getParameter("address");
           String gname = request.getParameter("gname");
           String gmobile =(request.getParameter("gmobile"));
           String password = request.getParameter("password");
           String query ="insert into patientdetails values ('"+pid+"','"+pname+"',"+height+","+weight+",'"+pcategory+"','"+gender+"','"+bgroup+"','"+dob+"','"+mobile+"','"+mail+"','"+address+"','"+gname+"','"+gmobile+"')";
           stmt.executeUpdate(query);
           String query1 ="insert into patientcredentials values ('"+pid+"','"+password+"')";
           stmt.executeUpdate(query1);
           System.out.println(pname);
           System.out.println(pid);
           System.out.println(height);
           System.out.println(pcategory);
           System.out.println(gender);
           System.out.println(bgroup);
           System.out.println(dob);
           System.out.println(mobile);
           System.out.println(mail);
           System.out.println(address);
           System.out.println(gname);
           System.out.println(gmobile);
//           Patient p = new Patient();
//           p.setPid(pid);
//           p.setPname(pname);
//           p.setHeight(height);
//           p.setWeight(weight);
//           p.setPcategory(pcategory);
//           p.setPgender(gender);
//           p.setBgroup(bgroup);
//           p.setDob(dob);
//           Long lmobile = Long.parseLong(mobile);
//           p.setMobile(lmobile);
//           p.setMail(mail);
//           p.setAddress(address);
//           p.setGname(gname);
//           Long lgmobile = Long.parseLong(gmobile);
//           p.setGmobile(lgmobile);
//           p.displayPatientDetails();
           if(gender.equals("Male"))
           out.println("<p>Details of Student Mr."+pname+" has been succesfully upated</p>");
           else
              out.println("<p>Details of Student Ms."+pname+" has been succesfully upated</p>");
              out.println("<a href="+"adminzone.jsp"+">Admin Zone</a>");
        }catch (Exception ex) {
                System.out.println(ex);
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
