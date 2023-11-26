<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="/pro3_war" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>업로드된 파일 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container is-fullhd">
	<!-- 헤더 부분 인클루드 -->
	<jsp:include page="../include/hd.jsp"></jsp:include>
	<figure class="visual" id="vs1">
		<ul class="imgbox">
			<li class="hero is-medium is-link">
				<div class="hero-body">
					<p class="title">
						Medium hero
					</p>
					<p class="subtitle">
						Medium subtitle
					</p>
				</div>
			</li>
		</ul>
	</figure>
	<div class="content" id="contents">
	    <div class="row column text-center">
	      <h2 class="h1">자료실 목록</h2>
	      <hr>
	      <div class="container">
			  <c:if test="${not empty fileList}">
				  <table class="table table-active">
				  <thead>
				  	<tr>
						<th>순번</th>
						<th>글번호</th>
						<th>파일경로</th>
						<th>크기</th>
						<th>업로드 날짜</th>
					</tr>
				  </thead>
				  <tbody>
				  <c:forEach var="fileobj" items="${fileList}">
						  <tr class="table-info">
							  <td>${fileobj.no}</td>
							  <td>${fileobj.postNo}</td>
							  <td>${fileobj.saveFile}</td>
							  <td>${fileobj.fileSize}</td>
							  <td>${fileobj.uploadDate}</td>
						  </tr>
				  </c:forEach>
				  </tbody>
				  </table>
			  </c:if>
		  </div>
	    </div>
	</div>
	<!-- 푸터 부분 인클루드 -->
	<jsp:include page="../include/ft.jsp"></jsp:include>
</div>
</body>
</html>