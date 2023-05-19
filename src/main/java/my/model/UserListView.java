package my.model;

import java.util.*;

public class UserListView {

	private int userTotalCount;
	private int currentPageNumber;
	private List<User> userList;
	private int pageTotalCount;
	private int userCountPerPage;
	
	
	public UserListView(int userTotalCount, int currentPageNumber, List<User> userList,
			int userCountPerPage) {
		super();
		this.userTotalCount = userTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.userList = userList;
		this.userCountPerPage = userCountPerPage;
		calculatePageTotalCount(); // 객체 생성시 메소드 사용
	}

	private void calculatePageTotalCount() {
		if (userTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = userTotalCount / userCountPerPage;
			if (userTotalCount % userCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}


	public int getUserTotalCount() {
		return userTotalCount;
	}


	public void setUserTotalCount(int userTotalCount) {
		this.userTotalCount = userTotalCount;
	}


	public int getCurrentPageNumber() {
		return currentPageNumber;
	}


	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}


	public List<User> getUserList() {
		return userList;
	}


	public void setUserList(List<User> userList) {
		this.userList = userList;
	}


	public int getPageTotalCount() {
		return pageTotalCount;
	}


	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}


	public int getUserCountPerPage() {
		return userCountPerPage;
	}


	public void setUserCountPerPage(int userCountPerPage) {
		this.userCountPerPage = userCountPerPage;
	}

	
	
}
