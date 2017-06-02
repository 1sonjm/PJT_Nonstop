package com.nonstop.domain;

import java.util.Date;

public class Letter {
	
	private int letNo;
	private String sendId;
	private String receiveId;
	private String letDetail;
	private Date letRegdate;
	private Date letReaddate;
	public int getLetNo() {
		return letNo;
	}
	public void setLetNo(int letNo) {
		this.letNo = letNo;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getLetDetail() {
		return letDetail;
	}
	public void setLetDetail(String letDetail) {
		this.letDetail = letDetail;
	}
	public Date getLetRegdate() {
		return letRegdate;
	}
	public void setLetRegdate(Date letRegdate) {
		this.letRegdate = letRegdate;
	}
	public Date getLetReaddate() {
		return letReaddate;
	}
	public void setLetReaddate(Date letReaddate) {
		this.letReaddate = letReaddate;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Letter [letNo=");
		builder.append(letNo);
		builder.append(", sendId=");
		builder.append(sendId);
		builder.append(", receiveId=");
		builder.append(receiveId);
		builder.append(", letDetail=");
		builder.append(letDetail);
		builder.append(", letRegdate=");
		builder.append(letRegdate);
		builder.append(", letReaddate=");
		builder.append(letReaddate);
		builder.append("]");
		return builder.toString();
	}
	
	

}
