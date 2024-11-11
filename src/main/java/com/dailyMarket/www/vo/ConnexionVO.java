package com.dailyMarket.www.vo;

import java.util.Date;

public class ConnexionVO extends BusiVO {

	private int connexionNo;
	private int busiNo;
	private int userNo;
	private String deleteYn;
	private Date regDate;
	private Date modDate;
	private Date delDate;
	private String noticeYn;
	
	
	public int getConnexionNo() {
		return connexionNo;
	}
	public void setConnexionNo(int connexionNo) {
		this.connexionNo = connexionNo;
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
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
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
	public String getNoticeYn() {
		return noticeYn;
	}
	public void setNoticeYn(String noticeYn) {
		this.noticeYn = noticeYn;
	}
	

	
}
