package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Note;

public class UpdateNoteDao {
	private static Connection connection=null;
	
	public UpdateNoteDao(Connection connection) {
		this.connection=connection;
	}
	
	public boolean updateNote(Note note) {
		boolean status=false;
		
		try {
			
            String sql="update note_table set note_title=?,note_description=?,note_time=? where id=?";
			
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, note.getNote_title());
			ps.setString(2, note.getNote_description());
			ps.setString(3, note.getNote_time());
			ps.setInt(4, note.getId());
			 
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				status=true;
			}else {
				status=false;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return status;
		
	}

}
