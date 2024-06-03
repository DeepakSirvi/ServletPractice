<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dollop.adda.bean.Student"  %>
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
  		      <% Student student = (Student)request.getAttribute("studentById"); %>
  			<form action="./StudentController?action=ADDSTUDENT" method="post">
  			<table>
  			
  					<tr >
  					<td colspan="2">Student Registration</td>
  				</tr>
  				<tr>
  					<td>
  						<label>Student Name</label>
  					</td>
  					<td>
  						<input type="text" name="sname" value=<%=student.getSname() %> required>
  					</td>
  				</tr>
  				<tr>
  					<td>
  						<label>Student Email</label>
  					</td>
  					<td>
  						<input type="email" name="semail" value=<%=student.getSemail() %> required>
  					</td>
  				</tr>
  				<tr>
  					<td>
  						<label>Student Mobile</label>
  					</td>
  					<td>
  						<input type="number" name="smobile" value=<%=student.getSmobile() %> required>
  					</td>
  				</tr>
  				<tr>
  					<td>
  						<label>Student Address</label>
  					</td>
  					<td>
  						<input type="text" name="saddress" value=<%=student.getSaddress() %>  required>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="2" class="submit">
  						<input type="hidden" name="action" value="ADDSTUDENT">
  						<input type="hidden" name="id" value=<%=student.getSid() %>>
  						<input  type="submit" name="add" value="Submit" >
  					</td>
  				</tr>
  				
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