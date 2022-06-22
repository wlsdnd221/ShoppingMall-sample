<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2 align="center">상품후기 수정</h2>
<form action="board_modify?num=${bdto.num}" method="post" enctype="multipart/form-data">
<table border="1" align="center">
<tr>
	<th>작성자</th>
	<td>
		<input type="text" name="author" style="width: 100%">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" style="width: 100%">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50" name="content"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="글 수정">
		<input type="reset" value="다시작성">
	</td>
</tr>
</table>
</form>

</body>
</html>