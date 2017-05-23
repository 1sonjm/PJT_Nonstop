package com.nonstop.domain;

import java.sql.Date;


public class RecordApplicant {
	
	private int recNo;
	private int recProjNo;
	private String recUserId;
	private int recStatus;
	
	
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
	
	@Override
	public String toString() {
		return "RecordApplicant [recNo=" + recNo + ", recProjNo=" + recProjNo + ", recUserId=" + recUserId
				+ ", recStatus=" + recStatus + "]";
	}
	
	
	
}