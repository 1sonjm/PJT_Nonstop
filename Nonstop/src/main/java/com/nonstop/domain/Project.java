package com.nonstop.domain;

import java.sql.Date;


public class Project {
	
	private int projNo;
	private String projUserId;
	private int projDivision;
	private String projTitle;
	private Date projAnnoStart;
	private Date projAnnoEnd;
	private Date projStartDate;
	private Date projEndDate;
	private String projLocation;
	private String projDetail;
	private int projViewcount;
	
	
	
	public int getProjNo() {
		return projNo;
	}
	public void setProjNo(int projNo) {
		this.projNo = projNo;
	}
	public String getProjUserId() {
		return projUserId;
	}
	public void setProjUserId(String projUserId) {
		this.projUserId = projUserId;
	}
	public int getProjDivision() {
		return projDivision;
	}
	public void setProjDivision(int projDivision) {
		this.projDivision = projDivision;
	}
	public String getProjTitle() {
		return projTitle;
	}
	public void setProjTitle(String projTitle) {
		this.projTitle = projTitle;
	}
	public Date getProjAnnoStart() {
		return projAnnoStart;
	}
	public void setProjAnnoStart(Date projAnnoStart) {
		this.projAnnoStart = projAnnoStart;
	}
	public Date getProjAnnoEnd() {
		return projAnnoEnd;
	}
	public void setProjAnnoEnd(Date projAnnoEnd) {
		this.projAnnoEnd = projAnnoEnd;
	}
	public Date getProjStartDate() {
		return projStartDate;
	}
	public void setProjStartDate(Date projStartDate) {
		this.projStartDate = projStartDate;
	}
	public Date getProjEndDate() {
		return projEndDate;
	}
	public void setProjEndDate(Date projEndDate) {
		this.projEndDate = projEndDate;
	}
	public String getProjLocation() {
		return projLocation;
	}
	public void setProjLocation(String projLocation) {
		this.projLocation = projLocation;
	}
	public String getProjDetail() {
		return projDetail;
	}
	public void setProjDetail(String projDetail) {
		this.projDetail = projDetail;
	}
	public int getProjViewcount() {
		return projViewcount;
	}
	public void setProjViewcount(int projViewcount) {
		this.projViewcount = projViewcount;
	}
	@Override
	public String toString() {
		return "Project [projNo=" + projNo + ", projUserId=" + projUserId + ", projDivision=" + projDivision
				+ ", projTitle=" + projTitle + ", projAnnoStart=" + projAnnoStart + ", projAnnoEnd=" + projAnnoEnd
				+ ", projStartDate=" + projStartDate + ", projEndDate=" + projEndDate + ", projLocation=" + projLocation
				+ ", projDetail=" + projDetail + ", projViewcount=" + projViewcount + "]";
	}
	
	
	
}