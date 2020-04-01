package command;

import java.util.List;

import Board.model.BoardBean;

public class PageInfo {
	
	private int total;
	private int currentPage;
	private List<BoardBean> content;
	private int totalpage;
	private int startpage;
	private int endpage;
	private String keyWord;
	private String keyFeild;
	
	PageInfo(int total,int size,List<BoardBean> content,int currentPage,String keyWord,String keyFeild){
		this.total=total;
		this.content=content;
		this.currentPage=currentPage;
		this.keyWord=keyWord;
		this.keyFeild=keyFeild;
		
		
		if(total==0) {
			totalpage=0;
			startpage=0;
			endpage=0;
		}
		else {
			totalpage=total/size;
			if(total%size>0) {
				totalpage++;
			}
			int moval=currentPage%5;
			startpage=currentPage/5*5+1;
			if(moval==0) {
				startpage=startpage-5;
				
				
			}
			endpage=startpage+4;
			if(endpage>totalpage) {
				endpage=totalpage;
			}
			
		}
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getKeyFeild() {
		return keyFeild;
	}

	public void setKeyFeild(String keyFeild) {
		this.keyFeild = keyFeild;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<BoardBean> getContent() {
		return content;
	}

	public void setContent(List<BoardBean> content) {
		this.content = content;
	}

	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}

	public int getEndpage() {
		return endpage;
	}

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	
	

}
