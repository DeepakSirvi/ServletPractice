package com.dollop.adda.bean;

public class Student {
	private Integer sid;
	private String sname;
	private String semail;
	private String smobile;
	private String saddress;
	public Student(String sname, String semail, String smobile, String saddress) {
		super();
		this.sname = sname;
		this.semail = semail;
		this.smobile = smobile;
		this.saddress = saddress;
	}
	
	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSemail() {
		return semail;
	}
	public void setSemail(String semail) {
		this.semail = semail;
	}
	public String getSmobile() {
		return smobile;
	}
	public void setSmobile(String smobile) {
		this.smobile = smobile;
	}
	public String getSaddress() {
		return saddress;
	}
	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}
	@Override
	public String toString() {
		return "Student [sname=" + sname + ", semail=" + semail + ", smobile=" + smobile + ", saddress=" + saddress
				+ "]";
	}
	
}
