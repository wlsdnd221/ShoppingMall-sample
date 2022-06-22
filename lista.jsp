<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="cdn.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>

<div class="container">
  <h2>상품목록</h2><br>
  <div class="row">
    
    <c:forEach items="${lista}" var="s">
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="detail?num=${s.num}" target="_blank">
          <img src="/prosample/image/${s.picture}" style="width:300px; height: 300px">
          <div class="caption">
            <p>${s.name}</p>
            <p>
            	<fmt:formatNumber type="currency" pattern="#,##0" value="${s.price}" currencySymbol="￦"/>원
            </p>
          </div>
        </a>
      </div>
    </div>
    </c:forEach>
    
  </div>
</div>


</body>
</html>