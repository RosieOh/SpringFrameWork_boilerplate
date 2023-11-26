<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>해법학원</title>
    <jsp:include page="../include/head.jsp" />
</head>
<body>
<!-- Header Start -->
<jsp:include page="../include/header.jsp" />
<!-- Header Close -->

<!-- Slider Start -->
<jsp:include page="boardBanner.jsp"/>
<!-- Slider end -->

<div class="content" id="content">
    <div class="row column text-center">
        <h2 class="h1">공지사항 목록</h2>
        <hr>
        <div class="container">
            <table>
                <thead>
                <tr>
                    <th width="80">No</th>
                    <th>Title</th>
                    <th width="120">RegDate</th>
                    <th width="100">Visited</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${boardList }" var="board" varStatus="status">
                    <tr>
                        <td>${status.count }</td>
                        <td><a href="${path1}/board/detail.do?bno=${board.bno }">${board.title }</a></td>
                        <td>
                            <fmt:parseDate value="${board.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                        </td>
                        <td>${board.visited }</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <%-- <c:if test='${sid eq "admin"}'>  --%>
            <div class="button-group">
                <a class="button" href="${path1 }/board/insert.do">글쓰기</a>
            </div>
            <%-- </c:if> --%>
        </div>

    </div>
</div>
</div>

<!-- Footer Start -->
<jsp:include page="../include/footer.jsp" />
<!-- Footer Close -->
</body>
</html>