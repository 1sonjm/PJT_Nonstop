package com.nonstop.domain;

public class Career {
	
	private int careerNo;
	private String careerName;
	private String careerGrade;
	private String careerUseTerm;
	private String careerUserId;
	public int getCareerNo() {
		return careerNo;
	}
	public void setCareerNo(int careerNo) {
		this.careerNo = careerNo;
	}
	public String getCareerName() {
		return careerName;
	}
	public void setCareerName(String careerName) {
		this.careerName = careerName;
	}
	public String getCareerGrade() {
		return careerGrade;
	}
	public void setCareerGrade(String careerGrade) {
		this.careerGrade = careerGrade;
	}
	public String getCareerUseTerm() {
		return careerUseTerm;
	}
	public void setCareerUseTerm(String careerUseTerm) {
		this.careerUseTerm = careerUseTerm;
	}
	public String getCareerUserId() {
		return careerUserId;
	}
	public void setCareerUserId(String careerUserId) {
		this.careerUserId = careerUserId;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Career [careerNo=");
		builder.append(careerNo);
		builder.append(", careerName=");
		builder.append(careerName);
		builder.append(", careerGrade=");
		builder.append(careerGrade);
		builder.append(", careerUseTerm=");
		builder.append(careerUseTerm);
		builder.append(", careerUserId=");
		builder.append(careerUserId);
		builder.append("]");
		return builder.toString();
	}

}
