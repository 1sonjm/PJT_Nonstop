package com.nonstop.domain;

public class Career {
	
	private int careerNo;
	private String careerUserId;
	private int techNo;
	private String techName;
	private int careerUseTerm;
	private int techClass;
	
	public int getCareerNo() {
		return careerNo;
	}
	public void setCareerNo(int careerNo) {
		this.careerNo = careerNo;
	}
	public String getCareerUserId() {
		return careerUserId;
	}
	public void setCareerUserId(String careerUserId) {
		this.careerUserId = careerUserId;
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
	public int getCareerUseTerm() {
		return careerUseTerm;
	}
	public void setCareerUseTerm(int careerUseTerm) {
		this.careerUseTerm = careerUseTerm;
	}
	
	public int getTechClass() {
		return techClass;
	}
	public void setTechClass(int techClass) {
		this.techClass = techClass;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Career [careerNo=");
		builder.append(careerNo);
		builder.append(", careerUserId=");
		builder.append(careerUserId);
		builder.append(", techNo=");
		builder.append(techNo);
		builder.append(", techDiv=");
		builder.append(", techName=");
		builder.append(techName);
		builder.append(", careerUseTerm=");
		builder.append(careerUseTerm);
		builder.append(", techClass=");
		builder.append(techClass);
		builder.append("]");
		return builder.toString();
	}
	
	
}
