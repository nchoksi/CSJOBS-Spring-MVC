<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs - Admin</title>
<style type="text/css">
body {
	margin-left: 200px;
	margin-right: 200px;
	margin-top: 50px;
	background-image: url("job-puzzle.jpg");
	color: Brown;
	background-size: 100%;
}

th {
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

	<form action="logout" method="POST">
		<table align="right">
			<tr style="width: 100%">
				<td align="right"><input name="_csrf" type="hidden"
					value="${_csrf.token}" /> <input name="submit" type="submit"
					value="Logout" class="btn btn-danger" /></td>
			</tr>
		</table>
	</form>

	<a href="addJob.html" class="btn btn-success"
		style="font-family: sans-serif; font-size: large; font-style: oblique; font-weight: bolder; ">
		Create New Job</a>

	<br>
	<h3>
		<center>All Job Postions</center>
	</h3>
	<table style="border: 1px solid grey;" class="table table-striped">
		<tr style="border: 1px solid grey;">
			<th style="border: 1px solid grey;">Sr.No</th>
			<th style="border: 1px solid grey;">Job Titles</th>
			<th style="border: 1px solid grey;">Publish Date</th>
			<th style="border: 1px solid grey;">Close Date</th>
			<th style="border: 1px solid grey;">Operation</th>
			<th style="border: 1px solid grey;">Show Applicants</th>

		</tr>

		<c:forEach items="${openJobs}" var="job" varStatus="count">
			<tr style="border: 1px solid grey;">
				<td style="border: 1px solid grey;">${count.index+1}</td>
				<td style="border: 1px solid grey;"><a
					href="<c:url value='adminJobs.html?id=${job.id}' />">${job.title}</a>
				</td>
				<td style="border: 1px solid grey;"><fmt:formatDate
						value="${job.publishDate}" pattern="M/d/yyyy" /></td>
				<td style="border: 1px solid grey;"><fmt:formatDate
						value="${job.closeDate}" pattern="M/d/yyyy" /></td>
				<td style="border: 1px solid grey;"><a
					href="editJob.html?jobIdd=${job.id }">[ Edit ]</a></td>
				<td style="border: 1px solid grey;"><a
					href="applicants.html?jobId=${job.id }"> [Show Applicants]</a></td>

			</tr>
		</c:forEach>


	</table>

</body>
</html>
