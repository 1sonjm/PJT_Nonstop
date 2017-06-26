package com.nonstop.myapplication.domain;

import java.sql.Date;

public class RecordProject {
	
	private String comName;
	private String proTitle;
	private Date proStartDate;
	private Date proendDate;
	private int projNo;
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getProTitle() {
		return proTitle;
	}
	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}
	public Date getProStartDate() {
		return proStartDate;
	}
	public void setProStartDate(Date proStartDate) {
		this.proStartDate = proStartDate;
	}
	public Date getProendDate() {
		return proendDate;
	}
	public void setProendDate(Date proendDate) {
		this.proendDate = proendDate;
	}
	public int getProjNo() {
		return projNo;
	}
	public void setProjNo(int projNo) {
		this.projNo = projNo;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RecordProject [comName=");
		builder.append(comName);
		builder.append(", proTitle=");
		builder.append(proTitle);
		builder.append(", proStartDate=");
		builder.append(proStartDate);
		builder.append(", proendDate=");
		builder.append(proendDate);
		builder.append(", projNo=");
		builder.append(projNo);
		builder.append("]");
		return builder.toString();
	}
	
}
