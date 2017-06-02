package com.nonstop.domain;

import java.sql.Date;

public class PortComment {
	
	private int comNo;
	private int comPortNo;
	private String comUserId;
	private String comUserImg;
	private Date comRegDate;
	private String comContent;
	
	public PortComment() {
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getComPortNo() {
		return comPortNo;
	}

	public void setComPortNo(int comPortNo) {
		this.comPortNo = comPortNo;
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
		StringBuilder builder = new StringBuilder();
		builder.append("PortComment [comNo=");
		builder.append(comNo);
		builder.append(", comPortNo=");
		builder.append(comPortNo);
		builder.append(", comUserId=");
		builder.append(comUserId);
		builder.append(", comUserImg=");
		builder.append(comUserImg);
		builder.append(", comRegDate=");
		builder.append(comRegDate);
		builder.append(", comContent=");
		builder.append(comContent);
		builder.append("]");
		return builder.toString();
	}

}
