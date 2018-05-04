<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Department</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-default">

		<a href="#" class="navbar-brand">EMS</a>

		<ul class="nav navbar-nav">
			<li class="active"><a href="#">Employees</a></li>
			<li><a href="#">Department</a></li>
			<li><a href="#">Attendence</a></li>
		</ul>

		

	</nav>
	
	<div class = "container">
		<form class="form-horizontal" action="#" method="post">
			<div class="form-group">
			<label for="dept">Name:</label>
			<input type="text" class="form-control" id="dept">
		</div>
			
			<div class="form-group">
			<label for="bonus">Bonus:</label>
			<input type="number" class="form-control" id="bonus">
		</div>
		<input name="save" type="submit" class="btn btn-success" /> &nbsp;
		<a class="btn btn-danger" href="#">Cancel</a>
		</form>
	</div>
	</body>
	</html>