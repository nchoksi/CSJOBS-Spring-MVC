<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CSJobs - Job</title>
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
	<h2>CS Jobs-Admin</h2>
	<form action="logout" method="post">
		<table align="right">
			<tr style="width: 100%">
				<td align="right"><input name="_csrf" type="hidden"
					value="${_csrf.token}" /> <input name="submit" type="submit"
					value="Logout" class="btn btn-danger" /></td>
			</tr>
		</table>
	</form>
	<br />
	<br />
	<br />
	<h3>
		<center>Job Title: ${adminJob.title}</center>
	</h3>
	<table class="table table-striped">
		<tr>
			<th>Posted on:</th>
			<th>Close on:</th>
			<th>Job Description:</th>
			<th>Committee Chair:</th>
			<th>Committee Members:</th>
		</tr>
		<tr>
			<td><fmt:formatDate value="${adminJob.publishDate}"
					pattern="M/d/yyyy" /></td>
			<td><fmt:formatDate value="${adminJob.closeDate}"
					pattern="M/d/yyyy" /></td>
			<td>${adminJob.description}</td>
			<td>${adminJob.committeeChair.firstName}
				${adminJob.committeeChair.lastName}</td>
			<td><c:forEach items="${adminJob.committeeMembers}"
					var="listofcommittee">
					<ul>
						<li>${listofcommittee.firstName }${listofcommittee.lastName }</li>
					</ul>
				</c:forEach></td>
		</tr>
	</table>
</body>
</html>
