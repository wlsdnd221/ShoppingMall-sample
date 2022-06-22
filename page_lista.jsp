<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#d1{text-align: right}
</style>
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
  
  <div id="d1">
  <c:if test="${paging.startpage !=1 }">
    			<a href="page_lista?nowpage=${paging.startpage-1}&cntperpage=${paging.cntperpage}">&lt;</a>
    </c:if>
	<c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="p">
		<c:choose>
			<c:when test="${p == paging.nowpage }">
				<b>${p}</b>
			</c:when>
			<c:when test="${p != paging.nowpage }">
				<a href="page_lista?nowpage=${p }&cntperpage=${paging.cntperpage}">
					${p}
				</a>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endpage != paging.lastpage }">
		<a href="page_lista?nowpage=${paging.endpage+1}&cntperpage=${paging.cntperpage}">&gt;</a>
	</c:if>
	</div>

</body>
</html>