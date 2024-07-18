package com.dailyMarket.www.utils;

public class Criteria{

	private int page;
	private int pagePerNum;
	private int startRow;
	private int endRow;
	
	public Criteria() {
		this.page=1;
		this.pagePerNum=5;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page<0) {
			this.page=1;
			return;
		}
		this.page = page;
	}

	public int getPagePerNum() {
		return pagePerNum;
	}

	public void setPagePerNum(int pagePerNum) {
		if(pagePerNum<0 ||pagePerNum>100) {
			this.pagePerNum=10;
			return;
		}
		this.pagePerNum = pagePerNum;
	}

	public int getStartPage() {
		return (this.page-1)*pagePerNum;
	}
	public int getStartRow() {
		startRow=((page-1)*pagePerNum)+1;
		return startRow;
	}
	
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		endRow= startRow+pagePerNum-1;
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	
	
}
