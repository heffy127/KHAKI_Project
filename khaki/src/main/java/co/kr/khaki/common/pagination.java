package co.kr.khaki.common;

public class pagination {

    /** 한 페이지당 게시글 수 **/
    private int pageSize = 10;
    /** 한 블럭(range)당 페이지 수 **/
    private int rangeSize = 5;
    /** 현재 페이지 **/
    private int curPage = 1;
    /** 현재 블럭(range) **/
    private int curRange = 1;
    /** 총 게시글 수 **/
    private int listCnt;
    /** 총 페이지 수 **/
    private int pageCnt;
    /** 총 블럭(range) 수 **/
    private int rangeCnt;
    /** 시작 페이지 **/
    private int startPage = 1;
    /** 끝 페이지 **/
    private int endPage = 1;
    /** 시작 index **/
    private int startIndex = 0;
    /** 끝 index **/
    private int endIndex;
    /** 이전 페이지 **/
    private int prevPage;
    /** 다음 페이지 **/
    private int nextPage;
    
    public pagination(){	//기본 생성자
    	
    }
    
    public pagination(int listCnt, int curPage, int pageSize){	//파라미터 있는 생성자
    	
    	//현재 페이지 정보를 갱신
    	setCurPage(curPage);
    	setListCnt(listCnt);
    	setPageSize(pageSize);
    	
    	// 블럭 > 페이지 > 게시물의 상관관계가 있음
    	/** 1. 총 페이지 수 **/
        setPageCnt(listCnt);
        // 현재 총 게시물 수를 받아서 페이지당 게시물 수를 나눠서 총 페이지 수를 계산
        
        /** 2. 총 블럭(range)수 **/
        setRangeCnt(pageCnt);
        // 총 페이지 수를 받아서 블럭당 페이지 수를 나눠서 총 블럭 수를 계산
        
        /** 3. 블럭(range) setting **/
        rangeSetting(curPage);
        
        /** DB 질의를 위한 startIndex 설정 **/
        setStartIndex(curPage);
        setEndIndex(curPage);
        if(listCnt <= endIndex){
        	this.endIndex = listCnt;
        }
    }
    
    
    // setter & getter
    
    

	public void setPageCnt(int listCnt) {
        this.pageCnt = (int) Math.ceil(listCnt*1.0/pageSize);
    }
    public void setRangeCnt(int pageCnt) {
        this.rangeCnt = (int) Math.ceil(pageCnt*1.0/rangeSize);
    }
    public void rangeSetting(int curPage){
        
        setCurRange(curPage);	//현재 블럭을 확인
        // curRange = 1로 초기화, rangeSize = 10(한 블럭당 페이지 수)
        this.startPage = (curRange - 1) * rangeSize + 1;
        this.endPage = startPage + rangeSize - 1;
        // 예) 2번째 블럭이면 11~20 페이지가 셋팅되어야 하기 때문에
        
        // 2번째 블럭에서 총 게시물 수가 111이면 
        // pageCnt = 12, endPage = 20 따라서 마지막 페이지로 셋팅하게끔 해줌
        if(endPage > pageCnt){
            this.endPage = pageCnt;
        }
        
        // 이전, 다음 버튼 셋팅(현재 페이지보다 1개 앞 / 뒤로)
        this.prevPage = curPage - 1;
        this.nextPage = curPage + 1;
    }
    
    // 현재 범위 지정 : 블럭단위로 몇번째 블럭인지 찾을 수 있도록 지정
    public void setCurRange(int curPage) {
        this.curRange = (int)((curPage-1)/rangeSize) + 1;
    }
    
    public void setStartIndex(int curPage) {
        this.startIndex = (curPage-1) * pageSize;
    }
    
	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int curPage) {
		this.endIndex = (curPage-1) * pageSize + pageSize - 1;
	}
    
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getCurRange() {
		return curRange;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public int getRangeCnt() {
		return rangeCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
}
