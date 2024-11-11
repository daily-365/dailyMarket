package com.dailyMarket.www.vo;

import java.util.Date;

public class BusiReviewVO extends BusiReviewFileVO{
	
	private int busiReviewNo;
	private int busiNo;
	private String title;
	private String content;
	private String writer;
	private int hitCnt ;
	private Date regDate;
	private Date modDate;
	private Date delDate;
	private String deleteYn;
	
	//user/company/main화면에 뿌릴 데이터 ( 조인 문 사용을 위함 )
	private String busiName;
	private String userAddr1;
	
	//timestampdiff
	private long regMinute;
	private long regHour;
	private long regDay;
	private long regWeek;
	private long regMonth;
	private long regYear;
	
	//더보기
	private int endRow;
	
	//이미지
	private String reviewStoredFileName;
	private String userStoredFileName;
	
	public int getBusiReviewNo() {
		return busiReviewNo;
	}
	public void setBusiReviewNo(int busiReviewNo) {
		this.busiReviewNo = busiReviewNo;
	}
	public int getBusiNo() {
		return busiNo;
	}
	public void setBusiNo(int busiNo) {
		this.busiNo = busiNo;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getBusiName() {
		return busiName;
	}
	public void setBusiName(String busiName) {
		this.busiName = busiName;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
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
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public String getReviewStoredFileName() {
		return reviewStoredFileName;
	}
	public void setReviewStoredFileName(String reviewStoredFileName) {
		this.reviewStoredFileName = reviewStoredFileName;
	}
	public String getUserStoredFileName() {
		return userStoredFileName;
	}
	public void setUserStoredFileName(String userStoredFileName) {
		this.userStoredFileName = userStoredFileName;
	}
	
	
	
	
	
	
}
