package my.model;

import java.util.Date;

public class Notice{
	private int noticeId;
	private String title;
	private String userId;
	private String content;
	private Date Date;
	
	public Notice() {}

	public Notice(int noticeId, String title, String userId, String content, java.util.Date date) {
		super();
		this.noticeId = noticeId;
		this.title = title;
		this.userId = userId;
		this.content = content;
		Date = date;
	}

	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
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

	
