
package com.nonstop.domain;



public class Search {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	private int projPageSize;
	
	//게시물 구분용(10:웹,앱개발 / 11:웹개발 / 12: 앱개발 / 20:웹,앱 디자인 / 21:웹디 / 22:앱디 ) : portfolio
	//게시물 구분용(11:웹개발 / 12: 앱개발 / 21:웹디 / 22:앱디 ) : project
	private int postDivision;
	
	//게시물 소팅용(1:조회순 / 2:최신순 / 3:좋아요순) : portfolio
	//게시물 소팅용(1:조회순 / 2:최신순 / 3:마감임박순 / 4:지원자순) : project
	private int postSorting;
	




	//페이징, 무한스크롤 위한 게시물 번호

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
	
	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getProjPageSize() {
		return projPageSize;
	}

	public void setProjPageSize(int projPageSize) {
		this.projPageSize = projPageSize;
	}
	
	public int getPostDivision() {
		return postDivision;
	}

	public void setPostDivision(int postDivision) {
		this.postDivision = postDivision;
	}
	
	public int getPostSorting() {
		return postSorting;
	}

	public void setPostSorting(int postSorting) {
		this.postSorting = postSorting;
	}
    
	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword
				+ ", pageSize=" + pageSize + ", endRowNum=" + endRowNum
				+ ", startRowNum=" + startRowNum + ", postDivision=" + postDivision +", postSorting=" + postSorting + "]";
	}
}