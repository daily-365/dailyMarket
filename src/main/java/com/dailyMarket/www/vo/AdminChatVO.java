package com.dailyMarket.www.vo;

import java.util.Date;

import com.dailyMarket.www.utils.SearchCriteria;

public class AdminChatVO{

	private int chatNo;
	private int targetUserNo;
	private String userId;
	private String message;
	private Date createDate;
	private String deleteYn;
	private String readYn;
	
	private String createTime;
	
	private int notReadCnt;
	
	private int rnum;
	private int totalCnt;
	
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public int getTargetUserNo() {
		return targetUserNo;
	}
	public void setTargetUserNo(int targetUserNo) {
		this.targetUserNo = targetUserNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getReadYn() {
		return readYn;
	}
	public void setReadYn(String readYn) {
		this.readYn = readYn;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public int getNotReadCnt() {
		return notReadCnt;
	}
	public void setNotReadCnt(int notReadCnt) {
		this.notReadCnt = notReadCnt;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	
	
	
}
