<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table{text-align: left}
</style>
<meta charset="UTF-8">
<jsp:include page="cdn.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>

<div class="container">
  <h2>이달의 행사</h2>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="/prosample/image/벨라마린스톤 반지.JPG" style="width: 100%; height: 400px;">
      </div>

      <div class="item">
        <img src="/prosample/image/순금목걸이.PNG" style="width: 100%; height: 400px;">
      </div>
    
      <div class="item">
        <img src="/prosample/image/오닉스목걸이.PNG" style="width: 100%; height: 400px;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<br><br>

<div class="container">
  <h2>생생한 상품후기</h2>
  <p>실제 제품을 구매하신 분들의 생생한 후기를 만나보세요!</p>            
  <table class="table table-hover">
    <thead/>
    <tbody>
    <c:forEach items="${lista}" var="b">
      <tr>
        <td>
        	<a href="board_detail?num=${b.num}">
        		${b.title}
        	</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>