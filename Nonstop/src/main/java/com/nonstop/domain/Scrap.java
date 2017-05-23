package com.nonstop.domain;

public class Scrap {
	
	private int scrapNo;
	private String scrapUserId;
	private int postNo; //게시물 번호
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
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
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
		builder.append(", postNo=");
		builder.append(postNo);
		builder.append(", scrapDiv=");
		builder.append(scrapDiv);
		builder.append("]");
		return builder.toString();
	}
	

}
