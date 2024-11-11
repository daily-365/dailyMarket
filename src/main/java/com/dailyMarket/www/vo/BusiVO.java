package com.dailyMarket.www.vo;

import java.util.Date;

import com.dailyMarket.www.utils.SearchCriteria;


public class BusiVO  {
	private int rnum;
	
	private int busiNo;
	private String busiNum;
	private String writer;
	private String	ownerName;
	private String	busiTel;
	private String	busiName;
	private String  busiType;
	private String	busiType1;
	private String	busiType2;
	private String	busiType3;
	private String	storeTel;
	private String	storeAddr;
	private String	storeAddrDetail;
	private String	agreeYn;
	private String	status;
	private Date	regDate;
	private Date	modDate;
	private Date	delDate;
	private String	deleteYn;
	private String homePage;
	private String introduce;
	private String title;
	
	//조인문을 위한 변수 추가 선언
	private int busiFileNo;
	private String busiStoredFileName;
	
	private String storedFileName;

	private int hitCnt;
	
	private int menuNo;
	private int jobNo;
	
	//페이징 처리를 위한 변수 추가 선언
	private int endRow;
	
	//검색 
	private String keyword;
	
	//채팅  <업체 사용자 번호>
	private int userNo;
	private int roomNo;
	private String userType;
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getBusiNo() {
		return busiNo;
	}

	public void setBusiNo(int busiNo) {
		this.busiNo = busiNo;
	}

	public String getBusiNum() {
		return busiNum;
	}

	public void setBusiNum(String busiNum) {
		this.busiNum = busiNum;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getBusiTel() {
		return busiTel;
	}

	public void setBusiTel(String busiTel) {
		this.busiTel = busiTel;
	}

	public String getBusiName() {
		return busiName;
	}

	public void setBusiName(String busiName) {
		this.busiName = busiName;
	}

	public String getBusiType() {
		return busiType;
	}

	public void setBusiType(String busiType) {
		this.busiType = busiType;
	}

	public String getBusiType1() {
		return busiType1;
	}

	public void setBusiType1(String busiType1) {
		this.busiType1 = busiType1;
	}

	public String getBusiType2() {
		return busiType2;
	}

	public void setBusiType2(String busiType2) {
		this.busiType2 = busiType2;
	}

	public String getBusiType3() {
		return busiType3;
	}

	public void setBusiType3(String busiType3) {
		this.busiType3 = busiType3;
	}

	public String getStoreTel() {
		return storeTel;
	}

	public void setStoreTel(String storeTel) {
		this.storeTel = storeTel;
	}

	public String getStoreAddr() {
		return storeAddr;
	}

	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}

	public String getStoreAddrDetail() {
		return storeAddrDetail;
	}

	public void setStoreAddrDetail(String storeAddrDetail) {
		this.storeAddrDetail = storeAddrDetail;
	}

	public String getAgreeYn() {
		return agreeYn;
	}

	public void setAgreeYn(String agreeYn) {
		this.agreeYn = agreeYn;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
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

	public String getHomePage() {
		return homePage;
	}

	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getBusiFileNo() {
		return busiFileNo;
	}

	public void setBusiFileNo(int busiFileNo) {
		this.busiFileNo = busiFileNo;
	}

	public String getBusiStoredFileName() {
		return busiStoredFileName;
	}

	public void setBusiStoredFileName(String busiStoredFileName) {
		this.busiStoredFileName = busiStoredFileName;
	}

	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	public int getHitCnt() {
		return hitCnt;
	}

	public void setHitCnt(int hitCnt) {
		this.hitCnt = hitCnt;
	}

	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	public int getJobNo() {
		return jobNo;
	}

	public void setJobNo(int jobNo) {
		this.jobNo = jobNo;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	
}
