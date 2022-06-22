<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">상품수정</h2><br>
<form action="modify" method="post" enctype="multipart/form-data">
<table border="1" align="center">
<tr>
	<th>상품번호</th>
	<td><input type="text" name="num" value="${sdto.num}" readonly></td>
</tr>
<tr>
	<th>분류</th>
	<td>
		<select name="sort" style="width: 100%">
			<option value="">분류
			<option value="necklace">목걸이
			<option value="earring">귀걸이
			<option value="ring">반지
			<option value="bracelet">팔찌
		</select>
	</td>
</tr>
<tr>
	<th>상품명</th>
	<td>
		<input type="text" name="name" style="width: 100%">
	</td>
</tr>
<tr>
	<th>순도</th>
	<td>
		<select name="purity" style="width: 100%">
			<option value="">순도선택
			<option value="14k">14k
			<option value="18k">18k
			<option value="24k">24k
		</select>
	</td>
</tr>
<tr>
	<th>가격</th>
	<td>
		<input type="text" name="price" style="width: 100%">
	</td>
</tr>
<tr>
	<th>상세설명</th>
	<td>
		<textarea rows="20" cols="40" name="content"></textarea>
	</td>
</tr>
<tr>
	<th>상품이미지</th>
	<td>
		<input type="file" name="picture">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="수정하기">
		<input type="reset" value="다시쓰기">
	</td>
</tr>
</table>
</form>
</body>
</html>