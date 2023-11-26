<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인</title>
    <jsp:include page="../include/head.jsp" />

    <script async type="text/javascript" src="${path1 }/resources/js/bulma.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Bulma Version 0.9.0-->
    <link rel="stylesheet" href="https://unpkg.com/bulma@0.9.4/css/bulma.min.css" />
    <link rel="stylesheet" type="text/css" href="${path1 }/resources/css/admin.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');
        *{font-family: 'Nanum Gothic Coding', monospace;}
        .card-header { color:#00A2FF; font-size: 1.2em; margin: 0 auto; }
        .container { margin-top: 20px; }
        .title, .hero, .hero, .welcome, .subtitle{font-family: 'Nanum Gothic Coding', monospace;font-weight: 700;}
    </style>
</head>
<body>
<jsp:include page="../include/header.jsp" />
<div class="container">
    <div class="columns">
        <div class="column is-3 ">
            <%-- 관리자 네비게이션 바 --%>
            <jsp:include page="../include/adminPageNav.jsp" />
        </div>
        <div class="column is-9">
            <section class="hero is-info welcome is-small">
                <div class="hero-body">
                    <div class="container">
                        <h1 class="title">
                            관리자 페이지
                        </h1>
                        <h2 class="subtitle">

                        </h2>
                    </div>
                </div>
            </section>
            <div class="columns">
                <div class="column is-6">
                    <div class="card events-card">
                        <header class="card-header">
                            총 회원 수
                        </header>
                        <div>
                            <p style="font-size: 2em; text-align: center;">
                                ${totUser} 명
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp" />
</body>
</html>
