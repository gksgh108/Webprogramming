package my.model;

import java.util.Date;

public class Inquiry{
	private int inquiryId;
	private String title;
	private String userId;
	private String content;
	private Date Date;
	
	public Inquiry() {}

	public Inquiry(int inquiryId, String title, String userId, String content, java.util.Date date) {
		super();
		this.inquiryId = inquiryId;
		this.title = title;
		this.userId = userId;
		this.content = content;
		Date = date;
	}

	public int getInquiryId() {
		return inquiryId;
	}

	public void setInquiryId(int inquiryId) {
		this.inquiryId = inquiryId;
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

	
