<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2 align="center">글 자세히보기</h2><br>
<table border="1" align="center">
<tr>
	<th>글번호</th>
	<td>${bdto.num}</td>
	<th>조회수</th>
	<td>${bdto.readcnt}</td>
</tr>
<tr>
	<th>작성자</th>
	<td>${bdto.author}</td>
	<th>작성일자</th>
	<td>${bdto.writeday}</td>
</tr>
<tr>
	<th>내용</th>
	<td colspan="3">
		<textarea rows="20" cols="50">
			${bdto.content}
		</textarea>
	</td>
</tr>
<tr>
	<td colspan="4">
		<a href="notice">
			<input type="button" value="목록으로">
		</a>
		<a href="board_replyform?num=${bdto.num}">
			<input type="submit" value="답글작성">
		</a>
	</td>
</tr>
</table>

</body>
</html>