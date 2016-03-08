<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CS Jobs - Add Degree</title>
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
th{
	font-size: 16pt;
	font-family: serif;
	font-style: oblique;
	font-weight: bold;
}
</style>
</head>
<body>
	<h2>CS Jobs</h2>

	<h3>${application.job.title}</h3>

	<p>Applicant: ${application.applicant.firstName}
		${application.applicant.lastName}</p>

	<form:form modelAttribute="degree">
		<table class="table table-striped" style="border: 1px  solid grey;">
			<tr style="border: 1px  solid grey;">
				<th style="border: 1px  solid grey;">Degree</th>
				<th style="border: 1px  solid grey;">School</th>
				<th style="border: 1px  solid grey;">Year</th>
			</tr>
			<c:forEach items="${application.degrees}" var="degree">
				<tr style="border: 1px  solid grey;">
					<td style="border: 1px  solid grey;">${degree.name}</td>
					<td style="border: 1px  solid grey;">${degree.school}</td>
					<td style="border: 1px  solid grey;">${degree.year}</td>
				</tr>
			</c:forEach>
			<tr style="border: 1px  solid grey;">
				<td style="border: 1px  solid grey;"><form:input path="name" class="form-control"
						style="width:50%" /></td>
				<td style="border: 1px  solid grey;"><form:input path="school" class="form-control"
						style="width:50%" /></td>
				<td style="border: 1px  solid grey;"><form:input path="year" class="form-control"
						style="width:50%" /></td>
			</tr>
		</table>
		<p>
			<input type="submit" name="add" value="Add" class="btn btn-info" /> <a
				href="../applicant.html">Finish</a>
		</p>
	</form:form>
</body>
</html>
