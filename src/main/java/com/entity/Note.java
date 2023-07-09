package com.entity;

public class Note {
	private int id;

	private String note_title;
	private String note_description;
	private String note_time;
	public Note() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getNote_title() {
		return note_title;
	}
	public Note( String note_title, String note_description, String note_time) {
		
		this.note_title = note_title;
		this.note_description = note_description;
		this.note_time = note_time;
	}
	
	
	
	public Note(int id, String note_title, String note_description, String note_time) {
		super();
		this.id = id;
		this.note_title = note_title;
		this.note_description = note_description;
		this.note_time = note_time;
	}
	public void setNote_title(String note_title) {
		this.note_title = note_title;
	}
	public String getNote_description() {
		return note_description;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setNote_description(String note_description) {
		this.note_description = note_description;
	}
	public String getNote_time() {
		return note_time;
	}
	public void setNote_time(String note_time) {
		this.note_time = note_time;
	}
	@Override
	public String toString() {
		return "Note [id=" + id + ", note_title=" + note_title + ", note_description=" + note_description
				+ ", note_time=" + note_time + "]";
	}
}
