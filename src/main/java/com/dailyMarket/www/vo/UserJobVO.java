package com.dailyMarket.www.vo;

import java.util.Date;

public class UserJobVO extends UserJobFileVO{
	private int userJobNo;
	private int userNo;

	private String writer;
	private String lastName;
	private String firstName;
	private String tel;
	private String gender;
	private String birthYear;
	private String careerYn;
	private String careerLoc;
	private String careerWork;
	private String careerYear;
	private String careerDiff;
	private String advantage;
	private String introduce;
	private String addInfo;
	private Date regDate;
	private Date modDate;
	private Date delDate;
	private String deleteYn;
	public int getUserJobNo() {
		return userJobNo;
	}
	public void setUserJobNo(int userJobNo) {
		this.userJobNo = userJobNo;
	}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthYear() {
		return birthYear;
	}
	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}
	public String getCareerYn() {
		return careerYn;
	}
	public void setCareerYn(String careerYn) {
		this.careerYn = careerYn;
	}
	public String getCareerLoc() {
		return careerLoc;
	}
	public void setCareerLoc(String careerLoc) {
		this.careerLoc = careerLoc;
	}
	public String getCareerWork() {
		return careerWork;
	}
	public void setCareerWork(String careerWork) {
		this.careerWork = careerWork;
	}
	
	public String getCareerYear() {
		return careerYear;
	}
	public void setCareerYear(String careerYear) {
		this.careerYear = careerYear;
	}
	public String getCareerDiff() {
		return careerDiff;
	}
	public void setCareerDiff(String careerDiff) {
		this.careerDiff = careerDiff;
	}
	public String getAdvantage() {
		return advantage;
	}
	public void setAdvantage(String advantage) {
		this.advantage = advantage;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getAddInfo() {
		return addInfo;
	}
	public void setAddInfo(String addInfo) {
		this.addInfo = addInfo;
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
