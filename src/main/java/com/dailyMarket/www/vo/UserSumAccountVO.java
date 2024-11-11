package com.dailyMarket.www.vo;

import java.util.Date;

public class UserSumAccountVO {
	
	private int idx;
	private int userNo;
	private String tradeBank;
	private String accountNum;
	private int saveMoney;
	private Date modDate;
	
	//조인문
	private String userName;
	
	//구매 가격
	private int price;
	
	//구매 계좌
	private String targetAccountNum;
	private int targetSaveMoney;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getTradeBank() {
		return tradeBank;
	}
	public void setTradeBank(String tradeBank) {
		this.tradeBank = tradeBank;
	}
	public String getAccountNum() {
		return accountNum;
	}
	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}
	public int getSaveMoney() {
		return saveMoney;
	}
	public void setSaveMoney(int saveMoney) {
		this.saveMoney = saveMoney;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTargetAccountNum() {
		return targetAccountNum;
	}
	public void setTargetAccountNum(String targetAccountNum) {
		this.targetAccountNum = targetAccountNum;
	}
	public int getTargetSaveMoney() {
		return targetSaveMoney;
	}
	public void setTargetSaveMoney(int targetSaveMoney) {
		this.targetSaveMoney = targetSaveMoney;
	}
	
	

}
