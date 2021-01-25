package com.du.shopping.domain;

public class GoodsInfoVO {
	private String gdsName;
	private String damage;
	private String magazine;
	private String ammunition;
	private String bullet_speed;
	private String stopping_power;
	private String effective_range;
	private String cs_interval;
	private String continuous_mode;
	private String attachment;
	private String acquisition;
	public String getGdsName() {
		return gdsName;
	}
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	public String getDamage() {
		return damage;
	}
	public void setDamage(String damage) {
		this.damage = damage;
	}
	public String getMagazine() {
		return magazine;
	}
	public void setMagaine(String magazine) {
		this.magazine = magazine;
	}
	public String getAmmunition() {
		return ammunition;
	}
	public void setAmmunition(String ammunition) {
		this.ammunition = ammunition;
	}
	public String getBullet_speed() {
		return bullet_speed;
	}
	public void setBullet_speed(String bullet_speed) {
		this.bullet_speed = bullet_speed;
	}
	public String getStopping_power() {
		return stopping_power;
	}
	public void setStopping_power(String stopping_power) {
		this.stopping_power = stopping_power;
	}
	public String getEffective_range() {
		return effective_range;
	}
	public void setEffective_range(String effective_range) {
		this.effective_range = effective_range;
	}
	public String getCs_interval() {
		return cs_interval;
	}
	public void setCs_interval(String cs_interval) {
		this.cs_interval = cs_interval;
	}
	public String getContinuous_mode() {
		return continuous_mode;
	}
	public void setContinuous_mode(String continuous_mode) {
		this.continuous_mode = continuous_mode;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public String getacquisition() {
		return acquisition;
	}
	public void setacquisition(String acquisition) {
		this.acquisition = acquisition;
	}
	
	@Override
	public String toString() {
		return "GoodsInfo [gdsName=" + gdsName + ", damage=" + damage + ", magazine=" + magazine + ", ammunition="
				+ ammunition + ", bullet_speed=" + bullet_speed + ", stopping_power=" + stopping_power
				+ ", effective_range=" + effective_range + ", cs_interval=" + cs_interval + ", continuous_mode="
				+ continuous_mode + ", attachment=" + attachment + ", acquisition=" + acquisition + "]";
	}
}
