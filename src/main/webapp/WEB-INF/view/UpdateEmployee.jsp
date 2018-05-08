<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> --%>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<title>Update Employee</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#updateEmployeeForm').submit(function(e) {
			// reference to form object
			var form = $(this)
			var url = form.attr("action");
			// for stopping the default action of element
			e.preventDefault();
			// mapthat will hold form data
			var formData = {}
			//iterate over form elements   
			$.each(this, function(i, v) {
				var input = $(v);
				// populate form data as key-value pairs
				// with the name of input as key and its value as value
				if(input.attr("name") != undefined){
				formData[input.attr("name")] = input.val();
				}
			});
			$.ajax({
				type : "POST", // method attribute of form
				url : form.attr("action"), // action attribute of form
				contentType: "application/json",
				dataType : 'json',
				// convert form data to json format
				data : JSON.stringify(formData),
				success: function(response) {
					
					window.location.href = "/employees";
			      }
			});

		});
	});
</script>
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
	<div class="container">
	
	<form id="updateEmployeeForm" class="form-horizontal"
			action="/employee/update" method="post">
			
			<div class="form-group">
				<label for="id">Id:</label> <input type="text" name="id"
					class="form-control" id="id" readonly="readonly" value="${emp.getId()}">
			</div>
			
			<div class="form-group">
				<label for="usr">Name:</label> <input type="text" name="name"
					class="form-control" id="usr" value="${emp.getName()}" readonly="readonly">
			</div>
			
			<div class="form-group">
				<label for="address">Address:</label>
				<textarea rows="5" name="address" class="form-control" id="address" value="${emp.getAddress()}">${emp.getAddress()}</textarea>
			</div>
			
		<div class="form-group">
			<label for="mobile">Mobile Number:</label>
			<input type="number" maxlength="10" size="10" name="mobileNo" 
			class="form-control" id="mobile" pattern="^\d{10}$" value="${emp.getMobileNo()}">
		</div>
		
			<div class="form-group">
			<label for="Salary">Salary:</label>
			<input type="number" class="form-control" name="salary" id="salary" value="${emp.getSalary()}">
		</div>
		
			<div class="form-group">
			<label for="email">Email Address:</label>
			<input type="email"  class="form-control" id="email" name="email" value="${emp.getEmail()}">
		</div>
		
		<div class="form-group">
			<label for="dept">Select Department:</label>
			<select class="form-control" id="dept" name="deptId" value="${emp.getDepartment().getName()}">
			<c:forEach items="${departmentList}" var="department">
				<option value="${department.getId()}">${department.getName()}</option>
			</c:forEach>
			</select>
		</div>
		
		<input type="submit" class="btn btn-success" value="submit">
			&nbsp; <a class="btn btn-danger" href="/employees">Cancel</a>
	</form>
	</div>
	
</body>
</html>