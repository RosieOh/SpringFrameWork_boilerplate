<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />

<a href="javascript:void(0);" class="gotop" style="cursor: pointer;">맨위로</a>
<script>
    // gotop
    $(".gotop").css("cursor", "pointer").click(function(){
        $('body, html').animate({scrollTop:0}, 500);
    });
</script>