package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DbConnection;
import com.dao.DeleteDao;

/**
 * Servlet implementation class DeleteNote
 */
@WebServlet("/delete")
public class DeleteNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DeleteDao deleteNote=new DeleteDao(DbConnection.getConnection());
		int id=Integer.parseInt(request.getParameter("id"));
		boolean status=deleteNote.deleteNote(id);
		System.out.println(status);
		if(status) {
			response.sendRedirect("index.jsp");
		}
	}


}
