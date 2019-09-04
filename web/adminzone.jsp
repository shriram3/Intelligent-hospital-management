<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDate"%>
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
           String admissionno="",ipid="", discat=" ",admitfor=" ",refdoc=" ",addate=" ",dpname=" ",dpmobile=" ";

           String room1="G01";
           String room2="G02";
           String room3="G03";
           String room4="G04";
           String room5="G05";
           String room6="F01";
           String room7="F02";
           String room8="F03";
           String room9="F04";
           String room10="F05";
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
           String r1disd;
           String r2disd;
           String r3disd;
           String r4disd;
           String r5disd;
           String r6disd;
           String r7disd;
           String r8disd;
           String r9disd;
           String r10disd;
           
         %>
         <%
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdldb","root","shri");
          %>
          <%
            Statement stmt = cn.createStatement();
            String query1 ="select * from room where roomid='"+room1+"'";
            String query2 ="select * from room where roomid='"+room2+"'";
            String query3 ="select * from room where roomid='"+room3+"'";
            String query4 ="select * from room where roomid='"+room4+"'";
            String query5 ="select * from room where roomid='"+room5+"'";
            String query6 ="select * from room where roomid='"+room6+"'";
            String query7 ="select * from room where roomid='"+room7+"'";
            String query8 ="select * from room where roomid='"+room8+"'";
            String query9 ="select * from room where roomid='"+room9+"'";
            String query10 ="select * from room where roomid='"+room10+"'";
            ResultSet rs = stmt.executeQuery(query1);
                    while(rs.next())
                    {
                        r1disp = rs.getString("patientid");
                        r1disd = rs.getString("dischargedate");
                    }
                    rs = stmt.executeQuery(query2);
                    while(rs.next())
                  {
                        r2disp = rs.getString("patientid");
                        r2disd = rs.getString("dischargedate");
                    }
                    rs = stmt.executeQuery(query3);
                   while(rs.next())
                    {
                        r3disp = rs.getString("patientid");
                        r3disd = rs.getString("dischargedate");
                    }
                   rs = stmt.executeQuery(query4);
                    while(rs.next())
                    {
                        r4disp = rs.getString("patientid");
                        r4disd = rs.getString("dischargedate");
                    }
                    rs = stmt.executeQuery(query5);
                    while(rs.next())
                    {
                        r5disp = rs.getString("patientid");
                        r5disd = rs.getString("dischargedate");
                    }
                    rs = stmt.executeQuery(query6);
                    while(rs.next())
                  {
                        r6disp = rs.getString("patientid");
                        r6disd = rs.getString("dischargedate");
                    }
                    rs = stmt.executeQuery(query7);
                   while(rs.next())
                    {
                        r7disp = rs.getString("patientid");
                        r7disd = rs.getString("dischargedate");
                    }
                   rs = stmt.executeQuery(query8);
                    while(rs.next())
                    {
                        r8disp = rs.getString("patientid");
                        r8disd = rs.getString("dischargedate");
                    }
                    rs = stmt.executeQuery(query9);
                   while(rs.next())
                    {
                        r9disp = rs.getString("patientid");
                        r9disd = rs.getString("dischargedate");
                    }
                   rs = stmt.executeQuery(query10);
                    while(rs.next())
                    {
                        r10disp = rs.getString("patientid");
                        r10disd = rs.getString("dischargedate");
                    }
            %>
	<div id="head">
		<img id="logo" src="download.png" width="70px" height="70px">
		<center>
			<h1>Mepello Hospital</h1>
			<h4> "Health is Wealth" </h4>
			<h3>Email: mepello@gmail.com &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Contact no: 0452-2331733(30Lines) &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Fax : +91 4562-111 </h3>
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
    <h2>Patient admission</h2>
    <div>
        <fieldset>
            <legend><h2>General Details:</h2></legend>
            <form action="AdmitPatient" >
            <b>Patient Name :</b><input type="text" name="pname" required/><br><br>
            <b>Patient ID   :</b><input type="text" name="pid" required/><br><br>
            <b>Age   :</b><input type="text" name="age" required/><br><br>
            <b>Gender</b>  &nbsp &nbsp &nbsp :&nbsp &nbsp &nbsp &nbsp
						Male<input type="radio" name="gender" value="Male">
						Female<input type="radio" name="gender" value="Female"><br><br>
                                                <b>Disease Category :</b><select name="disease">
                                                    <option value="Heart disease">Heart disease</option>
                                                    <option value="Pregnancy disease">Pregnancy disease</option>
                                                    <option value="Chronic diseases">Chronic diseases</option>
                                                    <option value="Acquired diseases">Acquired diseases</option>
                                                </select>
                                                <br><br>
            <b>Admitted For :</b><input type="text" name="admitfor" required/><br><br>
            <b>Referred doctor :</b><input type="text" name="rdoc" required/><br><br>
            <b>Mobile No   :</b><input type="text" name="mobile" required/><br><br>
            <b>Email Id  :</b><input type="email" name="mail" pattern="^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$" pattern="Make sure format of mail is valid"><br><br>
            <b>Address :</b><br><br>
            <textarea name="address" rows="2" cols="50" required></textarea><br><br>
            <br><br>
            <input type="submit" value="Check availablity"/>
            </form>
        </fieldset>
	
				<p>*NOTE : The above details are verified by the Doctors of our clinic which will be maintained in our database for future convenience.
    </div>
	<label for="tab-4" tabindex="0"></label>
    <input id="tab-4" type="radio" name="tabs" checked="true" aria-hidden="true">
    <h2>Room Status</h2>
    <div>
                <% String r1,r2,r3,r4,r5,r6,r7r,r8,r9,r10; %>
                <input type="button" value="Get Patient ID" onclick="myFunction()"/>
                 <%String name=request.getParameter("name");%>
                <% if(name!=null)
                    System.out.println(name);%>
                <%  session.setAttribute("v1",name);%>
                
		<fieldset><legend><b>Ground Floor :</b></legend>
		<div class="card-containera">
			<div class="card" style="left:1cm;position:absolute;">
				<div class="side"><img src="r01.jpg" width="150px" height="200px"></div>
				<div class="side back"><%= r1disp %>
                                    <br>
                                <%= r1disd %></div>
			</div>
			<div class="card" style="left:8cm;position:absolute;">
				<div class="side"><img src="r02.jpg" width="150px" height="200px"></div>
				<div class="side back"><%= r2disp %><br><%= r2disd %></div>
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
                        <br><br>
		<fieldset><legend><b>First floor :</b></legend>
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
		<br><br><br>
		<fieldset><legend><b>Second floor :</b></legend>
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
		<br>
		<h3>*NOTE:Patient's are requested to pay the Room's rent fee along with their consultation fees.</h3>
	</div>
                                
<label for="tab-5" tabindex="0"></label>
    <input id="tab-5" type="radio" name="tabs" aria-hidden="true">
    <h2>Patient Discharge</h2>

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
</body>
</html>
