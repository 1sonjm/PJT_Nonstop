package com.nonstop.domain;


public class TechUse {
	
	private int tuNo;
	private int tuPortNo;
	private int tuProjNo;
	private int tuTechNo;
	private String tuTechName;
	private int tuTechClass;
	public int getTuNo() {
		return tuNo;
	}
	public void setTuNo(int tuNo) {
		this.tuNo = tuNo;
	}
	public int getTuPortNo() {
		return tuPortNo;
	}
	public void setTuPortNo(int tuPortNo) {
		this.tuPortNo = tuPortNo;
	}
	public int getTuProjNo() {
		return tuProjNo;
	}
	public void setTuProjNo(int tuProjNo) {
		this.tuProjNo = tuProjNo;
	}
	public int getTuTechNo() {
		return tuTechNo;
	}
	public void setTuTechNo(int tuTechNo) {
		this.tuTechNo = tuTechNo;
	}
	public String getTuTechName() {
		return tuTechName;
	}
	public void setTuTechName(String tuTechName) {
		this.tuTechName = tuTechName;
	}
	public int getTuTechClass() {
		return tuTechClass;
	}
	public void setTuTechClass(int tuTechClass) {
		this.tuTechClass = tuTechClass;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TechUse [tuNo=");
		builder.append(tuNo);
		builder.append(", tuPortNo=");
		builder.append(tuPortNo);
		builder.append(", tuProjNo=");
		builder.append(tuProjNo);
		builder.append(", tuTechNo=");
		builder.append(tuTechNo);
		builder.append(", tuTechName=");
		builder.append(tuTechName);
		builder.append(", tuTechClass=");
		builder.append(tuTechClass);
		builder.append("]");
		return builder.toString();
	}
}