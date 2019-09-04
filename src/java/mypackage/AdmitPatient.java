/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mypackage;
import mypackage.Patient;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SHRIRAM I
 */
public class AdmitPatient extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private Connection cn = null;
    ArrayList<String> mylist = new ArrayList<String>();
            ArrayList<Patient> myinplist = new ArrayList<Patient>();
            Patient p;
            Map<Integer,String> hm=new HashMap();
            TreeMap<Integer, String> sorted = new TreeMap<>();
    //ArrayList<String> mylist = new ArrayList<String>();
    ArrayList<Room> myrlist = new ArrayList<Room>();
    Room r;
    Map<Integer,String> rm=new HashMap();
    TreeMap<Integer, String> sortedr = new TreeMap<>();
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
    public void admit(ArrayList myinplist,String admitno,ArrayList myrlist)
    {
        System.out.println("\n\n\n\n\n From Admit Method");
//        for(int i=0;i<myinplist.size();i++)
//        {
//            p=(Patient) myinplist.get(i);
//            //p.display();
//            hm.put(p.getAge(),p.getPid());
//        }
        for(int i=0;i<myrlist.size();i++)
        {
            p=(Patient) myinplist.get(i);
            p.display();
        }
        for(int i=0;i<myrlist.size();i++)
        {
            r=(Room) myrlist.get(i);
            r.toString();
        }
//        sorted.putAll(hm);
//        for (Map.Entry<Integer, String> entry : sorted.entrySet()) { 
//            System.out.println("Insorted loop");
//            System.out.println("Key = " + entry.getKey() +  
//                         ", Value = " + entry.getValue());
//        }
        
        
    }
    public int findPriority(int age,String diseasecategory)
    {
        if((age>0&&age<3)||(age>60))
        {
            return 1;
        }
        else if(age>30&&age<60)
        {
            return 2;
        }
        else
        {
            return 3;
        }
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            //try (PrintWriter out = response.getWriter()) {
            Statement stmt = cn.createStatement();
            
            int noip=0;
            String admitno="";
            String pname = request.getParameter("pname");
           String pid = request.getParameter("pid");
           int age = Integer.parseInt(request.getParameter("age"));
           //int weight = Integer.parseInt(request.getParameter("weight"));
           //String pcategory = request.getParameter("pcategory");
           String gender = request.getParameter("gender");
           String admitfor = request.getParameter("admitfor");
           String rdoc = request.getParameter("rdoc");
           String mobile = (request.getParameter("mobile"));
           String mail = request.getParameter("mail");
           String address = request.getParameter("address");
           String disease = request.getParameter("disease");
           Date now = new Date();
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        String admitdate = formatter.format(now);
           String query ="INSERT INTO `admission` (`admissionno`, `pname`, `pid`, `age`, `gender`, `diseasecategory`, `admitfor`, `refdoc`, `mobile`, `mailid`, `address`, `admissiondate`, `dischargedate`) VALUES (NULL, '"+pname+"', '"+pid+"', '"+age+"', '"+gender+"', '"+disease+"', '"+admitfor+"', '"+rdoc+"', '"+mobile+"', '"+mail+"', '"+address+"', '"+admitdate+"', NULL);";
            System.out.println(query);
            System.out.println(admitdate);
           int a=stmt.executeUpdate(query);
            System.out.println(admitdate+","+pid);
           String query1="select * from admission where pid='"+pid+"' ";
           ResultSet rs=stmt.executeQuery(query1);
           while(rs.next())
           {
               if(rs.getString("admissiondate").equals(admitdate))
               {
                admitno = rs.getString("admissionno");
                break;
               }
           }
            System.out.println(admitno);
           if(a!=0)
           {
               String myinpatientsquery = "select * from room where admissionno is not null";
               ResultSet iprs = stmt.executeQuery(myinpatientsquery);
               while(iprs.next())
               {
                   mylist.add(iprs.getString("admissionno"));
                   noip = noip+1;
               }
               for(String str : mylist)
               {
                   System.out.println(str);
               }
               for(String str : mylist)
               {
                   String mydquery = "select * from admission where admissionno='"+ str+"'";
                   ResultSet myrs1 = stmt.executeQuery(mydquery);
                   while(myrs1.next())
                   {
                       Patient p = new Patient();
                       p.setPid(myrs1.getString("pid"));
                       p.setAdmitno(Integer.parseInt(myrs1.getString("admissionno")));
                       p.setPname(myrs1.getString("pname"));
                       p.setAdmitfor(myrs1.getString("admitfor"));
                       p.setDcategory(myrs1.getString("diseasecategory"));
                       p.setRefdoc(myrs1.getString("refdoc"));
                       p.setGender(myrs1.getString("gender"));
                       p.setAge(Integer.parseInt(myrs1.getString("age")));
                       p.setAddate(myrs1.getString("admissiondate"));
                       p.setPriority(findPriority(p.getAge(),p.getDcategory()));
                       myinplist.add(p);
                   }   
               }
               
                //loading room information
               String myroomquery = "select * from room";
               ResultSet rss = stmt.executeQuery(myroomquery);
               while(rss.next())
                   {
                       Room r=new Room();
                       r.setAdmissionno(Integer.parseInt(rss.getString("admissionno")));
                       r.setDisease(rss.getString("disease"));
                       r.setRoomid(Integer.parseInt(rss.getString("roomid")));
                       r.setPatientid(rss.getString("patientid"));
                       r.setFloor(Integer.parseInt(rss.getString("floor")));
                       myrlist.add(r);
                   }
               
               admit(myinplist,admitno,myrlist);
               //System.out.println("There are "+ noip +"Patients admitted in room");
               RequestDispatcher re=request.getRequestDispatcher("admission.jsp");
               request.setAttribute("admitno",admitno);
               re.forward(request, response);
           }
           else
           {
               System.out.print("In else");
           }
        }
        catch(Exception e)
        {
            System.out.println(e);
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
