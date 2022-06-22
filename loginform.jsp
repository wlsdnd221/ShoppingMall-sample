<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${param.result=='loginfail'}">
		<script type="text/javascript">
		window.onload=function()
					  {
						alert("아이디나 비밀번호를 확인하세요!");
					  }
		</script>
	</c:when>
</c:choose>

<h2 align="center">로그인</h2><br>
<form action="login" method="post">
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
		<input type="password" name="pw">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="로그인">&emsp;&emsp;
		<a href="appform">
			<input type="button" value="회원가입">
		</a>
	</td>
</tr>
</table>
</form>

</body>
</html>