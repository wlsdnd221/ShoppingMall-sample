<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<style>
#b1{text-align: right}
#title{text-align: left}
th{text-align: center}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");	
%>

<h2 align="center">상품후기</h2>
<form action="board_search" method="post" align="center">
<select name="category">
	<option value="title">제목
	<option value="author">작성자
</select>
<input type="text" name="search">
<input type="submit" value="검색">
</form>
<div class="container">
  <p id="b1">
  	<a href="board_enrollform">
  		<input type="button" value="글 작성">
  	</a>
  </p> 
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>글번호</th>
        <th>작성자</th>
        <th>제목</th>
        <th>작성일자</th>
        <th>조회수</th>
        <c:choose>
			<c:when test="${logon==true && mdto != null}">
	        	<th>수정</th>
	        	<th>삭제</th>
	        </c:when>
        </c:choose>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${lista}" var="b">
      <tr>
        <td>${b.num}</td>
        <td>${b.author}</td>
        <td id="title">
        	<c:forEach begin="1" end="${b.repindent}">
        	&emsp;
        	</c:forEach>
        	<c:choose>
        		<c:when test="${b.repindent>=1}">
        		└
        		</c:when>
        	</c:choose>
        	<a href="board_detail?num=${b.num}">
        		${b.title}
        	</a>
        </td>
        <td>${b.writeday}</td>
        <td>${b.readcnt}</td>
        <c:choose>
       		<c:when test="${logon==true && mdto != null}">
	        <td>
	        	<a href="board_modifyform?num=${b.num}">
	        		<input type="button" value="수정">
	        	</a>
	        </td>
	        <td>
	        	<a href="board_delete?num=${b.num}">
	        		<input type="button" value="삭제">
	        	</a>
	        </td>
        	</c:when>
        </c:choose>
      </tr>
    </c:forEach>
    
    <!-- 페이징 부분 -->
    <tr>
    	<td colspan="5">
    		<c:if test="${paging.startpage !=1 }">
    			<a href="notice?nowpage=${paging.startpage-1}&cntperpage=${paging.cntperpage}">&lt;</a>
    		</c:if>
    		<c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="p">
    			<c:choose>
    				<c:when test="${p == paging.nowpage }">
    					<b>${p}</b>
    				</c:when>
    				<c:when test="${p != paging.nowpage }">
    					<a href="notice?nowpage=${p }&cntperpage=${paging.cntperpage}">
    						${p}
    					</a>
    				</c:when>
    			</c:choose>
    		</c:forEach>
    		<c:if test="${paging.endpage != paging.lastpage }">
    			<a href="notice?nowpage=${paging.endpage+1}&cntperpage=${paging.cntperpage}">&gt;</a>
    		</c:if>
    	</td>
    </tr>
    
    </tbody>
  </table>
</div>

</body>
</html>