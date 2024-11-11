package com.dailyMarket.www.vo;

import java.util.Date;

public class AdminSumAccountVO {
	
	private int idx;
	private String accountName;
	private String tradeBank;
	private String accountNum;
	private int saveMoney;
	private Date modDate;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
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
	
	

}
