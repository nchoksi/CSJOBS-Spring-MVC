<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
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
	<h2>CS Jobs-Reviewer</h2>
	<form action="logout" method="post">
		<table align="right">
			<tr style="width: 100%">
				<td align="right"><input name="_csrf" type="hidden"
					value="${_csrf.token}" /> <input name="submit" type="submit"
					value="Logout" class="btn btn-danger" /></td>
			</tr>
		</table>
	</form>
	<h3>List of Jobs</h3>
	<table class="table table-striped" style="border: 1px solid grey;">
		<tr style="border: 1px solid grey;">
			<th style="border: 1px solid grey; width: 10%">Sr.No</th>
			<th style="border: 1px solid grey; width: 45%">Job List</th>
			<th style="border: 1px solid grey; width: 45%">Show Applicants</th>
		</tr>
		<c:forEach items="${openJobs}" var="job" varStatus="count">
			<tr style="border: 1px solid grey;">
				 <td style="border: 1px solid grey;">${count.index+1}</td>
				<td style="border: 1px solid grey;" style="width: 50%"><a
					href="<c:url value='/job/view.html?id=${job.id}' />">${job.title}</a></td>
				<td style="border: 1px solid grey;" style="width: 50%">
				 <c:forEach items="${job.committeeMembers}" var="rev">
						
						<security:authorize access="hasRole('ROLE_REVIEWER') and principal.username == '${rev.email}'">
							<a href="reviewer/applicants.html?jobId=${job.id }">[Show
								Applicants]</a>
						</security:authorize>
					</c:forEach>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
