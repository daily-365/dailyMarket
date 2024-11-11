package com.dailyMarket.www.vo;

import java.util.Date;

public class ChatMessageVO {

	private int messageNo;
	private String message;
	private Date createDate;
	private int roomNo;
	private int userNo;
    private String userNick;
    private int dateDiff;
    
    //프로필 사진
    private String storedFileName;
    
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
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
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public int getDateDiff() {
		return dateDiff;
	}
	public void setDateDiff(int dateDiff) {
		this.dateDiff = dateDiff;
	}
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}
	
	
}
