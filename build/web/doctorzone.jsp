<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<html>
<head>
	<title>Doctor Zone</title>
		<link rel="icon" href="download.png">
                <link rel="stylesheet" type="text/css" href="admin.css">
                <script>
                function myFunction() {
                        var name = prompt("Enter the Patient ID :");
                            window.location.replace("doctorzone.jsp?name="+name);
                        } 
                </script>
</head>
<body>
        <%!
           private Connection cn = null; 
           String did=null;
           String dname =null;
           String dspecial =null;
           String dexperience = null;
           String dqualification = null;
           String dwork =null;
           String dmerit =null;
           String dmobile = null;
           String dmail = null;
           String daddress= null;
                   ;%>
         <%
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdldb","root","shri"); 
            Statement stmt = cn.createStatement();
            String userid = (String)request.getAttribute("adno");
          %>
          <% 
              String query ="select * from doctordetails where did='"+userid+"'";    
              ResultSet rs = stmt.executeQuery(query);
              while(rs.next())
              {
                 did =  rs.getString("did");
                 dname = rs.getString("dname");
                 dspecial  = rs.getString("dspecialization");
                 dexperience = rs.getString("dexperience");
                 dqualification = rs.getString("dqualification");
                 dwork = rs.getString("dwork");
                 dmerit = rs.getString("dmerit");
                 dmobile = rs.getString("dmobile");
                 dmail =rs.getString("dmail"); 
                 daddress= rs.getString("daddress");
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
			<h2><font color="brown">My Profile</font></h2>
                        <div>   
                            <div style="position:absolute;left:2cm;top:3cm;" >
                                <h1><i>Profile :</i></h1>
                            <table cellpadding="10" cellspacing="3"  >
                            <tr bgcolor="lightblue">
                                <td>Doctor ID :</td>
                                 <td><%= did %></td>
                            </tr>
                            <tr bgcolor="lightyellow">
                                <td>Doctor Name :</td>
                                <td><%= dname%></td>
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
                 </div>	
                   <div style="position:absolute;left:23cm;top:5cm;width:4cm;height:5cm;border-color:green;border-style: solid;border-width:5px;">
                      IMAGE
                   </div>
                   <div style="position:absolute;left:2cm;top:18cm;">
                       <h1><i>Latest Consults :</i></h1>
                       <%
                        String queryy ="select * from appointment where did='"+did+"' order by date DESC Limit 6";    
                         rs = stmt.executeQuery(queryy);
                       %>
                      <table cellpadding="10" cellspacing="3"  >
                           <tr>
                                 <td bgcolor="lightsalmon">Patient ID</td>
                                 <td bgcolor="lightgoldenrodyellow">Symptoms</td>
                                 <td bgcolor="lightsalmon">Date</td>
                            </tr>
                            <% 
                                while(rs.next()){
                               %>
                            <tr>
                                <td bgcolor="lightgoldenrodyellow"><%= rs.getString("pid") %></td>
                                 <td bgcolor="lightsalmon"><%= rs.getString("disorder") %></td>
                                 <td bgcolor="lightgoldenrodyellow"><%= rs.getString("date") %></td>
                            </tr>
                          <% }
                          %>
                       </table><br><br>
                            <p>*NOTE : The above are the details of patient which will be maintained in our database for future convenience.</p>
                   </div>
               </div>
    <label for="tab-2" tabindex="0"></label>
    <input id="tab-2" type="radio" name="tabs" aria-hidden="true">
    <h2><font color="brown">Prescriptions Made</font></h2>
    <div>
        <h1 style="position:absolute;left:2cm;top:3cm;"><i>Prescriptions Made by me:</i></h1>
        <div style="position:absolute;left:1cm;top:6cm;" >
            <%
                        String queryyy1 ="select * from prescriptions where did='"+did+"' order by date DESC Limit 30";    
                         rs = stmt.executeQuery(queryyy1);
                       %>
                       <center>
                      <table cellpadding="10" cellspacing="3"  >
                           <tr>
                                 <td bgcolor="lightsalmon">Patient ID</td>
                                 <td bgcolor="lightgoldenrodyellow">Prescription Provided</td>
                                 <td bgcolor="lightsalmon">Date of Prescription</td>
                            </tr>
                            <% 
                                while(rs.next()){
                               %>
                            <tr>
                                <td bgcolor="lightgoldenrodyellow"><%= rs.getString("pid") %></td>
                                 <td bgcolor="lightsalmon"><%= rs.getString("prescriptions") %></td>
                                 <td bgcolor="lightgoldenrodyellow"><%= rs.getString("date") %></td>
                            </tr>
                          <% }
                          %>
                       </table>
                       </center><br><br>
				<p>*NOTE : The above details are verified by the Doctors of our clinic which will be maintained in our database for future convenience.
        </div>
    </div>
	<label for="tab-3" tabindex="0"></label>
    <input id="tab-3" type="radio" name="tabs" aria-hidden="true">
    <h2><font color="brown">My Appointments</font></h2>
    <div>
        <h1 style="position:absolute;left:2cm;top:3cm;"><i>Appointments Made for me:</i></h1>
        <div style="position:absolute;left:2cm;top:6cm;" >
            <%
                        String queryy1 ="select * from appointment where did='"+did+"' order by date DESC Limit 30";    
                         rs = stmt.executeQuery(queryy1);
                       %>
                       <center>
                      <table cellpadding="10" cellspacing="3"  >
                           <tr>
                                 <td bgcolor="lightsalmon">Patient ID</td>
                                 <td bgcolor="lightgoldenrodyellow">Symptoms</td>
                                 <td bgcolor="lightsalmon">Date</td>
                            </tr>
                            <% 
                                while(rs.next()){
                               %>
                            <tr>
                                <td bgcolor="lightgoldenrodyellow"><%= rs.getString("pid") %></td>
                                 <td bgcolor="lightsalmon"><%= rs.getString("disorder") %></td>
                                 <td bgcolor="lightgoldenrodyellow"><%= rs.getString("date") %></td>
                            </tr>
                          <% }
                          %>
                       </table>
                       </center><br><br>
				<p>*NOTE : The above details are verified by the Doctors of our clinic which will be maintained in our database for future convenience.
        </div> 
    </div>
	<label for="tab-4" tabindex="0"></label>
    <input id="tab-4" type="radio" name="tabs" checked="true" aria-hidden="true">
    <h2><font color="brown">Search Patient</font></h2>
    <div>
                <%String name = request.getParameter("name");%>
                         <div style="position:absolute;left:3cm;top:3cm;">
                            <input type="button" value="Get Patient ID" onclick="myFunction()"/>
                         </div>
                            <%!
                                        String pid="";
                                        String pname="";
                                        String height="";
                                        String weight="";
                                        String pcategory="";
                                        String pgender="";
                                        String bgroup="";
                                        String dob="";
                                        String mobile="";
                                        String mail="";
                                        String address="";
                                        String gname="";
                                        String gmobile="";
                            ;%>
                          <% if(name!=null){
                                
                                    String query1 ="select * from patientdetails where pid='"+name+"'";    
                                     rs = stmt.executeQuery(query1);
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
           
                         }
                         %>
                         <div style="position:absolute;left:3cm;top:5cm;">
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
                             </table><br><br>
                             <p>*NOTE : The above details are verified by the Doctors of our clinic which will be maintained in our database for future convenience.</p>
                         </div>
	</div>
</div>
        </div>
	<div id="footer">
		Designed by Hari Venkat
	</div>
</body>
</html>
