package my.model;

import java.util.Date;

public class Event{
	private int eventId;
	private String title;
	private String userId;
	private String content;
	private Date Date;
	
	public Event() {}

	public Event(int eventId, String title, String userId, String content, java.util.Date date) {
		super();
		this.eventId = eventId;
		this.title = title;
		this.userId = userId;
		this.content = content;
		Date = date;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return Date;
	}

	public void setDate(Date date) {
		Date = date;
	}
	
}

	
