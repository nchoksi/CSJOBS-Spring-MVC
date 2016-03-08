<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CS Jobs - Registration</title>
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

<h2>Fill this form to Register</h2>
<form:form modelAttribute="user">
<table class="table table-striped" style="border: 1px  solid grey;">
<tr style="border: 1px  solid grey;">
  <th style="border: 1px  solid grey; width: 20%">Email:</th>
  <td style="border: 1px  solid grey; width: 80%"><form:input path="email" class="form-control" style="width:50%"/> <b><form:errors path="email" /></b></td>
</tr>
<tr style="border: 1px  solid grey;">
  <th style="border: 1px  solid grey;">Password:</th>
  <td style="border: 1px  solid grey;"><form:password path="password" class="form-control" style="width:50%"/> <b><form:errors path="password" /></b></td>
</tr>
<tr style="border: 1px  solid grey;">
  <th style="border: 1px  solid grey;">Password again:</th>
  <td style="border: 1px  solid grey;"><form:password path="password2" class="form-control" style="width:50%"/> <b><form:errors path="password2" /></b></td>
</tr>
<tr style="border: 1px  solid grey;">
  <th style="border: 1px  solid grey;">Last Name:</th>
  <td style="border: 1px  solid grey;"><form:input path="lastName" class="form-control" style="width:50%"/> <b><form:errors path="lastName" /></b></td>
</tr>
<tr style="border: 1px  solid grey;">
  <th style="border: 1px  solid grey;">First Name:</th>
  <td style="border: 1px  solid grey;"><form:input path="firstName" class="form-control" style="width:50%"/> <b><form:errors path="firstName" /></b></td>
</tr>
<tr style="border: 1px  solid grey;">
  <th style="border: 1px  solid grey;">Phone:</th>
  <td style="border: 1px  solid grey;"><form:input path="phone" class="form-control" style="width:50%"/> <b><form:errors path="phone" /></b></td>
</tr>
<tr style="border: 1px  solid grey;">
  <th style="border: 1px  solid grey;">Address:</th>
  <td style="border: 1px  solid grey;"><form:input path="address" class="form-control" style="width:50%"/> <b><form:errors path="address" /></b></td>
</tr>
<tr style="border: 1px  solid grey;">
  <td><br /></td><td><input type="submit" name="register" value="register" class="btn btn-success"/></td>
</tr>
</table>
</form:form>
</body>
</html>
