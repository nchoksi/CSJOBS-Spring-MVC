<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>CS Jobs - Login</title>
	<style type="text/css">
body {
	margin-left: 200px;
	margin-right: 200px;
	margin-top: 50px;
	background-image: url("job-puzzle.jpg");
	color: Brown;
	background-size: 100%;
}
th{
	font-size: 16pt;
	font-family: serif;
	font-style: oblique;
	font-weight: bold;
}
a {
	text-align: center;
	font-size: large;
	font-weight: bolder;
	font-family: serif;
	color: red;
}

a:hover {
	color: Red;
}

h2 {
	text-align: center;
	text-transform: capitalize;
	color: Brown;
	font-weight: bolder;
}

h3 {
	text-align: left;
	text-transform: capitalize;
	color: Brown;
	font-weight: bolder;
}

p {
	text-align: left;
	text-transform: capitalize;
	color: Brown;
	font-weight: bolder;
}
</style>
</head>
<body>

	<h2>CS Jobs - Login</h2>
	<form action="login" method="post">
		<table style="border: 1px  solid grey;" class="table table-striped">
			<tr style="border: 1px  solid grey;">
				<td style="border: 1px  solid grey; width: 20%"><p>User:</p></td>
				<td style="border: 1px  solid grey; "><input type="text" name="username"  class="form-control" style="width:50%"/></td>
			</tr>
			<tr style="border: 1px  solid grey;">
				<td style="border: 1px  solid grey;"><p>Password:</p></td>
				<td style="border: 1px  solid grey;"><input type="password" name="password"  class="form-control" style="width:50%"/></td>
			</tr>

			<tr style="border: 1px  solid grey;">
				<td ><input type="hidden" name="_csrf" value="${_csrf.token}" /></td>
				<td style="border: 1px  solid grey;"><input type="submit" name="submit" value="Login"  class="btn btn-success"/></td>
			</tr>
		</table>
	</form>

</body>
</html>
