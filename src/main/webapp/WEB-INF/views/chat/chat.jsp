<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅 테스트</title>
    <jsp:include page="../include/head.jsp" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/header.jsp"></jsp:include>

    <nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9"
         aria-label="breadcrumbs">
        <ul class="mr-5">
            <li><a href="${path1}"><i class="xi-home is-size-3"></i></a></li>
            <li><a>자료실</a></li>
            <li><a href="${path1}/file/list.do">자료실</a></li>
        </ul>
        <p class="title has-text-centered mt-1 mb-2">자료실</p>
    </nav>

    <div class="contents">
        <nav aria-label="You are here:" role="navigation">
            <ul class="breadcrumbs">
                <li><a href="#">Home</a></li>
                <li><a href="#">Chat</a></li>
                <li>
                    <span class="show-for-sr">Current: </span> Chat
                </li>
            </ul>
        </nav>
        <h2 class="title">Chatting Page</h2>
        <div class="container" id="chat-area">
            <div class="box" style="max-height: 400px; overflow-y: auto;">
                <div id="msg"></div>
            </div>
            <div class="field is-grouped">
                <div class="control is-expanded">
                    <input type="text" id="testInput" class="input" placeholder="메시지 입력">
                </div>
                <div class="control">
                    <button type="button" id="btn" class="button is-primary">전송</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        var ws = new WebSocket("ws://localhost:8080/pro04_1_war/socket");
        ws.onopen = function (e) {
            console.log("info : connection opened.");
        }
        ws.onmessage = function (e) {
            console.log(e.data);
            $("#msg").append("<p>" + e.data + "</p>");
        }
        ws.onclose = function (e) {
            console.log("info : connection closed");
        };
        ws.onerror = function (e) {
            console.log("error")
        };
        $("#btn").on("click", function (e) {
            e.preventDefault();
            ws.send($("#testInput").val());
        });
    });
</script>
</body>
</html>
