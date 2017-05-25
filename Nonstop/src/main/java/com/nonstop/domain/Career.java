package com.nonstop.domain;

public class Career {
	
	private int careerNo;
	private String careerUserId;
	private String techNo;
	private int techDiv;
	private String techName;
	private int careerUseTerm;
	
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
	public String getTechNo() {
		return techNo;
	}
	public void setTechNo(String techNo) {
		this.techNo = techNo;
	}
	public int getTechDiv() {
		return techDiv;
	}
	public void setTechDiv(int techDiv) {
		this.techDiv = techDiv;
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
		builder.append(techDiv);
		builder.append(", techName=");
		builder.append(techName);
		builder.append(", careerUseTerm=");
		builder.append(careerUseTerm);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
