<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#login{font-size: 20px;}
#logon{font-size: 20px; color: white}
</style>
<meta charset="UTF-8">
<jsp:include page="cdn.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
<header style="top: 0px; width: 100%; height: 60px; line-height60px; font-size: 30px; text-align: center">
이젠쥬얼리
</header>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index">이젠쥬얼리</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="lista?sort=necklace">목걸이</a></li>
      <li><a href="lista?sort=earring">귀걸이</a></li>
      <li><a href="lista?sort=ring">반지</a></li>
      <li><a href="lista?sort=bracelet">팔찌</a></li>
      <li><a href="notice">상품후기 게시판</a></li>
    </ul>
    <ul class="nav navbar-right">
    <c:choose>
    	<c:when test="${logon==true && mdto != null }">
    		<p id="logon">환영합니다 ${mdto.id}님 <a href="logout">로그아웃</a></p>
    	</c:when>
    	<c:otherwise>
    		<li id="login"><a href="loginform">로그인</a></li>
    	</c:otherwise>
    </c:choose>
    </ul>
  </div>

<c:choose>
	<c:when test="${logon==true && mdto != null}">
		<div class="container-fluid">
		   <ul class="nav navbar-nav">
		      <li><a href="enrollform">상품등록</a></li>
		      <li><a href="page_all_list">모든 상품목록</a></li>
		      <li><a href="form">파일업로드</a></li>
		   </ul>
		</div>
	</c:when>
</c:choose>
</nav>

</body>
</html>