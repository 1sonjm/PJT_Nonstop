package com.nonstop.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;


//==>ȸ�������� �𵨸�(�߻�ȭ/ĸ��ȭ)�� Bean
public class User {
	
	///Field
	private String userId;
	private String userName;
	private String password;
	private String role;
	private String tel;
	private String email;
	private String addr;
	private String companyName;
	private int empNum;
	private Date pubDate;
	private String image;
	private MultipartFile file;
	private MultipartFile file1;
	
	///Constructor
	public User(){
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getRole() {
		return role;
	}



	public void setRole(String role) {
		this.role = role;
	}



	public String getTel() {
		return tel;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getAddr() {
		return addr;
	}



	public void setAddr(String addr) {
		this.addr = addr;
	}



	public String getCompanyName() {
		return companyName;
	}



	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}



	public int getEmpNum() {
		return empNum;
	}



	public void setEmpNum(int empNum) {
		this.empNum = empNum;
	}



	public Date getPubDate() {
		return pubDate;
	}



	public void setPubDate(Date pubDate) {
		this.pubDate = pubDate;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", role=" + role
				+ ", tel=" + tel + ", email=" + email + ", addr=" + addr + ", companyName=" + companyName + ", empNum="
				+ empNum + ", pubDate=" + pubDate + ", image=" + image + "]";
	}



	public MultipartFile getFile() {
		return file;
	}



	public void setFile(MultipartFile file) {
		this.file = file;
	}
	

}