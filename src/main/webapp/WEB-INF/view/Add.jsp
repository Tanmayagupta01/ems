<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee</title>
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
	<div class="container">
	<form class="form-horizontal" action="#">
		<div class="form-group">
			<label for="usr">Name:</label>
			<input type="text" class="form-control" id="usr">
		</div>
		<div class="form-group">
			<label for="address">Address:</label>
			<textarea rows="5" class="form-control" id="address"></textarea> 
		</div>
		<div class="form-group">
			<label for="mobile">Mobile Number:</label>
			<input type="number" maxlength="10" size="10" class="form-control" id="mobile" pattern="^\d{10}$">
		</div>
			<div class="form-group">
			<label for="Salary">Salary:</label>
			<input type="number" class="form-control" id="salary">
		</div>
			<div class="form-group">
			<label for="email">Email Address:</label>
			<input type="email"  class="form-control" id="email">
		</div>
		<input name="save" type="submit" class="btn btn-success">Save &nbsp;
		<a class="btn btn-danger" href="#">Cancel</a> 
	</form>
	</div>
	
	
</body>
</html>