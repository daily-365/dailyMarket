package com.dailyMarket.www.vo;

import java.util.Date;

public class AdvertVO extends AdvertFileVO{

	private int advertNo;
	private int busiNo;
	private int userNo;
	private String content;
	private String location;
	private String age;
	private String gender;
	//광고 예산 
	//입금액
	private int prevPrice;	
	private String priceType;
	//잔액
	private int price;
	//광고 시작 
	private String startType;
	private int days;
	//종료일 없이 계속 광고하기
	private String endDateYn;
	//상세 일정 설정하기
	private String detailYn;
	private Date regDate;
	private Date modDate;
	private Date delDate;
	private String deleteYn;
	//승인 상태
	private String approveStatus;
	//광고비 지불 상태
	private String payStatus;
	
	//조인 문 위해 getter/setter 추가
	// 계좌
	private String userName;
	private int saveMoney;
	private String accountNum;
	private String tradeBank;
	private String moneyType;
	// 광고
	private String busiName;
	public int getAdvertNo() {
		return advertNo;
	}
	public void setAdvertNo(int advertNo) {
		this.advertNo = advertNo;
	}
	public int getBusiNo() {
		return busiNo;
	}
	public void setBusiNo(int busiNo) {
		this.busiNo = busiNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getPrevPrice() {
		return prevPrice;
	}
	public void setPrevPrice(int prevPrice) {
		this.prevPrice = prevPrice;
	}
	public String getPriceType() {
		return priceType;
	}
	public void setPriceType(String priceType) {
		this.priceType = priceType;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getStartType() {
		return startType;
	}
	public void setStartType(String startType) {
		this.startType = startType;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public String getEndDateYn() {
		return endDateYn;
	}
	public void setEndDateYn(String endDateYn) {
		this.endDateYn = endDateYn;
	}
	public String getDetailYn() {
		return detailYn;
	}
	public void setDetailYn(String detailYn) {
		this.detailYn = detailYn;
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
	public String getApproveStatus() {
		return approveStatus;
	}
	public void setApproveStatus(String approveStatus) {
		this.approveStatus = approveStatus;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getSaveMoney() {
		return saveMoney;
	}
	public void setSaveMoney(int saveMoney) {
		this.saveMoney = saveMoney;
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
	public String getMoneyType() {
		return moneyType;
	}
	public void setMoneyType(String moneyType) {
		this.moneyType = moneyType;
	}
	public String getBusiName() {
		return busiName;
	}
	public void setBusiName(String busiName) {
		this.busiName = busiName;
	}
	
	
}
