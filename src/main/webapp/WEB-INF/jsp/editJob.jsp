<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	<h2>CS Jobs</h2>

	<form action="logout" method="post">
		<table align="right">
			<tr style="width: 100%">
				<td align="right"><input name="_csrf" type="hidden"
					value="${_csrf.token}" /> <input name="submit" type="submit"
					value="Logout" class="btn btn-danger" /></td>
			</tr>
		</table>
	</form>
	<br>
	
	<h3>${adminJob.title}</h3>
	<form:form modelAttribute="editJob">
		<input type="hidden" name="id" value="${editJob.id }" />
		<table class="table table-striped" style="border: 1px  solid grey;">
			<tr style="border: 1px  solid grey;">
				<th style="border: 1px  solid grey;">Title:</th>
				<td style="border: 1px  solid grey;"><form:input path="title" class="form-control"
						style="width:50%" /></td>
			</tr>
			<tr style="border: 1px  solid grey;">
				<th style="border: 1px  solid grey;">Description:</th>
				<td style="border: 1px  solid grey;"><form:input path="description" class="form-control"
						style="width:50%" /></td>
			</tr>
			<tr style="border: 1px  solid grey;">
				<th style="border: 1px  solid grey;">Publish Date:</th>
				<td style="border: 1px  solid grey;"><form:input path="publishDate" class="form-control"
						style="width:50%" placeholder="MM/dd/YYYY" /></td>
			</tr>
			<tr style="border: 1px  solid grey;">
				<th style="border: 1px  solid grey;">Close Date:</th>
				<td style="border: 1px  solid grey;"><form:input path="closeDate" class="form-control"
						style="width:50%" placeholder="MM/dd/YYYY" /></td>

			</tr>

			<tr>
				<th style="border: 1px  solid grey;">Committee Chair</th>
				<td style="border: 1px  solid grey;"><form:select items="${reviewer}" path="committeeChair"
						class="form-control" style="width:50%" itemValue="id"
						itemLabel="firstName" /></td>
			</tr>
			<tr style="border: 1px  solid grey;">
				<th style="border: 1px  solid grey;">Committee Members</th>
				<td style="border: 1px  solid grey;"><c:forEach items="${reviewer}" var="reviewer">
						<form:checkbox path="committeeMembers" value="${reviewer}" />
    						${reviewer.firstName} <br />
					</c:forEach></td>
			</tr>


			<%--  <tr>
				<th>Chair:</th>
				<td><select name="chairId" class="form-control" style="width:50%">
						<c:forEach items="${reviewer }" var="reviewers">

							<option value="${reviewers.id}">${reviewers.firstName}</option>

						</c:forEach>

				</select></td>

			</tr> 
			<tr>
				<th>Committee Members:</th>
				<td><c:forEach items="${reviewer }" var="reviewers">

						<input type="checkbox" value="${reviewers.email}" name="reviewer">
						<input type="hidden" value="${param.jobId }" name="jobId">
				${reviewers.firstName}<br>
					</c:forEach></td>

			</tr>
			<tr> --%>
			<td><br /></td>

			<td style="border: 1px  solid grey;"><input type="submit" name="Publish" value="Publish"
				class="btn btn-success" /></td>

			</tr>
		</table>

	</form:form>
</body>
</html>