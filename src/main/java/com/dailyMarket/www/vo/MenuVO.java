package com.dailyMarket.www.vo;

import java.util.Date;
import java.util.List;

public class MenuVO extends MenuFileVO {

	private List<MenuVO> menuVO;
	
	private int menuNo;
	private int busiNo;
	private String name;
	private int price;
	private int count;   //(재고 // )
	private String content;
	private String deleveryYn; //( N포장 , Y포장/배송)
	private int deleveryPrice; //( 0무료배송 , 3000 배달료 )
	private Date regDate;
	private Date modDate;
	private Date delDate;
	private String deleteYn;
	
	
	public List<MenuVO> getMenuVO() {
		return menuVO;
	}
	public void setMenuVO(List<MenuVO> menuVO) {
		
		this.menuVO = menuVO;
	}
	
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public int getBusiNo() {
		return busiNo;
	}
	public void setBusiNo(int busiNo) {
		this.busiNo = busiNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDeleveryYn() {
		return deleveryYn;
	}
	public void setDeleveryYn(String deleveryYn) {
		this.deleveryYn = deleveryYn;
	}
	public int getDeleveryPrice() {
		return deleveryPrice;
	}
	public void setDeleveryPrice(int deleveryPrice) {
		this.deleveryPrice = deleveryPrice;
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
