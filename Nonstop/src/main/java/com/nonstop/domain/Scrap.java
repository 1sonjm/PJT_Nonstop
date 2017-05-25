package com.nonstop.domain;

public class Scrap {
	
	private int scrapNo;
	private String scrapUserId;
	private int projNo;
	private int portNo;
	private int scrapDiv; //게시물 분류 번호
	
	
	public int getScrapNo() {
		return scrapNo;
	}
	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
	}
	public String getScrapUserId() {
		return scrapUserId;
	}
	public void setScrapUserId(String scrapUserId) {
		this.scrapUserId = scrapUserId;
	}
	public int getProjNo() {
		return projNo;
	}
	public void setProjNo(int projNo) {
		this.projNo = projNo;
	}
	public int getPortNo() {
		return portNo;
	}
	public void setPortNo(int portNo) {
		this.portNo = portNo;
	}
	public int getScrapDiv() {
		return scrapDiv;
	}
	public void setScrapDiv(int scrapDiv) {
		this.scrapDiv = scrapDiv;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Scrap [scrapNo=");
		builder.append(scrapNo);
		builder.append(", scrapUserId=");
		builder.append(scrapUserId);
		builder.append(", projNo=");
		builder.append(projNo);
		builder.append(", portNo=");
		builder.append(portNo);
		builder.append(", scrapDiv=");
		builder.append(scrapDiv);
		builder.append("]");
		return builder.toString();
	}
	

}
