
package com.nonstop.domain;



public class Search {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	private int projPageSize;
	
	


	private int endRowNum;
	private int startRowNum;
	
	///Constructor
	public Search() {
	}
	
	///Method
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	

	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}

	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}
	
	public int getProjPageSize() {
		return projPageSize;
	}

	public void setProjPageSize(int projPageSize) {
		this.projPageSize = projPageSize;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword
				+ ", pageSize=" + pageSize + ", endRowNum=" + endRowNum
				+ ", startRowNum=" + startRowNum + "]";
	}
}