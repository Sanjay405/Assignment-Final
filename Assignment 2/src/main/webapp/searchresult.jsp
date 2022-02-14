<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
	<style>
body {
	background-color: purple;
}

.center {
	text-align: center;
}
</style>

</head>
<body>
		<c:if test="${empty list }">
			<h1 style="text-align:center;">----No Records Found----</h1><br>
			<br>
			<br>
		</c:if>
		<table>
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Type</th>
					<th scope="col">Phone</th>
					<th scope="col">Country</th>
					<th scope="col">State</th>
					<th scope="col">City</th>
					<th scope="col">Street</th>
					<th scope="col">PinCode</th>
					<th scope="col">Created By</th>
					<th scope="col">Created On</th>
					<th scope="col">Updated By</th>
					<th scope="col">Updated On</th>
				</tr>
			</thead>
			<c:forEach var="emp" items="${list}">
				<tr>
					<td>${emp.cid }</td>
					<td>${emp.name }</td>
					<td>${emp.customer_type }</td>
					<td>${emp.phone }</td>
					<td>${emp.country }</td>
					<td>${emp.state }</td>
					<td>${emp.city }</td>
					<td>${emp.street }</td>
					<td>${emp.pincode }</td>
					<td>${emp.created_by }</td>
					<td>${emp.created_on }</td>
					<td>${emp.updated_by }</td>
					<td>${emp.updated_on }</td>
				</tr>
			</c:forEach>
		</table>

</body>
</html>