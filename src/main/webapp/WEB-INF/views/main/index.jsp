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
    <style>
        .gotop {
            position: fixed;
            bottom: 50px;
            right: 50px;
            width: 40px;
            height: 40px;
            background: url(/pub/images/arrow_top.svg) #76CA9E no-repeat 50% 50%;
            border-radius: 50%;
            font-size: 0;
            z-index: 10;
        }
    </style>
    <link rel="stylesheet" href="${path1}/resources/css/common.css">
    <jsp:include page="../include/head.jsp" />
</head>
<body>
<!-- Header Start -->
<jsp:include page="../include/header.jsp" />
<!-- Header Close -->

<!-- topToggle Start -->
<jsp:include page="./topToggle.jsp" />
<!-- topToggle end -->

<!-- Slider Start -->
<jsp:include page="./section1.jsp" />
<!-- Slider end -->

<!-- section2 start -->
<jsp:include page="./section2.jsp" />
<!-- section2 end -->

<!-- Footer Start -->
<jsp:include page="../include/footer.jsp" />
<!-- Footer Close -->
</body>
</html>