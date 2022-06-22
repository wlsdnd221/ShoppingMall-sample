<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
#d1{display: none}
#d2{text-align: right}
</style>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#b1").click(function(){
		$("#b1").hide();
		$("#d1").show();
	})
})
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">상품상세</h2><br>
<table border="1" align="center">
<tr>
	<td>
		<img src="/prosample/image/${sdto.picture}">
	</td>
	<td>	
		<table border="1" align="center">
		<tr>
			<th>상품번호</th>
			<td>${sdto.num}</td>
		</tr>
		<tr>
			<th>분류</th>
			<td>
				<c:choose>
					<c:when test="${sdto.sort=='necklace'}">목걸이</c:when>
					<c:when test="${sdto.sort=='earring'}">귀걸이</c:when>
					<c:when test="${sdto.sort=='ring'}">반지</c:when>
					<c:when test="${sdto.sort=='bracelet'}">팔찌</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td>
				${sdto.name}
			</td>
		</tr>
		<tr>
			<th>순도</th>
			<td>${sdto.purity}</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>
				<fmt:formatNumber type="currency" pattern="#,##0" value="${sdto.price}"/>
				<c:choose>
					<c:when test="${logon==true && mdto != null}">
				<br>
				<div id="d1">
				<form action="discount?num=${sdto.num}" method="post">
					<input type="text" name="dc">%
					<input type="submit" value="적용">
				</form>
				</div>
				<div id="d2">
				<button id="b1">할인하기</button>
				</div>
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>상세설명</th>
			<td>
				<textarea rows="20" cols="40" name="content" readonly>${sdto.content}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="lista?sort=${sdto.sort}">
					<input type="button" value="목록으로">
				</a>
				<c:choose>
					<c:when test="${logon==true && mdto != null}">
						<a href="modifyform?num=${sdto.num}">
							<input type="button" value="수정">
						</a>
						<a href="delete?num=${sdto.num}">
							<input type="button" value="삭제">
						</a>
					</c:when>
				</c:choose>
			</td>
		</tr>
		</table>	
	</td>
</tr>
</table>

</body>
</html>