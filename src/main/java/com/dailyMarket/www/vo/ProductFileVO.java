package com.dailyMarket.www.vo;

import java.util.Date;

public class ProductFileVO {

	private int productFileNo;
	private int productNo;
	private String productOriginFileName;
	private String productStoredFileName;
	private int productFileSize;
	private String productWriter;
	private Date regDate;
	private Date modDate;
	private Date delDate;
	private String deleteYn;
	public int getProductFileNo() {
		return productFileNo;
	}
	public void setProductFileNo(int productFileNo) {
		this.productFileNo = productFileNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductOriginFileName() {
		return productOriginFileName;
	}
	public void setProductOriginFileName(String productOriginFileName) {
		this.productOriginFileName = productOriginFileName;
	}
	public String getProductStoredFileName() {
		return productStoredFileName;
	}
	public void setProductStoredFileName(String productStoredFileName) {
		this.productStoredFileName = productStoredFileName;
	}
	public int getProductFileSize() {
		return productFileSize;
	}
	public void setProductFileSize(int productFileSize) {
		this.productFileSize = productFileSize;
	}
	public String getProductWriter() {
		return productWriter;
	}
	public void setProductWriter(String productWriter) {
		this.productWriter = productWriter;
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
