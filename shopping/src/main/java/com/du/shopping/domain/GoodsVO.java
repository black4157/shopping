package com.du.shopping.domain;

import java.util.Date;

public class GoodsVO {
	private int gdsNum;
	private String gdsName;
	private String cateCode;
	private int gdsPrice;
	private int gdsStock;
	private String dgsDes;
	private String dgsImg;
	private Date gdsDate;
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public String getGdsName() {
		return gdsName;
	}
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public int getGdsPrice() {
		return gdsPrice;
	}
	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	public int getGdsStock() {
		return gdsStock;
	}
	public void setGdsStock(int gdsStock) {
		this.gdsStock = gdsStock;
	}
	public String getDgsDes() {
		return dgsDes;
	}
	public void setDgsDes(String dgsDes) {
		this.dgsDes = dgsDes;
	}
	public String getDgsImg() {
		return dgsImg;
	}
	public void setDgsImg(String dgsImg) {
		this.dgsImg = dgsImg;
	}
	public Date getGdsDate() {
		return gdsDate;
	}
	public void setGdsDate(Date gdsDate) {
		this.gdsDate = gdsDate;
	}
	@Override
	public String toString() {
		return "GoodsVO [gdsNum=" + gdsNum + ", gdsName=" + gdsName + ", cateCode=" + cateCode + ", gdsPrice="
				+ gdsPrice + ", gdsStock=" + gdsStock + ", dgsDes=" + dgsDes + ", dgsImg=" + dgsImg + ", gdsDate="
				+ gdsDate + "]";
	}
	
}
