package com.ezen.prosample;

/*
회원가입 및 로그인
테이블명 : MEMBER1
컬럼명 및 유형
	ID VARCHAR2(20)
	PW VARCHAR2(20)
	NAME VARCHAR2(20)
	PHON VARCHAR2(20)
*/

public class MemberDTO
{
	String id, pw, name, phon;

	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String id, String pw, String name, String phon) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phon = phon;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhon() {
		return phon;
	}

	public void setPhon(String phon) {
		this.phon = phon;
	}

	
	
}
