<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CS Jobs - Apply</title>
<style type="text/css">
body {
	margin-left: 200px;
	margin-right: 200px;
	margin-top: 50px;
	background-image: url("../job-puzzle.jpg");
	color: Brown;
	background-size: 100%;
}

a {
	text-align: center;
	font-size: large;
	font-weight: bolder;
	font-family: serif;
	color: Brown;
}

a:hover {
	color: Red;
}
th{
	font-size: 16pt;
	font-family: serif;
	font-style: oblique;
	font-weight: bold;
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

h4 {
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
	<h2>CS Jobs-Applicant</h2>

	<h3>
		<center> Job Title: ${application.job.title}</center>
	</h3>
	<h4>
		Applicant Name: <small>${application.applicant.firstName}
			${application.applicant.lastName}</small>
	</h4>


	<%-- <form:form modelAttribute="application" enctype="multipart/form-data"> --%>
	<form:form action="apply.html?${_csrf.parameterName}=${_csrf.token}"
		modelAttribute="application" enctype="multipart/form-data">

		<table style="border: 1px  solid grey;"class="table table-striped">
			<tr style="border: 1px  solid grey;">
				<th style="border: 1px  solid grey;">Title</th>
				<td style="border: 1px  solid grey;"><form:input path="currentJobTitle" class="form-control"
						style="width:50%" /></td>
			</tr>
			<tr style="border: 1px  solid grey;">
				<th style="border: 1px  solid grey;">Institution or Company</th>
				<td style="border: 1px  solid grey;"><form:input path="currentJobInstitution"
						class="form-control" style="width:50%" /></td>
			</tr>
			<tr style="border: 1px  solid grey;">
				<th style="border: 1px  solid grey;">Starting Year</th>
				<td style="border: 1px  solid grey;"><form:input path="currentJobYear" class="form-control"
						style="width:50%" /></td>
			</tr>
			<tr style="border: 1px  solid grey;">
				<th style="border: 1px  solid grey;">Curriculum Vitae:</th>
				<td style="border: 1px  solid grey;"><input type="file" name="file1" class="btn btn-default"
					style="width: 50%" /></td>
			</tr>

			<tr style="border: 1px  solid grey;">
				<th style="border: 1px  solid grey;">Teaching Statement:</th>
				<td style="border: 1px  solid grey;"><input type="file" name="file2" class="btn btn-default"
					style="width: 50%" /></td>
			</tr>

			<tr style="border: 1px  solid grey;">
				<th style="border: 1px  solid grey;">Research Statement:</th>
				<td style="border: 1px  solid grey;"><input type="file" name="file3" class="btn btn-default"
					style="width: 50%" /></td>
			</tr>
			<tr style="border: 1px  solid grey;">
				<th style="border: 1px  solid grey;"><br /></th>
				<td style="border: 1px  solid grey;"><input type="submit" name="next" value="Next"
					class="btn btn-info" /></td>
			</tr>
		</table>

	</form:form>
</body>
</html>
