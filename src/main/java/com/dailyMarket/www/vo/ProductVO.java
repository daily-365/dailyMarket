package com.dailyMarket.www.vo;

import java.util.Date;

import com.dailyMarket.www.utils.SearchCriteria;

public class ProductVO extends SearchCriteria{
	
	private int rnum;
	
	private int productNo;
	private String title;
	private String type;
	private int price;
	private String content;
	private String location;
	private String writer;
	private int hitCnt;
	private int likeCnt;
	private int reportCnt;
	private Date regDate;
	private Date modDate;
	private Date delDate;
	private String deleteYn;
	
	//조인문을 위함
	private String productStoredFileName;

	//더보기 기능을 위함
	private int startRow=0;
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public int getReportCnt() {
		return reportCnt;
	}

	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
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

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	
	
	
	

}
