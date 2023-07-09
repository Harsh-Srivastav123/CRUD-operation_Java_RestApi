package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeleteDao {
	
	private Connection connection=null;
	public DeleteDao(Connection connection) {
		this.connection=connection;
	}
	
	public boolean deleteNote(int id) {
		boolean status=false;
		
		try {
			String sql="delete from note_table where id=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1) {
				status=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		
		return status;
	}
	
}
