package com.ezen.prosample;

/*
상품

시퀀스명 : PROJECTSAMPLE_SEQ

테이블명 : PROJECTSAMPLE
컬럼명 및 유형
	NUM NUMBER(3)
	SORT VARCHAR2(30)
	NAME VARCHAR2(100)
	PURITY VARCHAR2(20)
	PRICE NUMBER(8)
	CONTENT VARCHAR2(1000)
	PICTURE VARCHAR2(100) 
*/

public class SangpumDTO
{
	int num;
	String sort, name, purity;
	int price;
	String content, picture;
	
	public SangpumDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SangpumDTO(int num, String sort, String name, String purity, int price, String content, String picture) {
		super();
		this.num = num;
		this.sort = sort;
		this.name = name;
		this.purity = purity;
		this.price = price;
		this.content = content;
		this.picture = picture;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPurity() {
		return purity;
	}
	public void setPurity(String purity) {
		this.purity = purity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	

}
