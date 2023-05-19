package my.model;

import java.util.Date;

public class Review {
	private int reviewId;
	private String title;
	private String content;
	private String userId;
	private Date bdate;
	private int star;
	private int pid;
	
	public Review() {}
	
	public Review(String title, String content, String userId, Date bdate, int star, int pid) {
		super();
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.bdate = bdate;
		this.star = star;
		this.pid = pid;
	}
	

	public Review(int reviewId, String title, String content, String userId, Date bdate, int star, int pid) {
		super();
		this.reviewId = reviewId;
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.bdate = bdate;
		this.star = star;
		this.pid = pid;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	
	
	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}
	
	
}
