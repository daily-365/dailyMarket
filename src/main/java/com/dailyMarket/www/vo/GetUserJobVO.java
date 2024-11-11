package com.dailyMarket.www.vo;

import java.util.Date;

public class GetUserJobVO extends JobVO{
	private int getUserJobNo;
	private int jobNo;
	
	private String userId;
	private String status;
	
	private Date regDate;
	private Date modDate;
	private Date delDate;
	
	private String deleteYn;

	public int getGetUserJobNo() {
		return getUserJobNo;
	}

	public void setGetUserJobNo(int getUserJobNo) {
		this.getUserJobNo = getUserJobNo;
	}

	public int getJobNo() {
		return jobNo;
	}

	public void setJobNo(int jobNo) {
		this.jobNo = jobNo;
	}

	public String getuserId() {
		return userId;
	}

	public void setuserId(String userId) {
		this.userId = userId;
	}

	public String getstatus() {
		return status;
	}

	public void setstatus(String status) {
		this.status = status;
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
	
	
}
