<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Style.css">
</head>
<body>
  <table class="maintab">
  	<tr class="header" >
  		<td colspan="2">
  			 <img class="img" src="./image/logo.jpg" alt="c-logo">
  		</td>
  	</tr>
  	<tr class="middletag">
  		<td class="leftbar">
  			<p class="navbar">
  				<li>
  					<a href="addstudent.jsp"> ADD</a></li>
  				<li>
  					<a href="./StudentController?action=VIEWSTUDENTS">VIEW STUDENT</a></li>
  			</p>
  		</td>
  		<td class="contentBox">
  			<form action="./StudentController" method="post">
  			<table>
  			
  					<tr >
  					<td colspan="2">Student Registration</td>
  				</tr>
  				<tr>
  					<td>
  						<label>Student Name</label>
  					</td>
  					<td>
  						<input type="text" name="sname" required>
  					</td>
  				</tr>
  				<tr>
  					<td>
  						<label>Student Email</label>
  					</td>
  					<td>
  						<input type="email" name="semail" required>
  					</td>
  				</tr>
  				<tr>
  					<td>
  						<label>Student Mobile</label>
  					</td>
  					<td>
  						<input type="number" name="smobile" required>
  					</td>
  				</tr>
  				<tr>
  					<td>
  						<label>Student Address</label>
  					</td>
  					<td>
  						<input type="text" name="saddress"  required>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="2" class="submit">
  						<input type="hidden" name="action" value="ADDSTUDENT">
  						<!-- <input type="hidden" name="check" value="ADD"> -->
  						<input  type="submit" name="add" value="Submit">
  					</td>
  				
  			</table>
  			</form>
  		</td>
  	</tr>
  	<tr class="footer" >
  		<td colspan="2"></td>
  	</tr>


  </table>    

</body>

</html>