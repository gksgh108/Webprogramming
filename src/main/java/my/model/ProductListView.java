package my.model;

import java.util.*;

public class ProductListView {

	private int productTotalCount;
	private int currentPageNumber;
	private List<Product> productList;
	private int pageTotalCount;
	private int productCountPerPage;
	
	
	public ProductListView(int productTotalCount, int currentPageNumber, List<Product> productList,
			int productCountPerPage) {
		super();
		this.productTotalCount = productTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.productList = productList;
		this.productCountPerPage = productCountPerPage;
		calculatePageTotalCount(); // 객체 생성시 메소드 사용
	}

	private void calculatePageTotalCount() {
		if (productTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = productTotalCount / productCountPerPage;
			if (productTotalCount % productCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}


	public int getProductTotalCount() {
		return productTotalCount;
	}


	public void setProductTotalCount(int productTotalCount) {
		this.productTotalCount = productTotalCount;
	}


	public int getCurrentPageNumber() {
		return currentPageNumber;
	}


	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}


	public List<Product> getProductList() {
		return productList;
	}


	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}


	public int getPageTotalCount() {
		return pageTotalCount;
	}


	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}


	public int getProductCountPerPage() {
		return productCountPerPage;
	}


	public void setProductCountPerPage(int productCountPerPage) {
		this.productCountPerPage = productCountPerPage;
	}

	
	
}
