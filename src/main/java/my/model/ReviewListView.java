package my.model;

import java.util.*;

public class ReviewListView {

	private int reviewTotalCount;
	private int currentPageNumber;
	private List<Review> reviewList;
	private int pageTotalCount;
	private int reviewCountPerPage;
	
	
	public ReviewListView(int reviewTotalCount, int currentPageNumber, List<Review> reviewList,
			int reviewCountPerPage) {
		super();
		this.reviewTotalCount = reviewTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.reviewList = reviewList;
		this.reviewCountPerPage = reviewCountPerPage;
		calculatePageTotalCount(); // 객체 생성시 메소드 사용
	}

	private void calculatePageTotalCount() {
		if (reviewTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = reviewTotalCount / reviewCountPerPage;
			if (reviewTotalCount % reviewCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}


	public int getReviewTotalCount() {
		return reviewTotalCount;
	}


	public void setReviewTotalCount(int reviewTotalCount) {
		this.reviewTotalCount = reviewTotalCount;
	}


	public int getCurrentPageNumber() {
		return currentPageNumber;
	}


	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}


	public List<Review> getReviewList() {
		return reviewList;
	}


	public void setReviewList(List<Review> reviewList) {
		this.reviewList = reviewList;
	}


	public int getPageTotalCount() {
		return pageTotalCount;
	}


	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}


	public int getReviewCountPerPage() {
		return reviewCountPerPage;
	}


	public void setReviewCountPerPage(int reviewCountPerPage) {
		this.reviewCountPerPage = reviewCountPerPage;
	}

	
	
}
