package my.model;

import java.util.Date;

public class Product {
	private int pid;
	private String pname;
	private int price;
	private String pcolor;
	private Date pdate;
	private String pimage;
	private String category;
	private int amount;
	private String psize;
	private int pview;
	
	
	public Product() {}
	
	public Product(String pname, int price, String pcolor, String pimage, String category, int amount) {
		this.pname = pname;
		this.price = price;
		this.pcolor = pcolor;
		this.pimage = pimage;
		this.category = category;
		this.amount = amount;
	}
	
	public Product(int pid, String pname, int price, String pcolor, int amount) {
		this.pid = pid;
		this.pname = pname;
		this.price = price;
		this.pcolor = pcolor;
		this.amount = amount;
	}
	
	public Product(int pid, String category, String pimage) {
		super();
		this.pid = pid;
		this.category = category;
		this.pimage = pimage;
	}
	
	public Product(String pname, int price, String pcolor, Date pdate, String pimage, String category, int amount,
			String psize, int pview) {
		super();
		this.pname = pname;
		this.price = price;
		this.pcolor = pcolor;
		this.pdate = pdate;
		this.pimage = pimage;
		this.category = category;
		this.amount = amount;
		this.psize = psize;
		this.pview = pview;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPcolor() {
		return pcolor;
	}

	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getPsize() {
		return psize;
	}

	public void setPsize(String psize) {
		this.psize = psize;
	}

	public int getPview() {
		return pview;
	}

	public void setPview(int pview) {
		this.pview = pview;
	}
	
}
