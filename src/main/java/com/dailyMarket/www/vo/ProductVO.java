package com.dailyMarket.www.vo;

import java.util.Date;

import com.dailyMarket.www.utils.SearchCriteria;

public class ProductVO extends SearchCriteria{
	
	private int rnum;
	
	private String keyword;
	
	private int productNo;
	private int userNo;
	private String title;
	private String type;
	private int price;
	private String content;
	private String location;
	private String writer;
	private String TradeYn;
	private int tradeUserNo;
	private String TradeDate;
	private int hitCnt;
	private int likeCnt;
	private Date regDate;
	private Date modDate;
	private Date delDate;
	private String deleteYn;
	
	//조인문을 위함
	private String productStoredFileName;

	//더보기 기능을 위함
	private int endRow=8;
	
	//프로필 불러오기
	private String profileFile;
	
	//정렬기준
	private String orderType;

	//채팅
	private int roomNo;
	
	//구매
	private String tradeBank;
	private String accountNum;
	private String userName;
	
	//구매자 정보
	private String userTel;
	private String userAddr1;
	private String userAddr2;
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTradeYn() {
		return TradeYn;
	}
	public void setTradeYn(String tradeYn) {
		TradeYn = tradeYn;
	}
	public int getTradeUserNo() {
		return tradeUserNo;
	}
	public void setTradeUserNo(int tradeUserNo) {
		this.tradeUserNo = tradeUserNo;
	}
	public String getTradeDate() {
		return TradeDate;
	}
	public void setTradeDate(String tradeDate) {
		TradeDate = tradeDate;
	}
	public int getHitCnt() {
		return hitCnt;
	}
	public void setHitCnt(int hitCnt) {
		this.hitCnt = hitCnt;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
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
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public String getProfileFile() {
		return profileFile;
	}
	public void setProfileFile(String profileFile) {
		this.profileFile = profileFile;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	
	
	
	

}
