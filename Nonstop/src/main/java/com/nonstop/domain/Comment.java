package com.nonstop.domain;

import java.sql.Date;


//==>ȸ�������� �𵨸�(�߻�ȭ/ĸ��ȭ)�� Bean
public class Comment {
	
	///Field
	private String comUserId;
	private Date comRegdate;
	private String comContent;
	private int comNo;
	private int comProjNo;
	
	public Comment(){
	}
	
	public String getComUserId() {
		return comUserId;
	}
	public void setComUserId(String comUserId) {
		this.comUserId = comUserId;
	}
	public Date getComRegdate() {
		return comRegdate;
	}
	public void setComRegdate(Date comRegdate) {
		this.comRegdate = comRegdate;
	}
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
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
	@Override
	public String toString() {
		return "Comment [comUserId=" + comUserId + ", comRegdate=" + comRegdate + ", comContent=" + comContent + ", comNo="
				+ comNo + ", comProjNo=" + comProjNo + "]";
	}
	
	
}