<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">회원가입</h2><br>
<form action="application" method="post">
<table border="1" align="center">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id">
	</td>
</tr>
<tr>
	<th>비밀번호</th>
	<td>
		<input type="text" name="pw">
	</td>
</tr>
<tr>
	<th>이름</th>
	<td>
		<input type="text" name="name">
	</td>
</tr>
<tr>
	<th>전화번호</th>
	<td>
		<input type="text" name="phon">
	</td>
</tr>

<tr>
	<td colspan="2">
		<input type="submit" value="회원가입">&emsp;&emsp;
		<input type="reset" value="다시쓰기">
	</td>
</tr>
</table>
</form>
</body>
</html>