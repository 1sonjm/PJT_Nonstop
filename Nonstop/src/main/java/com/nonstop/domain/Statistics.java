package com.nonstop.domain;

import java.util.Date;

public class Statistics {
	private int demand;
	private int supply;
	private Date regdate;
	private double userRate;
	private Date searchStartDate;
	private Date searchEndDate;
	private int techNo;
	private String techName;
	private int techClass;
	private String location;
	
	public int getDemand() {
		return demand;
	}
	public void setDemand(int demand) {
		this.demand = demand;
	}
	public int getSupply() {
		return supply;
	}
	public void setSupply(int supply) {
		this.supply = supply;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public double getUserRate() {
		return userRate;
	}
	public void setUserRate(double userRate) {
		this.userRate = userRate;
	}
	public Date getSearchStartDate() {
		return searchStartDate;
	}
	public void setSearchStartDate(Date searchStartDate) {
		this.searchStartDate = searchStartDate;
	}
	public Date getSearchEndDate() {
		return searchEndDate;
	}
	public void setSearchEndDate(Date searchEndDate) {
		this.searchEndDate = searchEndDate;
	}
	public int getTechNo() {
		return techNo;
	}
	public void setTechNo(int techNo) {
		this.techNo = techNo;
	}
	public String getTechName() {
		return techName;
	}
	public void setTechName(String techName) {
		this.techName = techName;
	}
	public int getTechClass() {
		return techClass;
	}
	public void setTechClass(int techClass) {
		this.techClass = techClass;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Statistics [demand=");
		builder.append(demand);
		builder.append(", supply=");
		builder.append(supply);
		builder.append(", regdate=");
		builder.append(regdate);
		builder.append(", userRate=");
		builder.append(userRate);
		builder.append(", searchStartDate=");
		builder.append(searchStartDate);
		builder.append(", searchEndDate=");
		builder.append(searchEndDate);
		builder.append(", techNo=");
		builder.append(techNo);
		builder.append(", techName=");
		builder.append(techName);
		builder.append(", techClass=");
		builder.append(techClass);
		builder.append(", location=");
		builder.append(location);
		builder.append("]");
		return builder.toString();
	}
	
}
