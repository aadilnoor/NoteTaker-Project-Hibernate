<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_js_css.jsp"%>
<%@include file="navbar.jsp"%>
<title>Add Notes</title>
</head>
<body>
	<div class="container">

		

		<div class="container text-uppercase text-center text-primary"><br>
			<h1><i>Fill Your Notes Here</i></h1>
		</div>


		<!-- creating form  -->

		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="title" class="form-label"><h2>Title</h2></label><input required
					type="text" name="title" class="form-control shadow bg-white" id="title"
					aria-describedby="titleHelp" placeholder="Heading...">


			</div>
			<br> <br>

			<div class="form-group">
				<label for="content" class="form-label"><h2>Content</h2></label>
				<textarea name="content" id="content"
					placeholder="Enter your content here..." class="form-control shadow bg-white"
					style="height: 200px"></textarea>

			</div>
			<br>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary shadow bg-primary">Add</button>
			</div>
		</form>

	</div>
</body>
</html>