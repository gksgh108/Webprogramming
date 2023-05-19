package my.model;

import java.util.*;

public class OrderListView {

	private int orderTotalCount;
	private int currentPageNumber;
	private List<Order> orderList;
	private int pageTotalCount;
	private int orderCountPerPage;
	
	
	public OrderListView(int orderTotalCount, int currentPageNumber, List<Order> orderList,
			int orderCountPerPage) {
		super();
		this.orderTotalCount = orderTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.orderList = orderList;
		this.orderCountPerPage = orderCountPerPage;
		calculatePageTotalCount(); // 객체 생성시 메소드 사용
	}

	private void calculatePageTotalCount() {
		if (orderTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = orderTotalCount / orderCountPerPage;
			if (orderTotalCount % orderCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}


	public int getOrderTotalCount() {
		return orderTotalCount;
	}


	public void setOrderTotalCount(int orderTotalCount) {
		this.orderTotalCount = orderTotalCount;
	}


	public int getCurrentPageNumber() {
		return currentPageNumber;
	}


	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}


	public List<Order> getOrderList() {
		return orderList;
	}


	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}


	public int getPageTotalCount() {
		return pageTotalCount;
	}


	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}


	public int getOrderCountPerPage() {
		return orderCountPerPage;
	}


	public void setOrderCountPerPage(int orderCountPerPage) {
		this.orderCountPerPage = orderCountPerPage;
	}

	
	
}
