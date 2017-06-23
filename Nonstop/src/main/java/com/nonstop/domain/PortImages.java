package com.nonstop.domain;

public class PortImages {
	
	private int imgPortNo;
	private int imgNo;
	private String imgName;
	private int imgOrder;
	
	public PortImages() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getImgPortNo() {
		return imgPortNo;
	}

	public void setImgPortNo(int imgPortNo) {
		this.imgPortNo = imgPortNo;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public int getImgOrder() {
		return imgOrder;
	}

	public void setImgOrder(int imgOrder) {
		this.imgOrder = imgOrder;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PortImages [imgPortNo=");
		builder.append(imgPortNo);
		builder.append(", imgNo=");
		builder.append(imgNo);
		builder.append(", imgName=");
		builder.append(imgName);
		builder.append(", imgOrder=");
		builder.append(imgOrder);
		builder.append("]");
		return builder.toString();
	}
}
