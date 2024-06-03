<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
    <%@page import="com.dollop.adda.bean.Student"%>
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
  					<a href="./StudentController?action=VIEWSTUDENTS">VIEW</a></li>
  			</p>
  		</td>
  		<td class="contentBox">
  		<%List<Student> list=(ArrayList)request.getAttribute("viewAllStudent");
		%>
			<table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Name

      </th>
      <th class="th-sm">Email

      </th>
      <th class="th-sm">Mobile

      </th>
      <th class="th-sm">Address

      </th>
      <th class="th-sm">Action
      </th>
      
    </tr>
  </thead>
  <tbody>
  <%
  for (Student item : list) { %>
    <tr>
      <td><%=item.getSname()%></td>
      <td><%=item.getSemail()%></td>
      <td><%=item.getSmobile()%></td>
      <td><%=item.getSaddress()%></td>
      <td><a class="edit" href="./StudentController?action=EDITSTUDENT&id=<%=item.getSid()%>">Edit</a>/
      <a onclick="return confirm('Are You Sure?')" class="delete" href="./StudentController?action=DELETESTUDENT&id=<%=item.getSid()%>">Delete</a></td>
    </tr>
    <%
    }%>
   
</table>
</td>
  		
  	</tr>
  	<tr class="footer" >
  		<td colspan="2"></td>
  	</tr>
  </table>    

</body>
</html>