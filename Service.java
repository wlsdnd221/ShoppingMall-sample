package com.ezen.prosample;

import java.util.ArrayList;

public interface Service
{
	public void enroll(String sort, String name, String purity, int price, String content, String picture);
	public ArrayList<SangpumDTO> all_list();
	public ArrayList<SangpumDTO> lista(String sort);
	public SangpumDTO detail(int num);
	public void delete(int num);
	public void modify(String sort, String name, String purity, int price, String content, String picture, int num);
	public ArrayList<SangpumDTO> searchnum(int search);
	public ArrayList<SangpumDTO> searchname(String search);
	public void discount(int num, double dcrate);
	
	public MemberDTO login(String id, String pw);
	public void application(String id, String pw, String name, String phon);
	
	public ArrayList<BoardDTO> boardlist();
	public void boardenroll(String author, String title, String content);
	public void readcnt(int num);
	public BoardDTO boarddetail(int num);
	public void boarddelete(int num);
	public void boardmodify(String author, String title, String content, int num);
	public void repstep(int reproot, int repstep);
	public void boardreply(String author, String title, String content, int reproot, int repstep, int repindent);
	public ArrayList<BoardDTO> board_searchtitle(String search);
	public ArrayList<BoardDTO> board_searchauthor(String search);
	
	// 페이징연습
	public ArrayList<BoardDTO> selectnotice(PagingDTO pdto);
	public int cntnotice();
	// 모든 상품목록 페이징연습
	public int totalrecord();
	public ArrayList<SangpumDTO> page_all_lista(PagingDTO pdto);
	/* 상품목록 페이징연습
	public int totalrecord1(String sort);
	public ArrayList<SangpumDTO> page_lista(PagingDTO pdto, String sort);
	*/
	
	// 메인화면 상품후기
	public ArrayList<BoardDTO> mainboard();
}
