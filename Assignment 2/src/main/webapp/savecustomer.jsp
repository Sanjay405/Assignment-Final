<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert Data</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
	
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

	<form action="/save" method="post">
		<h3>Customer's Details</h3>
		<div class="container" style="background-color: rgb(158, 68, 143)">
			<div class="dropdown">
				<button class="btn btn-primary dropdown-toggle" type="button"
					data-toggle="dropdown">
					CRUD OPERATIONS <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="save">Save Data</a></li>
					<li><a href="delete">Delete Data</a></li>
					<li><a href="update">Update Data</a></li>
					<li><a href="search">Search Data</a></li>
				</ul>
			</div>
		
		<br> ​ <label>Customer Name:</label> <input type="text"
			pattern="^[a-zA-Z\s]+$" id="name" placeholder="Enter Your Name"
			name="name" required> <br> <label>Customer Type:</label>
		<select name="customer_type" required>
 			<option disabled>-Customer Type-</option>
			<option value="None" selected>None</option>
			<option value="Casual">Casual</option>
			<option value="Core">Core</option>
			<option value="Temporary">Temporary</option>
		</select> <br> <label>Phone Number:</label> <input type="tel"
			maxlength="10" pattern="[6789][0-9]{9}" id="phone"
			placeholder="Phone Number" name="phone" required> <br> <label>Country:</label>
		<select id="dropdownCountry" name="country" required>
			<option selected>-Select Country-</option>
			<c:forEach var="country" items="${countries }">
				<option value="${country.id}">${country.name}</option>
			</c:forEach>
		</select> <br> <label>State:</label> <select id="dropdownState"
			name="state" required>
		</select> <br> <label>City:</label> <select id="dropdownCity" name="city"
			required>
		</select> <br> <label>Street/Landmark:</label> <input type="text"
			maxlength="100" id="street" placeholder="Enter Street" name="street"
			required> <br> <label>PinCode:</label> <input
			type="text" maxlength="6" id="pincode" pattern="[0-9]{6}"
			placeholder="Enter Pincode" name="pincode" required> <br>

		<label>Created By:</label> <input type="text" id="created"
			pattern="^[a-zA-Z\s]+$" placeholder="Created By" name="created_by"
			required> <br>

		
</div>
<div class="container" style="background-color: rgb(88, 68, 158)">
<button type="submit">Save Data</button>
</div>
		<br> <br>
	</form>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#dropdownState").val(
									$("#dropdownState option:first").val());
							$('#dropdownCountry')
									.on(
											'change',
											function() {
												var countryId = $(this).val();
												$
														.ajax({
															type : 'GET',
															url : '${pageContext.request.contextPath }/loadStatesByCountry/'
																	+ countryId,
															success : function(
																	result) {
																var result = JSON
																		.parse(result);
																var state = '';
																state += '<option disabled selected="selected">--Select State--</option>';
																for (var i = 0; i < result.length; i++) {
																	state += '<option value="' + result[i].id + '">'
																			+ result[i].name
																			+ '</option>';
																}
																$(
																		'#dropdownState')
																		.html(
																				state);
																$(
																		"#dropdownState")
																		.val(
																				$(
																						"#dropdownState option:first")
																						.val());
																$(
																		"#dropdownCity")
																		.val(
																				$(
																						"#dropdownCity option:first")
																						.val());
															}
														});
											});

							$('#dropdownState')
									.on(
											'change',
											function() {
												var stateId = $(this).val();
												$
														.ajax({
															type : 'GET',
															url : '${pageContext.request.contextPath }/loadCitiesByState/'
																	+ stateId,
															success : function(
																	result) {
																var result = JSON
																		.parse(result);
																var city = '';
																city += '<option disabled selected="selected">--Select City--</option>';
																for (var i = 0; i < result.length; i++) {
																	city += '<option value="' + result[i].id + '">'
																			+ result[i].name
																			+ '</option>';
																}
																$(
																		'#dropdownCity')
																		.html(
																				city);
															}
														});
											});
						});
	</script>
</body>

</html>