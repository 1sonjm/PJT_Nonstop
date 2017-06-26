package com.nonstop.myapplication.domain;

public class Follow {
	
	private int followNo;
	private String reqUserId; //요청자 아이디
	private String targetUserId; //대상자 아이디
	public int getFollowNo() {
		return followNo;
	}
	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}
	public String getReqUserId() {
		return reqUserId;
	}
	public void setReqUserId(String reqUserId) {
		this.reqUserId = reqUserId;
	}
	public String getTargetUserId() {
		return targetUserId;
	}
	public void setTargetUserId(String targetUserId) {
		this.targetUserId = targetUserId;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Follow [followNo=");
		builder.append(followNo);
		builder.append(", reqUserId=");
		builder.append(reqUserId);
		builder.append(", targetUserId=");
		builder.append(targetUserId);
		builder.append("]");
		return builder.toString();
	}
	
	

}
