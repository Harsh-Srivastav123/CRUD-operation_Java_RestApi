package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Note;



public class GetNoteDao {
	private Connection connection=null;
	public GetNoteDao(Connection connection) {
		this.connection=connection;
	}
	
	public List<Note> getNote(){
		List<Note> list=new ArrayList<Note>();
		try {
			
			String sql="select * from note_table";
			PreparedStatement statement=connection.prepareStatement(sql);
			ResultSet resultSet=statement.executeQuery();
			while (resultSet.next()) {
				Note note=new Note();
				note.setId(resultSet.getInt(1));
				note.setNote_title(resultSet.getString(2));
				note.setNote_description(resultSet.getString(3));
				note.setNote_time(resultSet.getNString(4));
				list.add(note);
			
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		
		return list;
	}
	
	public Note getNoteById(int id) {
		Note note=null;
		
		try {
			

			String sql="select * from note_table where id=?";
			
			PreparedStatement statement=connection.prepareStatement(sql);
			statement.setInt(1, id);
			
			ResultSet resultSet=statement.executeQuery();
			
			
			if(resultSet.next()) {
				note =new Note(resultSet.getInt(1),
						resultSet.getString(2),
						resultSet.getString(3),
						resultSet.getString(4));
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return note;
	}

}
