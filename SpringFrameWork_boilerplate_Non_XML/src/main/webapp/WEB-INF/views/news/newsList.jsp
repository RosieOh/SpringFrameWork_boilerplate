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
<nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9" aria-label="breadcrumbs">
    <ul class="mr-5">
        <li><a href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a>교육 뉴스</a></li>
        <li><a href="${path1}/file/list.do">뉴스</a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">뉴스 상세 보기</p>
</nav>

<div class="container">
    <article class="media">
        <div class="media-content">
            <div class="container mb-80">
                <c:forEach var="url" items="${urls}" varStatus="status" begin="64" end="72"> <%-- 가져온 url중 64-72번째만 나오게한다--%>
                    <br>
                    <div class="columns">
                        <div>
                            <a href="${url}" target="_blank"><span><img src="${img[status.index]}" style="margin-right: 50px;"></span></a>
                        </div>
                        <div class="column">
                            <a href="${url}" target="_blank">   <strong style="color: black;font-size: 30px;font-weight: bold; display: block">${titles[status.index]}</strong></a>
                            <small>${regdates[status.index]}</small>
                        </div>
                    </div>
                    <br>
                    <p class="mb-30" style="margin-top:10px">
                        <a href="${url}" target="_blank">
                        </a>
                            ${contents[status.index]}..<a href="${url}" style="color: black">더보기</a>
                    <hr>
                    </p>
                </c:forEach>
            </div>
        </div>
    </article>
</div>
<!-- Footer Start -->
<jsp:include page="../include/footer.jsp" />
<!-- Footer Close -->
</body>
</html>