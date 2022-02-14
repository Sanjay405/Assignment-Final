<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update data</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
</head>

<body>
        <form action="/update" method="post" style="background-color: rgb(158, 68, 143)">
                    
        	<label for="phone" class="font-weight-bold col-form-label">Phone Number</label>
                    <input type="tel" class="form-control form-control-lg" maxlength="10" pattern="[6789][0-9]{9}" id="phone" placeholder="Phone Number" name="phone" required>

            <label for="custype" class="col-sm-2 font-weight-bold bg-light text-dark col-form-label">Customer Type:</label>
                    <select class="form-select" class="form-control pull-left" name="customer_type" required>
                        <option disabled>-Customer Type-</option>
                        <option value="Core" selected>None</option>
                        <option value="Casual">Casual</option>
                        <option value="Temporary">Temporary</option>
                        <option value="Impulsive">Impulsive</option>
                   
                    </select>
                
             <label for="name" class="col-sm-2 font-weight-bold col-form-label ">Customer Name:</label>
                    <input type="text" class="form-control-plaintext" pattern="^[a-zA-Z\s]+$" id="name" placeholder="Enter Your Name" name="name" required>
   
             <label>Country:</label>
                    <select id="dropdownCountry" class="form-control pull-left" name="country" required>
                        <option selected>-Select Country-</option>
                        <c:forEach var="country" items="${countries }">
                            <option value="${country.id}">${country.name}</option>
                        </c:forEach>
                    </select>
                
             <label for="custype" class="col-sm-2 font-weight-bold text-dark bg-light col-form-label">State:</label>
                    <select id="dropdownState" class="form-control pull-left" name="state" required>
                    </select>
           
             <label for="custype" class="col-sm-2 font-weight-bold text-dark bg-light col-form-label">City:</label>
                    <select id="dropdownCity" class="form-control pull-left " name="city" required> </select>
               
             <label for="street" class="col-sm-3 font-weight-bold col-form-label">Street/Landmark:</label>
                    <input type="text" class="form-control-plaintext" maxlength="100" id="street" placeholder="Enter Street" name="street" required>
        
             <label for="pincode" class="col-sm-3 font-weight-bold col-form-label">PinCode:</label>
                    <input type="text" maxlength="6" class="form-control-plaintext" id="pincode" pattern="[0-9]{6}" placeholder="Enter Pincode" name="pincode" required>
         
             <label for="Update By" class="col-sm-3 font-weight-bold col-form-label">Updated By:</label>
                    <input type="text" class="form-control-plaintext col-form-label" id="created" pattern="^[a-zA-Z\s]+$" placeholder="Updated By" name="updated_by" required>
                
             <button type="submit" class="btn btn-primary ">Update Data</button><br><br>

        </form>

<script type="text/javascript">
	$(document).ready(function() {
						$("#dropdownState").val($("#dropdownState option:first").val());
						$('#dropdownCountry').on('change',
										function() {
											var countryId = $(this).val();
											$.ajax({
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
															$('#dropdownState')
																	.html(state);
															$("#dropdownState")
																	.val(
																			$(
																					"#dropdownState option:first")
																					.val());
															$("#dropdownCity")
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
															$('#dropdownCity')
																	.html(city);
														}
													});
										});
					});
</script>
</body>

</html>