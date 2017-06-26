package com.nonstop.myapplication.domain;

public class PortLike {
	
	private int portLikeNo;
	private int portNo;
	private String userId;
	
	public int getPortLikeNo() {
		return portLikeNo;
	}
	public void setPortLikeNo(int portLikeNo) {
		this.portLikeNo = portLikeNo;
	}
	public int getPortNo() {
		return portNo;
	}
	public void setPortNo(int portNo) {
		this.portNo = portNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PortLike [portLikeNo=");
		builder.append(portLikeNo);
		builder.append(", portNo=");
		builder.append(portNo);
		builder.append(", userId=");
		builder.append(userId);
		builder.append("]");
		return builder.toString();
	}
	
}
