package com.nonstop.domain;

import java.sql.Date;


public class ProjComment {
	
	private int comNo;
	private int comProjNo;
	private String comUserId;
	private Date comProjRegDate;
	private String comProjContent;
	
	
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
	public Date getComProjRegDate() {
		return comProjRegDate;
	}
	public void setComProjRegDate(Date comProjRegDate) {
		this.comProjRegDate = comProjRegDate;
	}
	public String getComProjContent() {
		return comProjContent;
	}
	public void setComProjContent(String comProjContent) {
		this.comProjContent = comProjContent;
	}
	@Override
	public String toString() {
		return "ProjComment [comNo=" + comNo + ", comProjNo=" + comProjNo + ", comUserId=" + comUserId
				+ ", comProjRegDate=" + comProjRegDate + ", comProjContent=" + comProjContent + "]";
	}
	
	
	
	
	
}