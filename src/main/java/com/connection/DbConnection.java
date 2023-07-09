package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	private static Connection connection=null;
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql:// localhost:3306/note_db?useSSL=false","root","H@rsh12345");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
		}
		
		return connection;
	}
}
