package my.model;

import java.util.Date;

public class User {
	private String userId;
	private String password;
	private String name;
	private String phone1;
	private String phone2;
	private String phone3;
	private String email;
	private String address;
	private Date registerTime;
	private int point;
	
	public User() {}

	public User(String userId, String password, String name, String phone1, String phone2, String phone3, String email,
			String address, Date registerTime, int point) {
		super();
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.email = email;
		this.address = address;
		this.registerTime = registerTime;
		this.point = point;
	}

	public User(String userId, String name, String phone1, String phone2, String phone3, String email,
			String address, int point) {
		super();
		this.userId = userId;
		this.name = name;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.email = email;
		this.address = address;
		this.point = point;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
	
	

}
