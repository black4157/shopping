package com.du.shopping.domain;

import java.util.Date;

public class ReplyListVO {
	private int gdsNum;
	private String userId;
	private int repNum;
	private String repCon;
	private Date repDate;
	
	private String userName;

	public int getGdsNum() {
		return gdsNum;
	}

	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRepNum() {
		return repNum;
	}

	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}

	public String getRepCon() {
		return repCon;
	}

	public void setRepCon(String repCon) {
		this.repCon = repCon;
	}

	public Date getRepDate() {
		return repDate;
	}

	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "ReplyListVO [gdsNum=" + gdsNum + ", userId=" + userId + ", repNum=" + repNum + ", repCon=" + repCon
				+ ", repDate=" + repDate + ", userName=" + userName + "]";
	}
	
	
}
