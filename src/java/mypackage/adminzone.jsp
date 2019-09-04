<%@page import="java.sql.*"%>
<html>
<head>
	<title>Admin Zone</title>
		<link rel="icon" href="download.png">
		<link rel="stylesheet" type="text/css" href="admin1.css" >
		<link rel="stylesheet" type="text/css" href="flipper.css" >
                <script>
                function myFunction() {
                        var name = prompt("Enter the Patient ID :");
                            window.location.replace("adminzone.jsp?name="+name);
                        }
                        function mydFunction() {
                        var doctorname = prompt("Enter the Doctor ID :");
                            window.location.replace("adminzone.jsp?doctorname="+doctorname);
                        }
                        function mypFunction() {
                        var patientname = prompt("Enter the Patient ID :");
                            window.location.replace("adminzone.jsp?patientname="+patientname);
                        }
                </script>
</head>
<body>
        <%!
           private Connection cn = null; 
           String room1="r_01";
           String room2="r_02";
           String room3="r_03";
           String room4="r_04";
           String room5="r_05";
           String room6="r_06";
           String room7="r_07";
           String room8="r_08";
           String room9="r_09";
           String room10="r_10";
           String r1disp;
           String r2disp;
           String r3disp;
           String r4disp;
           String r5disp;
           String r6disp;
           String r7disp;
           String r8disp;
           String r9disp;
           String r10disp;
         %>
         <%
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdldb","root","shri");
          %>
          <%
            Statement stmt = cn.createStatement();
            String query1 ="select * from roomallot where roomid='"+room1+"'";
            String query2 ="select * from roomallot where roomid='"+room2+"'";
            String query3 ="select * from roomallot where roomid='"+room3+"'";
            String query4 ="select * from roomallot where roomid='"+room4+"'";
            String query5 ="select * from roomallot where roomid='"+room5+"'";
            String query6 ="select * from roomallot where roomid='"+room6+"'";
            String query7 ="select * from roomallot where roomid='"+room7+"'";
            String query8 ="select * from roomallot where roomid='"+room8+"'";
            String query9 ="select * from roomallot where roomid='"+room9+"'";
            String query10 ="select * from roomallot where roomid='"+room10+"'";
            ResultSet rs = stmt.executeQuery(query1);
                    while(rs.next())
                    {
                        r1disp = rs.getString("rstatus");
                    }
                    rs = stmt.executeQuery(query2);
                    while(rs.next())
                  {
                        r2disp = rs.getString("rstatus");
                    }
                    rs = stmt.executeQuery(query3);
                   while(rs.next())
                    {
                        r3disp = rs.getString("rstatus");
                    }
                   rs = stmt.executeQuery(query4);
                    while(rs.next())
                    {
                        r4disp = rs.getString("rstatus");
                    }
                    rs = stmt.executeQuery(query5);
                    while(rs.next())
                    {
                        r5disp = rs.getString("rstatus");
                    }
                    rs = stmt.executeQuery(query6);
                    while(rs.next())
                  {
                        r6disp = rs.getString("rstatus");
                    }
                    rs = stmt.executeQuery(query7);
                   while(rs.next())
                    {
                        r7disp = rs.getString("rstatus");
                    }
                   rs = stmt.executeQuery(query8);
                    while(rs.next())
                    {
                        r8disp = rs.getString("rstatus");
                    }
                    rs = stmt.executeQuery(query9);
                   while(rs.next())
                    {
                        r9disp = rs.getString("rstatus");
                    }
                   rs = stmt.executeQuery(query10);
                    while(rs.next())
                    {
                        r10disp = rs.getString("rstatus");
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
			<h2>Add Patient</h2>
		<div>
		<fieldset>
                <legend><h2>General Details:</h2></legend>
				<center>
				<form action="AddPatient" >
					<b>Patient Name</b>        : <input type="text" name="pname" required><br><br>
					<b>Patient ID</b>  &nbsp &nbsp &nbsp: <input type="text" name="pid" required><br><br>
					<b>Height(in Cms )</b>			    : <input type="number" name="height" required><br><br>
					<b>Weight(in Kgs)</b> : <input type="number" name="weight" required><br><br>
					<b>Patient Category</b>              : <select name="pcategory">
															<option value="New Born">New Born</option>
															<option value="Children">Children</option>
															<option value="Youngsters">Youngsters</option>
															<option value="Adults" >Adults</option>
															<option value="Senior Citizens">Senior Citizens</option>
															</select><br><br>
					<b>Gender</b>  &nbsp &nbsp &nbsp :&nbsp &nbsp &nbsp &nbsp
						Male<input type="radio" name="gender" value="Male">
						Female<input type="radio" name="gender" value="Female"><br><br>
						<b>DOB</b>      &nbsp &nbsp &nbsp &nbsp : <input type="date" name="dob" required><br><br>
					<b>Blood Group</b>              : <select name="bgroup">
															<option value="A+ve">A+ve</option>
															<option value="A-ve">A-ve</option>
															<option value="B+ve">B+ve</option>
															<option value="B-ve">B-ve</option>
															<option value="O+ve">O+ve</option>
															<option value="O-ve">O-ve</option>
															<option value="AB+ve">AB+ve</option>
															<option value="AB-ve">AB-ve</option>
															</select><br><br>
					<b>Mobile No</b>    : <input type="text" name="mobile" required><br><br>
					<b>Email Id</b>  : <input type="email" name="mail" pattern="^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$" pattern="Make sure format of mail is valid"><br><br>
					<b>Address</b> :<br><textarea name="address" rows="2" cols="50" required></textarea><br><br>
					<b>Guardian's Name</b>:<input type="text" name="gname" required><br><br>
					<b>Guardian's Mobile No</b>     : <input type="text" name="gmobile" required><br><br>
				</center>
		</fieldset>
		<fieldset>
                <legend><h2>Credentials Details:</h2></legend>
				<center>
					<b>Patient Id</b>             : <input type="text" name="uid"><br><br>
					<b>Password</b>            : <input type="text" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
        </fieldset><br><br>
				</center>
				<center>
					<input type="submit" value="Add Patient">
				</center>
				</form>
				<p>*NOTE : The above details are verified by the patients of our clinic which will be maintained in our database for future convenience.
	</div>
    <label for="tab-2" tabindex="0"></label>
    <input id="tab-2" type="radio" name="tabs" aria-hidden="true">
    <h2>Record Update</h2>
    <div>
        <div style="position:absolute;top:5cm;left:25%;border-style:solid;border-width: 2px;width:15cm;">
            <center>
            <form action="prescriptionservlet">
                <br><br>
                <b>Patient ID :</b> <input type="text" name="pid"/><br><br>
                <b>Doctor ID : </b><input type="text" name="did"/><br><br>
                <b>Date :</b><input type="date" name="date"/><br><br>
                <b>Prescription provided :</b><br>
                <textarea rows="5" cols="50" name="prescription"></textarea><br><br>
                <input type="submit" value="Update Prescription"/><br><br>
            </form>
                <center>
        </div>
    </div>
	<label for="tab-3" tabindex="0"></label>
    <input id="tab-3" type="radio" name="tabs" aria-hidden="true">
    <h2>Add Doctor</h2>
    <div>
        <fieldset>
            <legend><h2>General Details:</h2></legend>
            <form action="AddDoctor" >
             <center>
            <b>Doctor Name :</b><input type="text" name="dname" required/><br><br>
            <b>Doctor ID   :</b><input type="text" name="did" required/><br><br>
            <b>Specialization</b>: <select name="dspecialization">
		<option value="Cardiologist">Cardiologist</option>
                <option value="Pulmonologist">Pulmonologist</option>
                <option value="Kidney">Kidney</option>
                <option value="Bones" >Bones</option>
                <option value="Skin">Skin</option>
                <option value="Tooth">Tooth</option>
                <option value="Eye">Eye</option>
                <option value="Nerves">Nerves</option>
            </select><br><br>
            <b>Gender</b>  &nbsp &nbsp &nbsp :&nbsp &nbsp &nbsp &nbsp
						Male<input type="radio" name="gender" value="Male">
						Female<input type="radio" name="gender" value="Female"><br><br>
            <b>Experience :</b><select name="dexperience">
		<option value="Fresher">Fresher</option>
                <option value="1-5 Years">1-5 Years</option>
                <option value="6-10 Years">6-10 Years</option>
                <option value="More Than 10 Years">More Than 10 Years</option>
            </select><br><br>
            <b>Qualification :</b><br><br><select name="dqualification">
		<option value="MBBS">Bachelor of Medicine, Bachelor of Surgery</option>
                <option value="BDS">Bachelor of Dental Surgery</option>
                <option value="BAMS">Bachelor of Ayurvedic Medicine and Surgery</option>
                <option value="BUMS">Bachelor of Unani Medicine and Surgery</option>
                <option value="BHMS">Bachelor of Homeopathy Medicine and Surgery</option>
            </select><br><br>
            Full Time<input type="radio" name="dwork" value="fultime">
            Part Time<input type="radio" name="dwork" value="parttime"><br><br>
            <b>Doctor Shift :</b><select name="dshift">
		<option value="Forenoon">Morning</option>
                <option value="Afternoon">Afternoon</option>
                <option value="Evening">Evening</option>
            </select><br><br>
            <b>Doctor Merit :</b><select name="dmerit">
		<option value="A">Merit A</option>
                <option value="B">Merit B</option>
                <option value="C">Merit C</option>
            </select><br><br>
            <b>Mobile No   :</b><input type="text" name="mobile" required/><br><br>
            <b>Email Id  :</b><input type="email" name="mail" pattern="^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$" pattern="Make sure format of mail is valid"><br><br>
            <b>Address :</b><br><br>
            <textarea name="address" rows="2" cols="50" required></textarea><br><br>
            <br><br>
        </center>
        </fieldset>
        <fieldset>
        <legend><h2>Credentials Details:</h2></legend>
        <center>
					<b>Doctor Id</b>             : <input type="text" name="did"><br><br>
					<b>Password</b>            : <input type="text" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                                        </fieldset><br><br></center>
        <center>
					<input type="submit" value="Add Doctor">
				</center>
				</form>
				<p>*NOTE : The above details are verified by the Doctors of our clinic which will be maintained in our database for future convenience.
    </div>
	<label for="tab-4" tabindex="0"></label>
    <input id="tab-4" type="radio" name="tabs" checked="true" aria-hidden="true">
    <h2>Room Allotment</h2>
    <div>
                <% String r1,r2,r3,r4,r5,r6,r7r,r8,r9,r10; %>
                <input type="button" value="Get Patient ID" onclick="myFunction()"/>
                 <%String name=request.getParameter("name");%>
                <% if(name!=null)
                    System.out.println(name);%>
                <%  session.setAttribute("v1",name);%>
                
		<fieldset><legend><b>CLASS A</b></legend>
		<div class="card-containera">
			<div class="card" style="left:1cm;position:absolute;">
				<div class="side"><img src="r01.jpg" width="150px" height="200px"></div>
				<div class="side back"><%= r1disp %></div>
			</div>
			<div class="card" style="left:8cm;position:absolute;">
				<div class="side"><img src="r02.jpg" width="150px" height="200px"></div>
				<div class="side back"><%= r2disp %></div>
			</div>
			<div class="card" style="left:15cm;position:absolute;">
				<div class="side"><img src="r03.jpg" width="150px" height="200px"></div>
				<div class="side back"><%= r3disp %></div>
				</div>
			<div class="card" style="left:22cm;position:absolute;">
				<div class="side"><img src="r04.jpg" width="150px" height="200px"></div>
				<div class="side back"><%= r4disp %></div>
			</div>
                </div><br>
		</fieldset>
		<form action="AlotRoomServlet" >
                    <input type="submit" id="submit" name="mybutton" value="Alot R_01" style="left:3cm;position:absolute;"/>
                    <input type="submit" id="submit" name="mybutton" value="Alot R_02" style="left:10cm;position:absolute;"/>
		    <input type="submit" id="submit" name="mybutton" value="Alot R_03" style="left:17cm;position:absolute;"/>
		    <input type="submit" id="submit" name="mybutton" value="Alot R_04" style="left:24cm;position:absolute;"/>
                    <br>
                    <input type="submit" id="vacate" name="mybutton" value="VACATE R_01" style="left:3cm;position:absolute;"/>
                    <input type="submit" id="vacate" name="mybutton" value="VACATE R_02" style="left:10cm;position:absolute;"/>
                    <input type="submit" id="vacate" name="mybutton" value="VACATE R_03" style="left:17cm;position:absolute;"/>
                    <input type="submit" id="vacate" name="mybutton" value="VACATE R_04" style="left:24cm;position:absolute;"/>
                    <br>
                  </form>
		<fieldset><legend><b><i>CLASS B</i></b></legend>
		<div class="card-containerb">
			<div class="card" style="left:3cm;position:absolute;">
				<div class="side"><img src="r05.jpg" width="120px" height="180px" ></div>
				<div class="side back"><%= r5disp %></div>
			</div>
			<div class="card" style="left:12cm;position:absolute;">
				<div class="side"><img src="r06.jpg" width="120px" height="180px"></div>
				<div class="side back"><%= r6disp %></div>
			</div>
			<div class="card" style="left:21cm;position:absolute;">
				<div class="side"><img src="r07.jpg" width="120px" height="180px"></div>
				<div class="side back"><%= r7disp %></div>
				</div>
		</div><br>
		</fieldset>
		<form action="AlotRoomServlet">
			<input type="submit" id="submit" name="mybutton" value="Alot R_05" style="left:4.5cm;position:absolute;"/>
                        <input type="submit" id="submit" name="mybutton" value="Alot R_06" style="left:13.5cm;position:absolute;"/>
			<input type="submit" id="submit" name="mybutton" value="Alot R_07" style="left:22.5cm;position:absolute;"/><br>
			<input type="submit" id="vacate" name="mybutton" value="VACATE R_05" style="left:4.5cm;position:absolute;"/>
			<input type="submit" id="vacate" name="mybutton" value="VACATE R_06" style="left:13.5cm;position:absolute;"/>
                        <input type="submit" id="vacate" name="mybutton" value="VACATE R_07" style="left:22.5cm;position:absolute;"/>
		</form><br>
		<fieldset><legend><b><i>CLASS C</i></b></legend>
		<div class="card-containerb">
			<div class="card" style="left:3cm;position:absolute;">
				<div class="side"><img src="r08.jpg" width="120px" height="180px"></div>
				<div class="side back"><%= r8disp %></div>
			</div>
			<div class="card" style="left:12cm;position:absolute;">
				<div class="side"><img src="r09.jpg" width="120px" height="180px"></div>
				<div class="side back"><%= r9disp %></div>
			</div>
			<div class="card" style="left:21cm;position:absolute;">
				<div class="side"><img src="r10.jpg" width="120px" height="180px"></div>
				<div class="side back"><%= r10disp %></div>
				</div>
		</div><br>
		</fieldset>
		<form action="AlotRoomServlet">
			<input type="submit" id="submit" name="mybutton" value="Alot R_08" style="left:4.5cm;position:absolute;"/>
                        <input type="submit" id="submit" name="mybutton" value="Alot R_09" style="left:13.5cm;position:absolute;"/>
                        <input type="submit" id="submit" name="mybutton" value="Alot R_10" style="left:22.5cm;position:absolute;"/><br>
			<input type="submit" id="vacate" name="mybutton" value="VACATE R_08" style="left:4.5cm;position:absolute;"/>
                        <input type="submit" id="vacate" name="mybutton" value="VACATE R_09" style="left:13.5cm;position:absolute;"/>
                        <input type="submit" id="vacate" name="mybutton" value="VACATE R_10" style="left:22.5cm;position:absolute;"/>
		</form><br>
		<h3>*NOTE:Patient's are requested to pay the Room's rent fee along with their consultation fees.</h3>
		<p>Class A - Rs.1000/day<br>Class B - Rs.700/day<br>Class C - Rs.400/day</p>
	</div>
                                <label for="tab-5" tabindex="0"></label>
    <input id="tab-5" type="radio" name="tabs" aria-hidden="true">
    <h2>Search Doctor</h2>
    <div>
        <%String doctorname = request.getParameter("doctorname");%>
                         <div style="position:absolute;left:3cm;top:3cm;">
                            <input type="button" value="Doctor ID" onclick="mydFunction()"/>
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
                         <% if(doctorname!=null){
                                String myquery ="select * from doctordetails where did='"+doctorname+"'";    
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
                   <label for="tab-6" tabindex="0"></label>
    <input id="tab-6" type="radio" name="tabs" checked="true" aria-hidden="true">
    <h2><font color="brown">Search Patient</font></h2>
    <div>
                <%String patientname = request.getParameter("patientname");%>
                         <div style="position:absolute;left:3cm;top:3cm;">
                            <input type="button" value="Get Patient ID" onclick="mypFunction()"/>
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
                          <% if(patientname!=null){
                                
                                    String myquery ="select * from patientdetails where pid='"+patientname+"'";    
                                     rs = stmt.executeQuery(myquery);
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
