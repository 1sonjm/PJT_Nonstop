package com.nonstop.domain;

import java.sql.Date;


public class RecordApplicant {
	
	private int recNo;
	private int recProjNo;
	private String recUserId;
	private int recStatus;
	private String recUserImg;
	
	
	public int getRecNo() {
		return recNo;
	}
	public void setRecNo(int recNo) {
		this.recNo = recNo;
	}
	public int getRecProjNo() {
		return recProjNo;
	}
	public void setRecProjNo(int recProjNo) {
		this.recProjNo = recProjNo;
	}
	public String getRecUserId() {
		return recUserId;
	}
	public void setRecUserId(String recUserId) {
		this.recUserId = recUserId;
	}
	public int getRecStatus() {
		return recStatus;
	}
	public void setRecStatus(int recStatus) {
		this.recStatus = recStatus;
	}
	
	public String getRecUserImg() {
		return recUserImg;
	}
	public void setRecUserImg(String recUserImg) {
		this.recUserImg = recUserImg;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RecordApplicant [recNo=");
		builder.append(recNo);
		builder.append(", recProjNo=");
		builder.append(recProjNo);
		builder.append(", recUserId=");
		builder.append(recUserId);
		builder.append(", recStatus=");
		builder.append(recStatus);
		builder.append(", recUserImg=");
		builder.append(recUserImg);
		builder.append("]");
		return builder.toString();
	}

}