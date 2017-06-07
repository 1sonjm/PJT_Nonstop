package com.nonstop.domain;

import java.sql.Date;

public class Portfolio{
	
	private int portNo;
	private String portUserId;
	private String portUserImg;
	private int portDivision;
	private String portTitle;
	private Date portRegdate;
	private Date portUpdate;
	private String portMonth;
	private String portYear;
	private String portDay;
	private String portDetail;
	private String portFile;
	private int scrapNo;
	private int portLikeNo;
	private int totalPortView;
	private int totalPortLike;
	private int totalPortComment;
	private boolean portViewFlag;
	private boolean portLikeFlag;
	private boolean portFollowFlag;
	private boolean portScrFlag;
	private String scrapUserId;
	
	
	
	public Portfolio() {
	}
	public int getPortNo() {
		return portNo;
	}
	public void setPortNo(int portNo) {
		this.portNo = portNo;
	}
	public String getPortUserId() {
		return portUserId;
	}
	public void setPortUserId(String portUserId) {
		this.portUserId = portUserId;
	}
	public String getPortUserImg() {
		return portUserImg;
	}
	public void setPortUserImg(String portUserImg) {
		this.portUserImg = portUserImg;
	}
	public int getPortDivision() {
		return portDivision;
	}
	public void setPortDivision(int portDivision) {
		this.portDivision = portDivision;
	}
	public String getPortTitle() {
		return portTitle;
	}
	public void setPortTitle(String portTitle) {
		this.portTitle = portTitle;
	}
	public Date getPortRegdate() {
		return portRegdate;
	}
	public void setPortRegdate(Date portRegdate) {
		this.portRegdate = portRegdate;
	}
	public Date getPortUpdate() {
		return portUpdate;
	}
	public void setPortUpdate(Date portUpdate) {
		this.portUpdate = portUpdate;
	}
	public String getPortMonth() {
		return portMonth;
	}
	public void setPortMonth(String portMonth) {
		this.portMonth = portMonth;
	}
	public String getPortYear() {
		return portYear;
	}
	public void setPortYear(String portYear) {
		this.portYear = portYear;
	}
	public String getPortDay() {
		return portDay;
	}
	public void setPortDay(String portDay) {
		this.portDay = portDay;
	}
	public String getPortDetail() {
		return portDetail;
	}
	public void setPortDetail(String portDetail) {
		this.portDetail = portDetail;
	}
	public String getPortFile() {
		return portFile;
	}
	public void setPortFile(String portFile) {
		this.portFile = portFile;
	}
	
	public int getPortLikeNo() {
		return portLikeNo;
	}
	public void setPortLikeNo(int portLikeNo) {
		this.portLikeNo = portLikeNo;
	}
	public int getTotalPortView() {
		return totalPortView;
	}
	public void setTotalPortView(int totalPortView) {
		this.totalPortView = totalPortView;
	}
	
	public int getTotalPortLike() {
		return totalPortLike;
	}
	public void setTotalPortLike(int totalPortLike) {
		this.totalPortLike = totalPortLike;
	}
	public int getTotalPortComment() {
		return totalPortComment;
	}
	public void setTotalPortComment(int totalPortComment) {
		this.totalPortComment = totalPortComment;
	}
	public boolean isPortViewFlag() {
		return portViewFlag;
	}
	public void setPortViewFlag(boolean portViewFlag) {
		this.portViewFlag = portViewFlag;
	}
	public boolean isPortLikeFlag() {
		return portLikeFlag;
	}
	public void setPortLikeFlag(boolean portLikeFlag) {
		this.portLikeFlag = portLikeFlag;
	}
	public boolean isPortFollowFlag() {
		return portFollowFlag;
	}
	public void setPortFollowFlag(boolean portFollowFlag) {
		this.portFollowFlag = portFollowFlag;
	}
	public boolean isPortScrFlag() {
		return portScrFlag;
	}
	public void setPortScrFlag(boolean portScrFlag) {
		this.portScrFlag = portScrFlag;
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
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Portfolio [portNo=");
		builder.append(portNo);
		builder.append(", portUserId=");
		builder.append(portUserId);
		builder.append(", portUserImg=");
		builder.append(portUserImg);
		builder.append(", portDivision=");
		builder.append(portDivision);
		builder.append(", portTitle=");
		builder.append(portTitle);
		builder.append(", portRegdate=");
		builder.append(portRegdate);
		builder.append(", portUpdate=");
		builder.append(portUpdate);
		builder.append(", portMonth=");
		builder.append(portMonth);
		builder.append(", portYear=");
		builder.append(portYear);
		builder.append(", portDay=");
		builder.append(portDay);
		builder.append(", portDetail=");
		builder.append(portDetail);
		builder.append(", portFile=");
		builder.append(portFile);
		builder.append(", scrapNo=");
		builder.append(scrapNo);
		builder.append(", portLikeNo=");
		builder.append(portLikeNo);
		builder.append(", totalPortView=");
		builder.append(totalPortView);
		builder.append(", totalPortLike=");
		builder.append(totalPortLike);
		builder.append(", totalPortComment=");
		builder.append(totalPortComment);
		builder.append(", portViewFlag=");
		builder.append(portViewFlag);
		builder.append(", portLikeFlag=");
		builder.append(portLikeFlag);
		builder.append(", portFollowFlag=");
		builder.append(portFollowFlag);
		builder.append(", portScrFlag=");
		builder.append(portScrFlag);
		builder.append(", scrapUserId=");
		builder.append(scrapUserId);
		builder.append("]");
		return builder.toString();
	}
}


	