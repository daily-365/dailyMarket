package com.dailyMarket.www.vo;

import java.util.Date;

public class JobVO extends UserJobVO{
	private int rnum;
	private int jobNo;
	private String jobWriter;
	private String jobCompany;
	private String jobTitle;
	private String jobType;
	private String jobMoney;
	private String jobLoc;
	private String jobLocDetail;
	private String jobWorkDate;
	private String jobWorkTime;
	private String jobLocContent;
	private String jobContent;
	private int hitCnt;
	private Date regDate;
	private Date modDate;
	private Date delDate;
	private String deleteYn;
	
	private	long regMinute;
	private long regHour;
	private long regDay;
	private long regWeek;
	private long regMonth;
	private long regYear;
	
	private String storedFileName;
	
	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	private int endRow;
	
	public int getJobNo() {
		return jobNo;
	}
	public void setJobNo(int jobNo) {
		this.jobNo = jobNo;
	}
	public String getJobWriter() {
		return jobWriter;
	}
	public void setJobWriter(String jobWriter) {
		this.jobWriter = jobWriter;
	}
	public String getJobCompany() {
		return jobCompany;
	}
	public void setJobCompany(String jobCompany) {
		this.jobCompany = jobCompany;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getJobMoney() {
		return jobMoney;
	}
	public void setJobMoney(String jobMoney) {
		this.jobMoney = jobMoney;
	}
	public String getJobLoc() {
		return jobLoc;
	}
	public void setJobLoc(String jobLoc) {
		this.jobLoc = jobLoc;
	}
	public String getJobLocDetail() {
		return jobLocDetail;
	}
	public void setJobLocDetail(String jobLocDetail) {
		this.jobLocDetail = jobLocDetail;
	}
	public String getJobWorkDate() {
		return jobWorkDate;
	}
	public void setJobWorkDate(String jobWorkDate) {
		this.jobWorkDate = jobWorkDate;
	}
	public String getJobWorkTime() {
		return jobWorkTime;
	}
	public void setJobWorkTime(String jobWorkTime) {
		this.jobWorkTime = jobWorkTime;
	}
	public String getJobLocContent() {
		return jobLocContent;
	}
	public void setJobLocContent(String jobLocContent) {
		this.jobLocContent = jobLocContent;
	}
	public String getJobContent() {
		return jobContent;
	}
	public void setJobContent(String jobContent) {
		this.jobContent = jobContent;
	}
	
	public int getHitCnt() {
		return hitCnt;
	}
	public void setHitCnt(int hitCnt) {
		this.hitCnt = hitCnt;
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
	public long getRegMinute() {
		return regMinute;
	}
	public void setRegMinute(long regMinute) {
		this.regMinute = regMinute;
	}
	public long getRegHour() {
		return regHour;
	}
	public void setRegHour(long regHour) {
		this.regHour = regHour;
	}
	public long getRegDay() {
		return regDay;
	}
	public void setRegDay(long regDay) {
		this.regDay = regDay;
	}
	public long getRegWeek() {
		return regWeek;
	}
	public void setRegWeek(long regWeek) {
		this.regWeek = regWeek;
	}
	public long getRegMonth() {
		return regMonth;
	}
	public void setRegMonth(long regMonth) {
		this.regMonth = regMonth;
	}
	public long getRegYear() {
		return regYear;
	}
	public void setRegYear(long regYear) {
		this.regYear = regYear;
	}
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	
}
