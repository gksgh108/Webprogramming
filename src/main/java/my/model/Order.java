package my.model;

import java.util.Date;

public class Order {
	private int oid;
	private String mid;
	private int pid;
	private Date odate;
	private int amount;
	private String address;
	private int totalprice;
	
	public Order() {}
	
	@Override
	public String toString() {
		return "mid : "+mid+"  |  pid : "+pid+"  |  odate : "+odate+"  |  amount : "+amount+"  |  address : "+address+"  |  totalprice : "+totalprice;
	}

	public Order(String mid, int pid, Date odate, int amount, String address, int totalprice) {
		super();
		this.mid = mid;
		this.pid = pid;
		this.odate = odate;
		this.amount = amount;
		this.address = address;
		this.totalprice = totalprice;
	}
	
	public Order(int oid, String mid, int pid, int amount, String address, int totalprice) {
		super();
		this.oid = oid;
		this.mid = mid;
		this.pid = pid;
		this.amount = amount;
		this.address = address;
		this.totalprice = totalprice;
	}
	
	public Order(int oid, String mid, int pid, Date odate, int amount, String address, int totalprice) {
		super();
		this.oid = oid;
		this.mid = mid;
		this.pid = pid;
		this.odate = odate;
		this.amount = amount;
		this.address = address;
		this.totalprice = totalprice;
	}
	
	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getPid() {
		return pid;
	}
	
	public void setPid(int pid) {
		this.pid = pid;
	}

	public Date getOdate() {
		return odate;
	}

	public void setOdate(Date odate) {
		this.odate = odate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	
	
	
	
	
}
	
