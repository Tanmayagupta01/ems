<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> --%>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 -->
 <title>Department</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-default">

		<a href="#" class="navbar-brand">EMS</a>

		<ul class="nav navbar-nav">
			<li class="active"><a href="/employees">Employees</a></li>
			<li><a href="/department">Department</a></li>
			<li><a href="#">Attendence</a></li>
		</ul>

		

	</nav>
	<p align="right">
	<a class="btn btn-success" class="pull-right" href="/department/add">Add Department</a>
	</p>
	
	<div class="container">
		<table class="table table-striped">
			<caption>Department Table</caption>
			<thead>
				<th>Id</th>
				<th>Name</th>
				<th>Bonus</th>
				<th>Action</th>
			</thead>
			<tbody>
			<c:forEach items="${departmentList}" var="department">
				<tr>
					<td>${department.getId()}</td>
					<td>${department.getName()}</td>
					<td>${department.getBonus()}</td>
					<td><a class="btn btn-primary" href="/department/update/${department.getId()}">Update</a> <a class="btn btn-danger" href="/department/delete/${department.getId()}">Delete</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>	
	</div>
	</body>
	</html>