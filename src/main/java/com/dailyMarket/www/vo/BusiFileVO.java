package com.dailyMarket.www.vo;

import java.util.Date;

public class BusiFileVO {
	private int busiFileNo;
	private int busiNo;
	private String busiOriginFileName;
	private String busiStoredFileName;
	private String busiFileSize;
	private String busiWriter;
	private Date regDate;
	private Date modDate;
	private Date delDate;
	private String deleteYn;
	
	
	public int getBusiFileNo() {
		return busiFileNo;
	}
	public void setBusiFileNo(int busiFileNo) {
		this.busiFileNo = busiFileNo;
	}
	public int getbusiNo() {
		return busiNo;
	}
	public void setbusiNo(int busiNo) {
		this.busiNo = busiNo;
	}
	public String getBusiOriginFileName() {
		return busiOriginFileName;
	}
	public void setBusiOriginFileName(String busiOriginFileName) {
		this.busiOriginFileName = busiOriginFileName;
	}
	public String getBusiStoredFileName() {
		return busiStoredFileName;
	}
	public void setBusiStoredFileName(String busiStoredFileName) {
		this.busiStoredFileName = busiStoredFileName;
	}
	public String getBusiFileSize() {
		return busiFileSize;
	}
	public void setBusiFileSize(String busiFileSize) {
		this.busiFileSize = busiFileSize;
	}
	public String getbusiWriter() {
		return busiWriter;
	}
	public void setbusiWriter(String busiWriter) {
		this.busiWriter = busiWriter;
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
