package com.dailyMarket.www.vo;

import java.util.Date;

public class BusiNoticeVO extends BusiNoticeFileVO {
	
	private int busiNoticeNo;
	private int busiNo;
	private String title;
	private String subTitle;
	private String content;
	private String subContent;
	private String writer;
	private int hitCnt;
	private int likeCnt;
	private int replyCnt;
	private Date regDate;
	private Date modDate;
	private Date delDate;
	private String deleteYn;
	
	private int endRow;
	
	private String busiName;
	
	public int getBusiNoticeNo() {
		return busiNoticeNo;
	}
	public void setBusiNoticeNo(int busiNoticeNo) {
		this.busiNoticeNo = busiNoticeNo;
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
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSubContent() {
		return subContent;
	}
	public void setSubContent(String subContent) {
		this.subContent = subContent;
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
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
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
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public String getBusiName() {
		return busiName;
	}
	public void setBusiName(String busiName) {
		this.busiName = busiName;
	}
	
	
	
	
}
