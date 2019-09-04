<%@page import="java.sql.*"%>
<html>
<head>
	<title>Patient Zone</title>
		<link rel="icon" href="download.png">
		<link rel="stylesheet" type="text/css" href="admin.css" >
                <script>
                function myFunction() {
                        var name = prompt("Enter the Doctor ID :");
                            window.location.replace("patientzone.jsp?name="+name);
                        }
                        function myShift() {
                        var shift = prompt("Enter the Shift :");
                            window.location.replace("patientzone.jsp?shift="+shift);
                        } 
                </script>
</head>
<body>
        <%!
           private Connection cn = null; 
           String pid=null;
           String pname =null;
           String height =null;
           String weight = null;
           String pcategory = null;
           String pgender =null;
           String bgroup = null;
           String dob = null;
           String mobile = null;
           String mail = null;
           String address= null;
           String gname = null;
           String gmobile = null;
           String userid;
                   ;%>
         <%
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdldb","root","shri"); 
            Statement stmt = cn.createStatement();
            userid=(String)request.getAttribute("patid");
            %>
          <% 
              String query ="select * from patientdetails where pid='"+userid+"'";    
              ResultSet rs = stmt.executeQuery(query);
              while(rs.next())
              {
                 pid =  rs.getString("pid");
                 pname = rs.getString("pname");
                 height = rs.getString("height");
                 weight = rs.getString("weight");
                 pcategory = rs.getString("pcategory");
                 bgroup = rs.getString("bgroup");
                 dob = rs.getString("dob");
                 pgender = rs.getString("pgender");
                 mobile = rs.getString("mobile");
                 mail =rs.getString("mail"); 
                 address= rs.getString("address");
                 gname =rs.getString("gname");
                 gmobile = rs.getString("gmobile");
              }
           %>
	<div id="head">
		<img id="logo" src="download.png" width="70px" height="70px">
		<center>
			<h1>Meenakshi Mission Hospital and Research Center,Madurai</h1>
			<h4> "Health is Wealth" </h4>
			<h3>Email: mmhrc@gmail.com &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Contact no: 0452-2331733(30Lines) &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Fax : +91 4562-111 </h3>
		</center>
	</div>
	<div id="big">
		<div class="tabPanel-widget">
			<label for="tab-1" tabindex="0"></label>
			<input id="tab-1" type="radio" name="tabs"  aria-hidden="true">
			<h2>MY PROFILE</h2>
                        <div>   
                            <div style="position:absolute;left:2cm;top:3cm;" >
                                <h1><i>Profile :</i></h1>
                            <table cellpadding="10" cellspacing="3"  >
                            <tr bgcolor="lightblue">
                                <td>Patient ID :</td>
                                 <td><%= pid %></td>
                            </tr>
                            <tr bgcolor="lightyellow">
                                <td>Patient Name :</td>
                                <td><%= pname%></td>
                            </tr>
                            <tr bgcolor="lightblue">
                                <td>Height :</td>
                                <td><%= height%></td>
                            </tr>
                            <tr bgcolor="lightyellow">
                                <td>Weight :</td>
                                <td><%=weight%></td>
                            </tr>
                            <tr bgcolor="lightblue">
                                <td>Gender :</td>
                                <td><%= pgender %></td>
                            </tr>
                            <tr bgcolor="lightyellow">
                                <td>Date of Birth :</td>
                                <td><%= dob%></td>
                            </tr>
                            <tr bgcolor="lightblue">
                                <td>Blood Group :</td>
                                <td><%= bgroup %></td>
                             </tr>
                             <tr bgcolor="lightyellow">
                                 <td>Category :</td>
                       <td><%= pcategory %></td>
                   </tr>
                   <tr bgcolor="lightblue">
                       <td>Email-ID :</td>
                       <td><%= mail %></td>
                   </tr>
                   <tr bgcolor="lightyellow">
                       <td>Mobile :</td>
                       <td><%= mobile %></td>
                   </tr>
                   <tr bgcolor="lightblue">
                       <td>Address :</td>
                       <td><%= address%></td>
                   </tr>
                   <tr bgcolor="lightyellow">
                       <td>Guardian Name :</td>
                       <td><%= gname %></td>
                   </tr>
                   <tr bgcolor="lightblue">
                       <td>Guardian Mobile :</td>
                       <td><%= gmobile %></td>
                   </tr> 
                  </table>
                 </div>	
                   <div style="position:absolute;left:23cm;top:5cm;width:4cm;height:5cm;border-color:green;border-style: solid;border-width:5px;">
                      IMAGE
                   </div> 
                   <% 
                       String queryy ="select * from appointment where pid='"+pid+"' order by date DESC Limit 6";    
                         rs = stmt.executeQuery(queryy);
                    %>
                   <div style="position:absolute;left:2cm;top:20cm;">
                       <h1><i>Consultation History :</i></h1>
                       <table cellpadding="10" cellspacing="3"  >
                           <tr>
                                 <td bgcolor="lightsalmon">Doctor ID</td>
                                 <td bgcolor="lightgoldenrodyellow">Symptoms</td>
                                 <td bgcolor="lightsalmon">Date</td>
                            </tr>
                           <% 
                                while(rs.next()){
                               %>
                            <tr>
                                <td bgcolor="lightgoldenrodyellow"><%= rs.getString("did") %></td>
                                 <td bgcolor="lightsalmon"><%= rs.getString("disorder") %></td>
                                 <td bgcolor="lightgoldenrodyellow"><%= rs.getString("date") %></td>
                            </tr>
                          <% } //}
                          %>
                       </table><br><br>
                            <p>*NOTE : The above are the details of patient which will be maintained in our database for future convenience.</p>
                   </div>
                            
	</div>
    <label for="tab-2" tabindex="0"></label>
    <input id="tab-2" type="radio" name="tabs" aria-hidden="true">
    <h2>PRESCRIPTIONS</h2>
    <div>
        <h1 style="position:absolute;left:2cm;top:3cm;"><i>Prescriptions Made for me:</i></h1>
        <div style="position:absolute;left:1cm;top:6cm;" >
            <%
                        String queryy1 ="select * from prescriptions where pid='"+pid+"' order by date DESC Limit 30";    
                         rs = stmt.executeQuery(queryy1);
                       %>
                       <center>
                      <table cellpadding="10" cellspacing="3"  >
                           <tr>
                                 <td bgcolor="lightsalmon">Doctor ID</td>
                                 <td bgcolor="lightgoldenrodyellow">Prescription Provided</td>
                                 <td bgcolor="lightsalmon">Date of Prescription</td>
                            </tr>
                            <% 
                                while(rs.next()){
                               %>
                            <tr>
                                <td bgcolor="lightgoldenrodyellow"><%= rs.getString("did") %></td>
                                 <td bgcolor="lightsalmon"><%= rs.getString("prescriptions") %></td>
                                 <td bgcolor="lightgoldenrodyellow"><%= rs.getString("date") %></td>
                            </tr>
                          <% 
                           }
                          %>
                       </table>
                       </center><br><br>
				<p>*NOTE : The above details are verified by the Doctors of our clinic which will be maintained in our database for future convenience.
        </div>
    </div>
	<label for="tab-3" tabindex="0"></label>
    <input id="tab-3" type="radio" name="tabs" aria-hidden="true">
    <h2>APPOINTMENT</h2>
    <div>
        <div style="position:absolute;left:1cm;">
         <%String shift = request.getParameter("shift");%>
                         <div id="disp" style="position:absolute;left:2cm;top:1cm;width:20cm;height:4cm;">
                             <h2>Select the Session before making an Appointment</h2>
                             <input type="button" value="Get Shift" onclick="myShift()"/> 
            <%if(shift!=null){ %>
            <h2>Displaying the Doctors available in the <%= shift %></h2>
                    <%  
                        }
                     %>
                     </div>
             <div style="position:absolute;left:2cm;top:3cm;">
                
                </div>
        </div>
        <div style="position:absolute;left:8.5cm;top:9cm;border-color: black;border-width: 3px;border-style: solid;width:12cm;height:8cm;">
            <div>
        <center>
            <form action="Appointment"><br>
                Patient ID :<input type="text" name="pid" value="<%= pid %>"/><br><br>
                Doctors Available : <select name="did">
                <% String query1 ="select * from doctordetails where dshift ='"+shift+"'"; 
              String dname="null",did="null";
              rs = stmt.executeQuery(query1);
              while(rs.next())
              {
                 did =  rs.getString("did");
                 dname = rs.getString("dname");
                 %>
                 <option value="<%= did %>">Dr.<%= dname %>,<%= did %></option>
                         
              <%
                         }
              %>
                </select><br>
                <br>Date :</b>  <input type="date" name="adate"/><br>
                <br>Medicinal Disorder :</b>:<br><textarea name="symptoms" rows="2" cols="50" required></textarea><br><br>
                <input type="submit" value="Make Appointment"/>
            </form>
        </center>
            </div>
        </div>
    </div>
	<label for="tab-4" tabindex="0"></label>
    <input id="tab-4" type="radio" name="tabs" checked="true" aria-hidden="true">
    <h2>SEARCH DOCTOR</h2>
    <div>
                         <%String name = request.getParameter("name");%>
                         <div style="position:absolute;left:3cm;top:3cm;">
                            <input type="button" value="Get Doctor ID" onclick="myFunction()"/>
                         </div>
                           <%!
                                    String doctorid="";
                                    String doname ="";
                                    String dspecial ="";
                                    String dexperience = "";
                                    String dqualification = "";
                                    String dwork ="";
                                    String dmerit ="";
                                    String dmobile = "";
                                    String dmail = "";
                                    String daddress="";
                   ;%>
                         <% if(name!=null){
                                String myquery ="select * from doctordetails where did='"+name+"'";    
                                rs = stmt.executeQuery(myquery);
                                while(rs.next())
                                {
                                 doctorid =  rs.getString("did");
                                 doname = rs.getString("dname");
                                 dspecial  = rs.getString("dspecialization");
                                 dexperience = rs.getString("dexperience");
                                 dqualification = rs.getString("dqualification");
                                 dwork = rs.getString("dwork");
                                 dmerit = rs.getString("dmerit");
                                 dmobile = rs.getString("dmobile");
                                 dmail =rs.getString("dmail"); 
                                 daddress= rs.getString("daddress");
                                }
                         }
                         %>     
                         <div style="position:absolute;left:3cm;top:5cm;">
                         <table cellpadding="10" cellspacing="3"  >
                            <tr bgcolor="lightblue">
                                <td>Doctor ID :</td>
                                 <td><%= doctorid %></td>
                            </tr>
                            <tr bgcolor="lightyellow">
                                <td>Doctor Name :</td>
                                <td><%= doname%></td>
                            </tr>
                            <tr bgcolor="lightblue">
                                <td>Specialist :</td>
                                <td><%= dspecial%></td>
                            </tr>
                            <tr bgcolor="lightyellow">
                                <td>Experience :</td>
                                <td><%= dexperience %></td>
                            </tr>
                            <tr bgcolor="lightblue">
                                <td>Qualification :</td>
                                <td><%= dqualification %></td>
                            </tr>
                            <tr bgcolor="lightyellow">
                                <td>Work Mode :</td>
                                <td><%= dwork%></td>
                            </tr>
                            <tr bgcolor="lightblue">
                                <td>Email-ID :</td>
                                <td><%= dmail %></td>
                             </tr>
                             <tr bgcolor="lightyellow">
                                 <td>Mobile :</td>
                       <td><%= dmobile %></td>
                   </tr>
                   <tr bgcolor="lightblue">
                       <td>Address :</td>
                       <td><%= daddress %></td>
                   </tr>
                         </table>
                   <p>*Mention the DoctorID to be searched by clicking the button above.</p></div>
    </div>
</div>
</div>
	<div id="footer">
		Designed by Hari Venkat
	</div>
</body>
</html>
