package com.nonstop.myapplication.domain;


public class Tech {
	
	private int techNo;
	private int techName;
	private int techClass;
	
	
	public int getTechNo() {
		return techNo;
	}
	public void setTechNo(int techNo) {
		this.techNo = techNo;
	}
	public int getTechName() {
		return techName;
	}
	public void setTechName(int techName) {
		this.techName = techName;
	}
	public int getTechClass() {
		return techClass;
	}
	public void setTechClass(int techClass) {
		this.techClass = techClass;
	}
	
	@Override
	public String toString() {
		return "Tech [techNo=" + techNo + ", techName=" + techName + ", techClass=" + techClass + "]";
	}
	

}