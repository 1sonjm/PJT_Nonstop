package com.nonstop.domain;


public class TechUse {
	
	private int tuNo;
	private int tuPortNo;
	private int tuProjNo;
	private int tuTechNo;
	
	
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
	@Override
	public String toString() {
		return "TechUse [tuNo=" + tuNo + ", tuPortNo=" + tuPortNo + ", tuProjNo=" + tuProjNo + ", tuTechNo=" + tuTechNo
				+ "]";
	}
	
	
	
	

}