package com.ezen.prosample;

import java.text.DateFormat; 
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.prosample.Service;
import com.ezen.prosample.PagingDTO;

/*
상품
테이블명 : PROJECTSAMPLE
컬럼명 및 유형
	NUM NUMBER(3)
	SORT VARCHAR2(30)
	NAME VARCHAR2(100)
	PURITY VARCHAR2(20)
	PRICE NUMBER(8)
	CONTENT VARCHAR2(1000)
	PICTURE VARCHAR2(100)
	
회원가입 및 로그인
테이블명 : MEMBER1
컬럼명 및 유형
	ID VARCHAR2(20)
	PW VARCHAR2(20)
	NAME VARCHAR2(20)
	PHON VARCHAR2(20)
	
게시판(상품후기)
테이블명 : BOARD
컬럼명 및 유형
	NUM NUMBER(3)
	AUTHOR VARCHAR2(20)
	TITLE VARCHAR2(50)
	CONTENT VARCHAR2(300)
	WRITEDAY DATE DEFAULT SYSDATE
	READCNT NUMBER(3)
	REPROOT NUMBER(3)
	REPSTEP NUMBER(3)
	REPINDENT NUMBER(3)
	PICTURE VARCHAR2(100)
*/

/*
상품입력, 수정, 삭제, 파일업로드, 할인 같은 기능은 로그인을 해야만 가능합니다.
*/
@Controller
public class HomeController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/index")
	public String ko(Model mo)
	{
		Service dao = sqlSession.getMapper(Service.class);
		ArrayList<BoardDTO> lista = dao.mainboard();
		
		mo.addAttribute("lista", lista);
		
		return "main";
	}
	
	@RequestMapping(value="/enrollform")
	public String ko1()
	{
		return "enroll";
	}
	
	@RequestMapping(value="/enroll", method=RequestMethod.POST)
	public String ko2(MultipartHttpServletRequest multi)
	{
		String sort, name, purity, content, picture;
		int price;
		MultipartFile mf = multi.getFile("picture");
		
		sort = multi.getParameter("sort");
		name = multi.getParameter("name");
		purity = multi.getParameter("purity");
		price = Integer.parseInt(multi.getParameter("price"));
		content = multi.getParameter("content");
		picture = mf.getOriginalFilename();
		
		Service dao = sqlSession.getMapper(Service.class);
		dao.enroll(sort, name, purity, price, content, picture);
		
		return "redirect:all_list";
	}
	
	@RequestMapping(value="/all_list")
	public String ko3(Model mo)
	{
		Service dao = sqlSession.getMapper(Service.class);
		ArrayList<SangpumDTO> lista = dao.all_list();
		
		mo.addAttribute("lista", lista);
		
		return "all_list";
	}
	
	@RequestMapping(value="/lista")
	public String ko4(HttpServletRequest request, Model mo)
	{
		String sort;
		sort = request.getParameter("sort");
		
		Service dao = sqlSession.getMapper(Service.class);
		ArrayList<SangpumDTO> lista = dao.lista(sort);
		
		mo.addAttribute("lista", lista);
		
		return "lista";
	}
	
	@RequestMapping(value="/detail")
	public ModelAndView ko5(HttpServletRequest request)
	{
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		Service dao = sqlSession.getMapper(Service.class);
		SangpumDTO sdto = dao.detail(num);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("sdto", sdto);
		mav.setViewName("detail");
		
		return mav;
	}
	
	@RequestMapping(value="/delete")
	public String ko6(HttpServletRequest request)
	{
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		Service dao = sqlSession.getMapper(Service.class);
		dao.delete(num);
		
		return "redirect:all_list";
	}
	
	@RequestMapping(value="/modifyform")
	public String ko7(HttpServletRequest request, Model mo)
	{
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		Service dao = sqlSession.getMapper(Service.class);
		SangpumDTO sdto = dao.detail(num);
		
		mo.addAttribute("sdto", sdto);
		
		return "modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String ko8(MultipartHttpServletRequest multi)
	{
		int num;
		String sort, name, purity, content, picture;
		int price;
		MultipartFile mf = multi.getFile("picture");
		
		num = Integer.parseInt(multi.getParameter("num"));
		sort = multi.getParameter("sort");
		name = multi.getParameter("name");
		purity = multi.getParameter("purity");
		price = Integer.parseInt(multi.getParameter("price"));
		content = multi.getParameter("content");
		picture = mf.getOriginalFilename();
		
		Service dao = sqlSession.getMapper(Service.class);
		dao.modify(sort, name, purity, price, content, picture, num);
		
		return "redirect:all_list";
	}
	
	@RequestMapping(value="/searchall", method=RequestMethod.POST)
	public String ko9(HttpServletRequest request, Model mo)
	{
		String category;
		category = request.getParameter("category");
		
		Service dao = sqlSession.getMapper(Service.class);
		ArrayList<SangpumDTO> lista=null;
		if(category.equals("num"))
		{
			int search = Integer.parseInt(request.getParameter("search"));
			lista = dao.searchnum(search);
		}
		else if(category.equals("name"))
		{
			String search = request.getParameter("search");
			lista = dao.searchname(search);
		}
		
		mo.addAttribute("lista", lista);
		
		return "all_list";
	}
	
	@RequestMapping(value="/loginform")
	public String ko10()
	{
		return "loginform";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String ko11(HttpServletRequest request, Model mo)
	{
		String id, pw;
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		
		Service dao = sqlSession.getMapper(Service.class);
		MemberDTO mdto = dao.login(id, pw);
		
		if(mdto != null)
		{
			HttpSession hs = request.getSession();
			hs.setAttribute("mdto", mdto);
			hs.setAttribute("logon", true);
			
			return "redirect:index";
		}
		else
		{
			mo.addAttribute("result", "loginfail");
			
			return "redirect:loginform";
		}
	}
	
	@RequestMapping(value="/logout")
	public String ko12(HttpServletRequest request)
	{
		HttpSession hs = request.getSession();
		hs.removeAttribute("mdto");
		hs.removeAttribute("logon");
		
		return "redirect:loginform";
	}
	
	@RequestMapping(value="/appform")
	public String ko13()
	{
		return "application";
	}
	
	@RequestMapping(value="/application", method=RequestMethod.POST)
	public String ko14(HttpServletRequest request)
	{
		String id, pw, name, phon;
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		phon = request.getParameter("phon");
		
		Service dao = sqlSession.getMapper(Service.class);
		dao.application(id, pw, name, phon);
		
		return "redirect:loginform";
	}
	
	@RequestMapping(value="/boardlist")
	public String ko15(Model mo)
	{
		Service dao = sqlSession.getMapper(Service.class);
		ArrayList<BoardDTO> lista = dao.boardlist();
		
		mo.addAttribute("lista", lista);
		
		return "boardlist";
	}
	
	@RequestMapping(value="/board_enrollform")
	public String ko16()
	{
		return "boardenroll";
	}
	
	@RequestMapping(value="/board_enroll", method=RequestMethod.POST)
	public String ko17(MultipartHttpServletRequest multi)
	{
		String author, title, content;
		
		author = multi.getParameter("author");
		title = multi.getParameter("title");
		content = multi.getParameter("content");
		
		Service dao = sqlSession.getMapper(Service.class);
		dao.boardenroll(author, title, content);
		
		return "redirect:boardlist";
	}
	
	
	@RequestMapping(value="/board_detail")
	public String ko18(HttpServletRequest request, Model mo)
	{
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		Service dao = sqlSession.getMapper(Service.class);
		dao.readcnt(num);
		BoardDTO bdto = dao.boarddetail(num);
		
		mo.addAttribute("bdto", bdto);
		
		return "boarddetail";
	}
	
	@RequestMapping(value="/board_delete")
	public String ko19(HttpServletRequest request)
	{
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		Service dao = sqlSession.getMapper(Service.class);
		dao.boarddelete(num);
		
		return "redirect:boardlist";
	}
	
	@RequestMapping(value="board_modifyform")
	public String ko20(HttpServletRequest request, Model mo)
	{
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		Service dao = sqlSession.getMapper(Service.class);
		BoardDTO bdto = dao.boarddetail(num);
		
		mo.addAttribute("bdto", bdto);
		
		return "boardmodify";
	}
	
	@RequestMapping(value="/board_modify", method=RequestMethod.POST)
	public String ko21(MultipartHttpServletRequest multi)
	{
		int num;
		String author, title, content;
		
		num = Integer.parseInt(multi.getParameter("num"));
		author = multi.getParameter("author");
		title = multi.getParameter("title");
		content = multi.getParameter("content");
		
		Service dao = sqlSession.getMapper(Service.class);
		dao.boardmodify(author, title, content, num);
		
		return "redirect:boardlist";
	}
	
	@RequestMapping(value="/board_replyform")
	public String ko22(HttpServletRequest request, Model mo)
	{
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		Service dao = sqlSession.getMapper(Service.class);
		BoardDTO bdto = dao.boarddetail(num);
		
		mo.addAttribute("bdto", bdto);
		
		return "boardreply";
	}
	
	@RequestMapping(value="/board_reply")
	public String ko23(MultipartHttpServletRequest multi, Model mo)
	{
		int reproot, repstep, repindent;
		String author, title, content, picture;
		
		reproot = Integer.parseInt(multi.getParameter("reproot"));
		repstep = Integer.parseInt(multi.getParameter("repstep"));
		repindent = Integer.parseInt(multi.getParameter("repindent"));
		author = multi.getParameter("author");
		title = multi.getParameter("title");
		content = multi.getParameter("content");
		
		ko24(reproot, repstep);
		
		Service dao = sqlSession.getMapper(Service.class);
		dao.boardreply(author, title, content, reproot, repstep+1, repindent+1);
		
		return "redirect:boardlist";
	}
	
	public void ko24(int reproot, int repstep)
	{
		Service dao = sqlSession.getMapper(Service.class);
		dao.repstep(reproot, repstep);
	}
	
	@RequestMapping(value="/board_search", method=RequestMethod.POST)
	public String ko25(HttpServletRequest request, Model mo)
	{
		String category, search;
		category = request.getParameter("category");
		search = request.getParameter("search");
		
		Service dao = sqlSession.getMapper(Service.class);
		ArrayList<BoardDTO> lista = null;
		if(category.equals("title"))
		{
			 lista = dao.board_searchtitle(search);
		}
		else if(category.equals("author"))
		{
			lista = dao.board_searchauthor(search);
		}
		
		mo.addAttribute("lista", lista);
		
		return "boardlist";
	}
	
	@RequestMapping(value="/discount")
	public String ko26(HttpServletRequest request, Model mo)
	{
		int num, dc;
		double dcrate;
		
		num = Integer.parseInt(request.getParameter("num"));
		dc = Integer.parseInt(request.getParameter("dc"));
		dcrate = (double)(100-dc)/100;
		
		Service dao = sqlSession.getMapper(Service.class);
		dao.discount(num, dcrate);
		
		mo.addAttribute("num", num);
		
		return "redirect:detail";
	}
	
	// 페이징 연습
	@RequestMapping("/notice")
	public String ko27(PagingDTO pdto
					  ,Model mo
					  ,@RequestParam(value="nowpage", required=false)String nowpage
					  ,@RequestParam(value="cntperpage", required=false) String cntperpage)
	{
		Service dao = sqlSession.getMapper(Service.class);
		int total = dao.cntnotice(); // 현재레코드 수
		if(nowpage == null && cntperpage == null)
		{
			nowpage = "1";
			cntperpage = "5";
		}
		else if(nowpage == null)
		{
			nowpage = "1";
		}
		else if(cntperpage == null)
		{
			cntperpage = "5";
		}
		
		pdto = new PagingDTO(total, Integer.parseInt(nowpage), Integer.parseInt(cntperpage));
		mo.addAttribute("paging", pdto);
		mo.addAttribute("lista", dao.selectnotice(pdto));
		
		return "page";
	}
	
	// 모든 상품목록 페이징 연습
	@RequestMapping(value="/page_all_list")
	public String ko28(PagingDTO pdto
					  ,Model mo
					  ,@RequestParam(value="nowpage", required=false)String nowpage
					  ,@RequestParam(value="cntperpage", required=false) String cntperpage)
	{
		Service dao = sqlSession.getMapper(Service.class);
		int total = dao.totalrecord(); // 현재레코드 수
		if(nowpage == null && cntperpage == null)
		{
			nowpage = "1";
			cntperpage = "5";
		}
		else if(nowpage == null)
		{
			nowpage = "1";
		}
		else if(cntperpage == null)
		{
			cntperpage = "5";
		}
		pdto = new PagingDTO(total, Integer.parseInt(nowpage), Integer.parseInt(cntperpage));
		mo.addAttribute("paging", pdto);
		mo.addAttribute("lista", dao.page_all_lista(pdto));
		
		return "page_all_lista";
	}
	
	/* 상품목록 페이징 연습
	@RequestMapping(value="/page_lista")
	public String ko29(PagingDTO pdto
					  ,Model mo
					  ,HttpServletRequest request
					  ,@RequestParam(value="nowpage", required=false)String nowpage
					  ,@RequestParam(value="cntperpage", required=false) String cntperpage)
	{
		String sort;
		sort = request.getParameter("sort");
		
		Service dao = sqlSession.getMapper(Service.class);
		int total = dao.totalrecord1(sort); // 현재레코드 수
		if(nowpage == null && cntperpage == null)
		{
			nowpage = "1";
			cntperpage = "5";
		}
		else if(nowpage == null)
		{
			nowpage = "1";
		}
		else if(cntperpage == null)
		{
			cntperpage = "5";
		}
		pdto = new PagingDTO(total, Integer.parseInt(nowpage), Integer.parseInt(cntperpage));
		mo.addAttribute("paging", pdto);
		mo.addAttribute("lista", dao.page_lista(pdto, sort));
		
		return "page_lista";
	}
	*/
}
