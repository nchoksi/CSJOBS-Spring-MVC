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
<title>CS Jobs - Application</title>

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
th{
	font-size: 16pt;
	font-family: serif;
	font-style: oblique;
	font-weight: bold;
}

</style>
</head>
<body>

	<h2>CS Jobs-Applicant</h2>

	<h3>
		<center>Title: ${application.job.title}</center>
	</h3>
	<table style="border: 1px solid grey;" class="table table-striped">
		<tr style="border: 1px solid grey;">
			<th style="border: 1px solid grey; width: 33%">Applicant</th>
			<th style="border: 1px solid grey; width: 33%">Submitted</th>
			<th style="border: 1px solid grey; width: 33%">Current Position</th>
		</tr>
		<tr style="border: 1px solid grey;">
			<td style="border: 1px solid grey;">${application.applicant.firstName}
				${application.applicant.lastName}</td>
			<td style="border: 1px solid grey;"><fmt:formatDate
					value="${application.submitDate}" pattern="M/d/yyyy" /></td>
			<td style="border: 1px solid grey;">${application.currentJobTitle}
				at ${application.currentJobInstitution} since
				${application.currentJobYear}</td>
		</tr>
	</table>
	<hr />
	<h3>
		<center>Click on Below Link to Download Files</center>
	</h3>
	<c:choose>
		<c:when test="${ !empty  application.cv }">
			<a href="../download.html?file=${application.cv.name }">
				Curriculum Vitae </a> &nbsp;&nbsp;
		</c:when>
		<c:when test="${ empty  application.cv }">

			<b>Curriculum Vitae</b>  &nbsp;&nbsp;
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${ !empty application.researchStatement }">
			<a
				href="../download.html?file=${application.researchStatement.name }">
				Research Statement</a> &nbsp;&nbsp;
		</c:when>
		<c:when test="${ empty application.researchStatement }">

			<b>Research Statement</b> &nbsp;&nbsp;
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${ !empty application.teachingStatement }">
			<a
				href="../download.html?file=${application.teachingStatement.name }">
				Teaching Statement</a>
		</c:when>
		<c:when test="${ empty application.teachingStatement }">

			<b>Teaching Statement</b>
		</c:when>
	</c:choose>
	<br />
	<br />
	<br />

	<table style="border: 1px solid grey;" class="table table-striped">
		<tr style="border: 1px solid grey;">
			<th style="border: 1px solid grey; width: 25%">Sr.No</th>
			<th style="border: 1px solid grey; width: 25%">Degree</th>
			<th style="border: 1px solid grey; width: 25%">School</th>
			<th style="border: 1px solid grey; width: 25%">Year</th>
		</tr>
		<c:forEach items="${application.degrees}" var="degree"
			varStatus="count">
			<tr style="border: 1px solid grey;">
				<td style="border: 1px solid grey;">${count.index+1}</td>
				<td style="border: 1px solid grey;">${degree.name}</td>
				<td style="border: 1px solid grey;">${degree.school}</td>
				<td style="border: 1px solid grey;">${degree.year}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
