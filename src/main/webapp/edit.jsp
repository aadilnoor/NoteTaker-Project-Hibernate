<%@page import="com.entities.Notes"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Page</title>
<%@include file="all_js_css.jsp"%>
<%@include file="navbar.jsp"%>
</head>
<body>

	<div class="container"><br>

		
		<h1 class="container text-uppercase text-center text-primary"><i>Edit Your Note</i></h1>
		


		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session session2 = FactoryProvider.getFactory().openSession();
		Notes note = (Notes) session2.get(Notes.class, noteId);
		%>

		<!-- creating form  -->

		<form action="EditNoteServlet" method="post">

			<input value="<%=note.getId()%>" name="noteId" type="hidden" />

			<div class="form-group">
				<label for="title" class="form-label"><h2>Title</h2></label><input required
					type="text" name="title" class="form-control shadow bg-white" id="title"
					aria-describedby="titleHelp" placeholder="Heading..."
					value="<%=note.getTitle()%>">


			</div>
			<br> <br>

			<div class="form-group">
				<label for="content" class="form-label"> <h2>Content</h2> </label>
				<textarea name="content" id="content"
					placeholder="Enter your content here..." class="form-control shadow bg-white"
					style="height: 200px"><%=note.getContent()%></textarea>

			</div>
			<br>
			<div class="container text-center">
				<button type="submit" class="btn btn-success shadow bg">Update</button>
			</div>
		</form>

	</div>

</body>
</html>