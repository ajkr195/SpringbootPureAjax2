<%@include file="header.jsp"%>
<%@include file="navbar.jsp"%>
</head>
<body>
	<div class="container">
		<hr />
		<div style="text-align: center">
			<h2>${AppTitle}</h2>
		</div>
		<br>
			<div class="otherchecks alert-sm alert-success col-sm-6" style="display: none;"><hr/>SUCCESS<hr/></div>
			<div class="form-group row">
				<label for="useremail" class="col-sm-1 control-label"
					style="text-align: left">Name</label>
				<div class="col-md-6">
					<input type="text" name="name" id="name" placeholder="Enter Name"
						class="form-control input-sm" />
				</div>
			</div>

			<div class="form-group row">
				<label for="useremail" class="col-sm-1 control-label"
					style="text-align: left">Age</label>
				<div class="col-md-6">
					<input type="text" name="age" id="age" placeholder="Enter Age"
						class="form-control input-sm" />
				</div>
			</div>

			<input type="button" id="add-appuser" value="Add" />
		<!-- 		</div> -->
		<br><br>

		<table id="appuser-list" class="table table-hover table-responsive-sm"
			style="width: 60%">

			<c:forEach items="${appusers}" var="appuser">
				<tr>
					<td>${appuser.id}</td>
					<td class="display${appuser.id}" id="displayName${appuser.id}">
						${appuser.name}</td>
					<td class="display${appuser.id}" id="displayAge${appuser.id}">
						${appuser.age}</td>
					<td style="display: none;" class="edit${appuser.id}"><input
						type="text" name="editName${appuser.id}"
						id="editName${appuser.id}" value="${appuser.name}" /></td>
					<td style="display: none;" class="edit${appuser.id}"><input
						type="text" name="editAge${appuser.id}" id="editAge${appuser.id}"
						value="${appuser.age}" /></td>
					<td><input type="button" class="delete-appuser"
						data-item-id="${appuser.id}" id="delete-appuser${appuser.id}"
						value="Delete" /></td>
					<td><input type="button" class="update-appuser"
						data-item-id="${appuser.id}" id="update-appuser${appuser.id}"
						value="Update" /></td>
					<td style="display: none;" class="edit${appuser.id}"><input
						type="button" class="update-appuser" data-item-id="${appuser.id}"
						id="edit-appuser${appuser.id}" value="Confirm" /></td>
					<td id="updatecheck${appuser.id}" style="display: none"><span
						class="label label-success">OK</span></td>
				</tr>
			</c:forEach>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Age</th>
			</tr>
		</table>

	</div>
</body>
<%@include file="footer.jsp"%>

<script>
	$(document)
			.ready(
					function() {

						$("#add-appuser")
								.click(
										function() {

											var name = $("#name").val();
											var age = $("#age").val();

											var data = JSON.stringify({
												"name" : name,
												"age" : age
											});

											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/addAppUser",
														contentType : "application/json",
														data : data,
														success : function(data) {

															if (data === "") {
																return;
															} else {
																var html = [];
																html
																		.push(
																				'<tr>',
																				'<td>'
																						+ data.id
																						+ '</td>',
																				'<td class="display'+data.id+'" id="displayName'+data.id+'">'
																						+ data.name
																						+ '</td>',
																				'<td class="display'+data.id+'" id="displayAge'+data.id+'">'
																						+ data.age
																						+ '</td>',
																				'<td style="display: none;" class="edit'+data.id+'"> <input type="text" name="editName'+data.id+'" id="editName'+data.id+'" value="'+data.name+'" /></td>',
																				'<td style="display: none;" class="edit'+data.id+'"> <input type="text" name="editAge'+data.id+'" id="editAge'+data.id+'" value="'+data.age+'" /></td>',
																				'<td><input type="button" class="delete-appuser" data-item-id="'+data.id+'" id="delete-appuser'+data.id+'" value="Delete" /></td>',
																				'<td> <input type="button" class="update-appuser" data-item-id="'+data.id+'" id="update-appuser'+data.id+'" value="Update" /> </td>',
																				'<td style="display: none;" class="edit'+data.id+'"> <input type="button"  class="update-appuser" data-item-id="'+data.id+'" id="edit-appuser'+data.id+'" value="Confirm" /> </td>',
																				'<td id="updatecheck'+data.id+'" style="display: none;background-color: greenyellow; color:white;">OK</td>',
																				'</tr>');
																var a = html
																		.join("");
																$(
																		'#appuser-list tr:last')
																		.before(
																				a);

																$("#name").val(
																		"");
																$("#age").val(
																		"");

																$(
																		".otherchecks")
																		.show();
																setTimeout(
																		function() {
																			$(
																					".otherchecks")
																					.hide();
																		}, 2000);
															}
														}
													});
										});

						$("#appuser-list")
								.on(
										'click',
										'.update-appuser',
										function() {

											var value = $(event.target).val();
											var id = $(event.target).data(
													'itemId');
											var tdclassshow = ".edit" + id;
											var tdclasshide = ".display" + id;
											var editnameid = "#editName" + id;
											var editageid = "#editAge" + id;

											var confirmbuttonshow = ".edit"
													+ id;

											if (value === "Update") {
												$(tdclassshow).show();
												$(tdclasshide).hide();
												$(confirmbuttonshow).show();
											} else if (value === "Confirm") {
												var name = $(editnameid).val();
												var age = $(editageid).val();
												var data = JSON.stringify({
													"id" : id,
													"name" : name,
													"age" : age
												});

												$
														.ajax({
															type : "PUT",
															url : "${pageContext.request.contextPath}/updateAppUser",
															contentType : "application/json",
															data : data,
															success : function(
																	data) {

																$(tdclassshow)
																		.hide();
																$(tdclasshide)
																		.show();
																$(
																		confirmbuttonshow)
																		.hide();

																var dispName = "#displayName"
																		+ id;
																var dispAge = "#displayAge"
																		+ id;
																$(dispName)
																		.text(
																				name);
																$(dispAge)
																		.text(
																				age);

																$(
																		'#updatecheck'
																				+ id)
																		.show();
																setTimeout(
																		function() {
																			$(
																					'#updatecheck'
																							+ id)
																					.hide();
																		}, 2000);

															}
														});

											}

										});

						$("#appuser-list")
								.on(
										'click',
										'.delete-appuser',
										function(event) {
											var id = $(event.target).data(
													'itemId');
											var data = JSON.stringify({
												"id" : id
											});
											var rowId = "#" + event.target.id;
											$
													.ajax({
														type : "DELETE",
														url : "${pageContext.request.contextPath}/deleteAppUser",
														contentType : "application/json",
														data : data,
														success : function(data) {
															$(rowId).closest(
																	'tr')
																	.remove();
															$(".otherchecks")
																	.show();
															setTimeout(
																	function() {
																		$(
																				".otherchecks")
																				.hide();
																	}, 2000);
														}
													});
										});

						$("#testmap")
								.click(
										function() {

											var data = JSON.stringify({
												question : "1",
												answer : "2"
											});

											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/testmap",
														headers : {
															'Accept' : 'application/json',
															'Content-Type' : 'application/json'
														},
														//            contentType: "application/json",
														data : data,
														success : function(data) {

														}
													});
										});

					});
</script>
</html>
