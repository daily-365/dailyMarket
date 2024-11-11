package com.dailyMarket.www.vo;

import java.util.Date;

public class UserAccountVO {
	private int idx;
	private int userNo;

	private String userId;
	private String userName;
	private String accountNum;
	private String tradeBank;
	private int saveMoney;
	private String moneyType;
	private Date modDate;
	private int targetUserNo;
	private String userType;
	
	//상대 계좌 정보
	private int salesUserNo;
	private int salesTargetUserNo;
	private String targetUserId;
	private String targetUserName;
	private String targetAccountNum;
	private String targetTradeBank;
	private int targetSaveMoney;
	private String targetUserType;
	
	
	//구매 가격
	private int price;


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


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getAccountNum() {
		return accountNum;
	}


	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}


	public String getTradeBank() {
		return tradeBank;
	}


	public void setTradeBank(String tradeBank) {
		this.tradeBank = tradeBank;
	}


	public int getSaveMoney() {
		return saveMoney;
	}


	public void setSaveMoney(int saveMoney) {
		this.saveMoney = saveMoney;
	}


	public String getMoneyType() {
		return moneyType;
	}


	public void setMoneyType(String moneyType) {
		this.moneyType = moneyType;
	}


	public Date getModDate() {
		return modDate;
	}


	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}


	public int getTargetUserNo() {
		return targetUserNo;
	}


	public void setTargetUserNo(int targetUserNo) {
		this.targetUserNo = targetUserNo;
	}


	public String getUserType() {
		return userType;
	}


	public void setUserType(String userType) {
		this.userType = userType;
	}


	public int getSalesUserNo() {
		return salesUserNo;
	}


	public void setSalesUserNo(int salesUserNo) {
		this.salesUserNo = salesUserNo;
	}


	public int getSalesTargetUserNo() {
		return salesTargetUserNo;
	}


	public void setSalesTargetUserNo(int salesTargetUserNo) {
		this.salesTargetUserNo = salesTargetUserNo;
	}


	public String getTargetUserId() {
		return targetUserId;
	}


	public void setTargetUserId(String targetUserId) {
		this.targetUserId = targetUserId;
	}


	public String getTargetUserName() {
		return targetUserName;
	}


	public void setTargetUserName(String targetUserName) {
		this.targetUserName = targetUserName;
	}


	public String getTargetAccountNum() {
		return targetAccountNum;
	}


	public void setTargetAccountNum(String targetAccountNum) {
		this.targetAccountNum = targetAccountNum;
	}


	public String getTargetTradeBank() {
		return targetTradeBank;
	}


	public void setTargetTradeBank(String targetTradeBank) {
		this.targetTradeBank = targetTradeBank;
	}


	public int getTargetSaveMoney() {
		return targetSaveMoney;
	}


	public void setTargetSaveMoney(int targetSaveMoney) {
		this.targetSaveMoney = targetSaveMoney;
	}


	public String getTargetUserType() {
		return targetUserType;
	}


	public void setTargetUserType(String targetUserType) {
		this.targetUserType = targetUserType;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
