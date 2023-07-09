package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Note;

public class AddNoteDao { 	
	private Connection connection;
	
	public AddNoteDao(Connection connection) {
		this.connection=connection;
		
	}
	
	public boolean addNote(Note note) {
		boolean status =false;
		
		try {
			String sql="insert into note_table(note_title,note_description,note_time) values(?,?,?)";
			
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, note.getNote_title());
			ps.setString(2, note.getNote_description());
			ps.setString(3, note.getNote_time());
			 
			
			int i=ps.executeUpdate();
			System.out.println("value  ->  "+i);
			if(i>=1) {
				status=true;
			}else {
				status=false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		
		return status;
	}
}