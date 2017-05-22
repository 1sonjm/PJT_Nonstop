package com.nonstop.domain;

import java.sql.Date;


public class ProjScrap {
	
	private int projScrNo;
	private int scrProjNo;
	private String scrUserId;
	
	
	public int getProjScrNo() {
		return projScrNo;
	}
	public void setProjScrNo(int projScrNo) {
		this.projScrNo = projScrNo;
	}
	public int getScrProjNo() {
		return scrProjNo;
	}
	public void setScrProjNo(int scrProjNo) {
		this.scrProjNo = scrProjNo;
	}
	public String getScrUserId() {
		return scrUserId;
	}
	public void setScrUserId(String scrUserId) {
		this.scrUserId = scrUserId;
	}
	@Override
	public String toString() {
		return "ProjScrap [projScrNo=" + projScrNo + ", scrProjNo=" + scrProjNo + ", scrUserId=" + scrUserId
				+ "]";
	}
	
	
	
	
}