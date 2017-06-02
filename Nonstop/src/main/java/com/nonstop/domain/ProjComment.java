package com.nonstop.domain;

import java.sql.Date;


public class ProjComment {
	
	private int comNo;
	private int comProjNo;
	private String comUserId;
	private String comUserImg;
	private Date comRegDate;
	private String comContent;
	
	
	public int getComNo() {
		return comNo;
	}
	public void setComNo(int comNo) {
		this.comNo = comNo;
	}
	public int getComProjNo() {
		return comProjNo;
	}
	public void setComProjNo(int comProjNo) {
		this.comProjNo = comProjNo;
	}
	public String getComUserId() {
		return comUserId;
	}
	public void setComUserId(String comUserId) {
		this.comUserId = comUserId;
	}
	public String getComUserImg() {
		return comUserImg;
	}
	public void setComUserImg(String comUserImg) {
		this.comUserImg = comUserImg;
	}
	public Date getComRegDate() {
		return comRegDate;
	}
	public void setComRegDate(Date comRegDate) {
		this.comRegDate = comRegDate;
	}
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	
	@Override
	public String toString() {
		return "ProjComment [comNo=" + comNo + ", comProjNo=" + comProjNo + ", comUserId=" + comUserId + ", comUserImg="
				+ comUserImg + ", comRegDate=" + comRegDate + ", comContent=" + comContent + "]";
	}
	
	
	
	
	
	
	
}