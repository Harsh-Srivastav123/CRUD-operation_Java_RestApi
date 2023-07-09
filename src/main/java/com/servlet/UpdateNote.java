package com.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DbConnection;
import com.dao.UpdateNoteDao;
import com.entity.Note;

/**
 * Servlet implementation class UpdateNote
 */
@WebServlet("/update")
public class UpdateNote extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String title=request.getParameter("title");
		String description=request.getParameter("description");
		int id=Integer.parseInt(request.getParameter("id"));
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		System.out.println(formatter.format(calendar.getTime()));
		String timeStamp=formatter.format(calendar.getTime()).toString();
		
		Note note=new Note(id,title,description,timeStamp);
		
		UpdateNoteDao update=new UpdateNoteDao(DbConnection.getConnection());
		boolean status=update.updateNote(note);
		if(status) {
			response.sendRedirect("index.jsp");
		}
	
		
		
		
	}

}
