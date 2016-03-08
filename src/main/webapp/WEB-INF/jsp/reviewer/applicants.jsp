<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs - Reviewer</title>
<style type="text/css">
body {
	margin-left: 200px;
	margin-right: 200px;
	margin-top: 50px;
	background-image: url("../job-puzzle.jpg");
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
	<h2>CS Jobs</h2>
	
	<table style="border: 1px solid grey;" class="table table-striped">
		<tr style="border: 1px solid grey;">
			<th style="border: 1px solid grey; width: 10%">Sr.No</th>
			<th style="border: 1px solid grey; width: 45%">Name of
				applicants</th>
			<th style="border: 1px solid grey; width: 45%">Check
				Applications</th>
		</tr>
		<h3>
			<center>Applicants Who Applied for this Job are:</center>
		</h3>
		<c:forEach items="${ applicants }" var="app" varStatus="count">
			<tr style="border: 1px solid grey;">
				<td style="border: 1px solid grey;">${count.index+1}</td>
				<td style="border: 1px solid grey;">${app.applicant.lastName },${app.applicant.firstName }</td>
				<td style="border: 1px solid grey;">[<a
					href="<c:url value='/application/view.html?id=${app.id}' />">Application</a>]
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
