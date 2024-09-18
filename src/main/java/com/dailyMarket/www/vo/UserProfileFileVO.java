package com.dailyMarket.www.vo;

import java.util.Date;

public class UserProfileFileVO extends BusiReviewVO{

		private int fileNo;
		private int userNo;

		private String userId;
		private String originFileName;
		private String storedFileName;
		private String fileSize;
		private Date regDate;
		private Date modDate;
		private Date delDate;
		private String deleteYn;
		
		private String profileFile;
		
		public int getFileNo() {
			return fileNo;
		}
		public void setFileNo(int fileNo) {
			this.fileNo = fileNo;
		}
		
		public int getUserNo() {
			return userNo;
		}
		public void setUserNo(int userNo) {
			this.userNo = userNo;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getOriginFileName() {
			return originFileName;
		}
		public void setOriginFileName(String originFileName) {
			this.originFileName = originFileName;
		}
		public String getStoredFileName() {
			return storedFileName;
		}
		public void setStoredFileName(String storedFileName) {
			this.storedFileName = storedFileName;
		}
		public String getFileSize() {
			return fileSize;
		}
		public void setFileSize(String fileSize) {
			this.fileSize = fileSize;
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
		public String getProfileFile() {
			return profileFile;
		}
		public void setProfileFile(String profileFile) {
			this.profileFile = profileFile;
		}
		
		
}
