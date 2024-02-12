
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@page import="java.util.List"%>
<%@page import="com.entities.Notes"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes</title>
<%@include file="all_js_css.jsp"%>
<%@include file="navbar.jsp"%>
</head>
<body>
	<div class="container"><br>
		

		<h1 class="text-center text-uppercase text-primary"><i>All Notes</i></h1>



		<div class="row">
			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query query = s.createQuery("from Notes");
				List<Notes> list = query.list();

				for (Notes notes : list) {
				%>
				<div class="card shadow bg-white mt-2">
					<img src="img/note.png" style="max-width: 100px"
						class="card-img-top m-4">
					<div class="card-body px-5">
						<h5 class="card-title"><%=notes.getTitle()%></h5>
						<p class="card-text"><%=notes.getContent()%></p>
						<%-- <p>
							<b class=" card-text text-right text-warning"> <%=notes.getAddedDate()%>
							</b>
						</p> --%>
						<b>
							<p style="text-align: right; color: #FFA500;">
								<%
								SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
								String formattedDate = dateFormat.format(notes.getAddedDate());
								out.print(formattedDate);
								%>
							</p>
						</b>
						<div class="container text-center">
							<a href="DeleteServlets?note_id=<%=notes.getId()%>"
								class="btn btn-danger">Delete</a> <a
								href="edit.jsp?note_id=<%=notes.getId()%>"
								class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>
				<%
				}

				s.close();
				%>

			</div>

		</div>


	</div>
</body>
</html>