<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
#b1{text-align: right}
</style>

<meta charset="UTF-8">
<jsp:include page="cdn.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>

<h2 align="center">상품 목록</h2>
<form action="searchall" method="post">
<select name="category">
	<option value="num">상품번호
	<option value="name">상품명
</select>
<input type="text" name="search">
<input type="submit" value="검색">
</form>

<div class="container">            
  <p id="b1">
  	<a href="enrollform">
  		<input type="button" value="상품등록">
  	</a>
  </p> 
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>상품번호</th>
        <th>이미지</th>
        <th>분류</th>
        <th>상품명</th>
        <th>순도</th>
        <th>가격</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${lista}" var="s">
      <tr>
        <td>${s.num}</td>
        <td>
        	<img src="/prosample/image/${s.picture}" width="50" height="50">
        </td>
        <td>
        	<c:choose>
					<c:when test="${s.sort=='necklace'}">목걸이</c:when>
					<c:when test="${s.sort=='earring'}">귀걸이</c:when>
					<c:when test="${s.sort=='ring'}">반지</c:when>
					<c:when test="${s.sort=='bracelet'}">팔찌</c:when>
			</c:choose>
        </td>
        <td>
        	<a href="detail?num=${s.num}">
        		${s.name}
        	</a>
        </td>
        <td>${s.purity}</td>
        <td>
        	<fmt:formatNumber type="currency" pattern="#,##0" value="${s.price}" currencySymbol="￦"/>원
        </td>
        <td>
        	<a href="modifyform?num=${s.num}">
        		<button>수정</button>
        	</a>
        </td>
        <td>
        	<a href="delete?num=${s.num}">
        		<button>삭제</button>
        	</a>
        </td>
      </tr>
      </c:forEach>
      
      <!-- 페이징 부분 -->
    <tr>
    	<td colspan="8">
    		<c:if test="${paging.startpage !=1 }">
    			<a href="page_all_list?nowpage=${paging.startpage-1}&cntperpage=${paging.cntperpage}">&lt;</a>
    		</c:if>
    		<c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="p">
    			<c:choose>
    				<c:when test="${p == paging.nowpage }">
    					<b>${p}</b>
    				</c:when>
    				<c:when test="${p != paging.nowpage }">
    					<a href="page_all_list?nowpage=${p }&cntperpage=${paging.cntperpage}">
    						${p}
    					</a>
    				</c:when>
    			</c:choose>
    		</c:forEach>
    		<c:if test="${paging.endpage != paging.lastpage }">
    			<a href="page_all_list?nowpage=${paging.endpage+1}&cntperpage=${paging.cntperpage}">&gt;</a>
    		</c:if>
    	</td>
    </tr>
    </tbody>
  </table>
</div>

</body>
</html>