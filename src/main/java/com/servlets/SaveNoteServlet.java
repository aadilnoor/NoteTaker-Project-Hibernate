package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Notes;
import com.helper.FactoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			response.setContentType("text/html");
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			Notes notes = new Notes(title, content, new Date());

			Session session = FactoryProvider.getFactory().openSession();
			Transaction transaction = session.beginTransaction();
			session.save(notes);
			transaction.commit();
			session.close();

			PrintWriter writer = response.getWriter();
			writer.print("<h1 style='color:#e91e63; text-align:center'> Note is Added Successfully </h1>");
			writer.print("<h1 style='text-align:center'> <a href='all_notes.jsp'>View all notes</a> </h1>");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
