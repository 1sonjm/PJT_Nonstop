package com.nonstop.myapplication.domain;

import java.sql.Date;

public class Letter {
	
	private int letNo;
	private String sendId;
	private String receiveId;
	private String letTitle;
	private String letDetail;
	private Date letRegdate;
	private Date letReaddate;
	private int letSave;
	private int letRecView;
	private int letSendView;
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
	public String getLetTitle() {
		return letTitle;
	}
	public void setLetTitle(String letTitle) {
		this.letTitle = letTitle;
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
	public int getLetSave() {
		return letSave;
	}
	public void setLetSave(int letSave) {
		this.letSave = letSave;
	}
	public int getLetRecView() {
		return letRecView;
	}
	public void setLetRecView(int letRecView) {
		this.letRecView = letRecView;
	}
	public int getLetSendView() {
		return letSendView;
	}
	public void setLetSendView(int letSendView) {
		this.letSendView = letSendView;
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
		builder.append(", letTitle=");
		builder.append(letTitle);
		builder.append(", letDetail=");
		builder.append(letDetail);
		builder.append(", letRegdate=");
		builder.append(letRegdate);
		builder.append(", letReaddate=");
		builder.append(letReaddate);
		builder.append(", letSave=");
		builder.append(letSave);
		builder.append(", letRecView=");
		builder.append(letRecView);
		builder.append(", letSendView=");
		builder.append(letSendView);
		builder.append("]");
		return builder.toString();
	}
	
}
