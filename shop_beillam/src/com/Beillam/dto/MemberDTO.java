package com.Beillam.dto;

import java.util.Date;

public class MemberDTO {
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", zipcode=" + zipcode
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", email=" + email + ", regedate=" + regedate + "]";
	}

	private String id;
	private String pw;
	private String name;
	private String phone;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String email;
	private Date regedate;
	
	public MemberDTO() {
		
	}

	public MemberDTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public MemberDTO(String id, String pw, String name, String phone, String zipcode, String addr1, String addr2,
			String email, Date regedate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.email = email;
		this.regedate = regedate;
	}

	public MemberDTO(String id, String pw, String name, String phone, String zipcode, String addr1, String addr2,
			String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegedate() {
		return regedate;
	}

	public void setRegedate(Date regedate) {
		this.regedate = regedate;
	}

	
	
	
}
