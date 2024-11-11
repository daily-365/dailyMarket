package com.dailyMarket.www.vo;

import java.util.Date;

import org.springframework.web.bind.annotation.RequestParam;

public class UserTradeVO {
	
	private int idx;
	private int userNo;

	private String userId;
	private int productNo;
	private String title;
	private String content;
	private int price;
	private String location;
	private Date likeDate;
	private Date purChaseDate;
	private Date regDate;
	private Date modDate;
	private Date delDate;
	private String deleteYn;
	
	private String productStoredFileName;
	
	private int productUserNo;
	
	//상대 계좌 정보
	private  int targetUserNo;
	private String targetUserId;
	private String targetUserName;
	private String targetAccountNum;
	private String targetTradeBank;
	private int targetSaveMoney;
	
	private String tradeYn;
	
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
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getLikeDate() {
		return likeDate;
	}
	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}
	public Date getPurChaseDate() {
		return purChaseDate;
	}
	public void setPurChaseDate(Date purChaseDate) {
		this.purChaseDate = purChaseDate;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	public Date getDelDate() {
		return delDate;
	}
	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getProductStoredFileName() {
		return productStoredFileName;
	}
	public void setProductStoredFileName(String productStoredFileName) {
		this.productStoredFileName = productStoredFileName;
	}
	public int getProductUserNo() {
		return productUserNo;
	}
	public void setProductUserNo(int productUserNo) {
		this.productUserNo = productUserNo;
	}
	public int getTargetUserNo() {
		return targetUserNo;
	}
	public void setTargetUserNo(int targetUserNo) {
		this.targetUserNo = targetUserNo;
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
	public String getTradeYn() {
		return tradeYn;
	}
	public void setTradeYn(String tradeYn) {
		this.tradeYn = tradeYn;
	}
	
	

	
	
	
}
