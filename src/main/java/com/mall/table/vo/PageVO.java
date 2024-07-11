package com.mall.table.vo;

public class PageVO {

	private int total; //조회된 데이터 총갯수
	private int countPerPage=10; //페이지당 조회수 ( Default : 10개)
	private int currentPage=1; //현재페이지
	private int startPage; //시작페이지
	private int endPage; //종료페이지

	
    public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartPage() {
    	return currentPage/countPerPage+1;  //페이지의 시작페이지계산
    }

    public int getEndPage() {
    	return total/countPerPage+1;		//페이징의 종료페이지계산
    }
}