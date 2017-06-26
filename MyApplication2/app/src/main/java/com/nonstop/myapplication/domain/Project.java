package com.nonstop.myapplication.domain;

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
	private int projExpectDate;
	private int projDday;
	private int sortFlag;
	
	//scrap
	private String scrapUserId;
	private int scrapNo;
	
	//follow
	private boolean projFollowFlag;
	
	//Applicant
	private int recCount;
	

	
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
	public int getProjExpectDate() {
		return projExpectDate;
	}
	public void setProjExpectDate(int projExpectDate) {
		this.projExpectDate = projExpectDate;
	}
	public int getProjDday() {
		return projDday;
	}
	public void setProjDday(int projDday) {
		this.projDday = projDday;
	}
	public String getScrapUserId() {
		return scrapUserId;
	}
	public void setScrapUserId(String scrapUserId) {
		this.scrapUserId = scrapUserId;
	}
	public int getScrapNo() {
		return scrapNo;
	}
	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
	}
	public int getSortFlag() {
		return sortFlag;
	}
	public void setSortFlag(int sortFlag) {
		this.sortFlag = sortFlag;
	}

	
	// 팔로우
	public boolean isProjFollowFlag() {
		return projFollowFlag;
	}
	public void setProjFollowFlag(boolean projFollowFlag) {
		this.projFollowFlag = projFollowFlag;
	}
	//applicant
	public int getRecCount() {
		return recCount;
	}
	public void setRecCount(int recCount) {
		this.recCount = recCount;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Project [projNo=");
		builder.append(projNo);
		builder.append(", projUserId=");
		builder.append(projUserId);
		builder.append(", projDivision=");
		builder.append(projDivision);
		builder.append(", projTitle=");
		builder.append(projTitle);
		builder.append(", projAnnoStart=");
		builder.append(projAnnoStart);
		builder.append(", projAnnoEnd=");
		builder.append(projAnnoEnd);
		builder.append(", projStartDate=");
		builder.append(projStartDate);
		builder.append(", projEndDate=");
		builder.append(projEndDate);
		builder.append(", projLocation=");
		builder.append(projLocation);
		builder.append(", projViewcount=");
		builder.append(projViewcount);
		builder.append(", projExpectDate=");
		builder.append(projExpectDate);
		builder.append(", projDday=");
		builder.append(projDday);
		builder.append(", scrapUserId=");
		builder.append(scrapUserId);
		builder.append(", scrapNo=");
		builder.append(scrapNo);
		builder.append(", sortFlag=");
		builder.append(sortFlag);
		builder.append(", recCount=");
		builder.append(recCount);
		builder.append("]");
		return builder.toString();
	}
	
	
}