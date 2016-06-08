package com.User;
//订单表bean
import java.util.Date;

public class OrderInfo {

	private String ordersId;
	private int userId;
	private String datetime;
	private String payMode;
	private String  isPayed;
	private float totalPrice;
	private int id;
	private String username;
	private String password;
	private String truename;
	private String email;
	private String phone;
	private String address;
	private String garde;
	private String trxId;
	private String payDateTime;
	public String getOrdersId() {
		return ordersId;
	}
	public void setOrdersId(String ordersId) {
		this.ordersId = ordersId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public String getPayMode() {
		return payMode;
	}
	public void setPayMode(String payMode) {
		this.payMode = payMode;
	}
	
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTruename() {
		return truename;
	}
	public void setTruename(String truename) {
		this.truename = truename;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGarde() {
		return garde;
	}
	public void setGarde(String garde) {
		this.garde = garde;
	}
	public String getIsPayed(){
		return isPayed;
	}
	public void setIsPayed(String isPayed) {
		this.isPayed = isPayed;
	}
	public String getTrxId() {
		return trxId;
	}
	public void setTrxId(String trxId) {
		this.trxId = trxId;
	}
	public String getPayDateTime() {
		return payDateTime;
	}
	public void setPayDateTime(String payDateTime) {
		this.payDateTime = payDateTime;
	}
}
