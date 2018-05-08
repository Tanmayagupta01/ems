<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> --%>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<title>Update Department</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
	
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
	<script type="text/javascript">
	$(function() {
		$('#updateDepartmentForm').submit(function(e) {
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
					
					window.location.href = "/department";
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
	
	<div class = "container">
		<form id="updateDepartmentForm"
		 class="form-horizontal" action="/department/update" method="post">
		 
		 
		 <div class="form-group">
		 	<label for="id">ID:</label>
		 	<input type="text" class="form-control" id="id" name="id" value="${dept.getId()}" readonly="readonly">
		 </div>
		 
			<div class="form-group">
			<label for="dept">Name:</label>
			<input type="text" class="form-control" id="dept" name="name" value="${dept.getName()}" readonly="readonly">
		</div>
			
			<div class="form-group">
			<label for="bonus">Bonus:</label>
			<input type="number" name="bonus" class="form-control" id="bonus" value="${dept.getBonus()}">
		</div>
		
		<input name="save" type="submit" class="btn btn-success" /> &nbsp;
		<a class="btn btn-danger" href="/department">Cancel</a>
		</form>
	</div>
	</body>
	</html>