package com.User;

import java.util.Date;

public class Orderbean {

	private int ordersId;
	private int userId;
	private Date datetime;
	private String payMode;
	private char   isPayed;
	private float totalPrice;
	public int getOrdersId() {
		return ordersId;
	}
	public void setOrdersId(int ordersId) {
		this.ordersId = ordersId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	public String getPayMode() {
		return payMode;
	}
	public void setPayMode(String payMode) {
		this.payMode = payMode;
	}
	public char getIsPayed() {
		return isPayed;
	}
	public void setIsPayed(char isPayed) {
		this.isPayed = isPayed;
	}
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
}
