package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Notes;
import com.helper.FactoryProvider;

public class EditNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			response.setContentType("text/html");
			String title = request.getParameter("title");
			int noteId = Integer.parseInt(request.getParameter("noteId").trim());
			String content = request.getParameter("content");

			Session session = FactoryProvider.getFactory().openSession();
			Transaction transaction = session.beginTransaction();

			Notes note = (Notes) session.get(Notes.class, noteId);

			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());

			transaction.commit();
			session.close();

			response.sendRedirect("all_notes.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
