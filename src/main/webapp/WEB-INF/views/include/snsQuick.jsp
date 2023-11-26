<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />

<%-- 필요한 css, js 임포트 --%>
<link rel="stylesheet" href="${path1}/resources/css/snsQuick.css">
<script src="${path1}/resources/js/snsQuick.js"></script>
<%-- 필요한 css, js 임포트 끝--%>

<div class="snsQuick">
    <div class="snsInner toggleWrap">
        <span class="circleAni c1"></span>
        <span class="circleAni c2"></span>
        <span class="circleAni c3"></span>
        <a href="javascript:void(0)" class="btn sns_btn flex ac" onclick="toggleClass(this)"><i class="xi xi-share-alt-o"></i></a>
        <div class="sns hover">
            <ul class="list flex vc">
                <li class="nb"><a href="https://blog.naver.com/gilbutac" target="_blank" class="in flex ac"><i class="xi xi-naver"></i><i class="tt">NAVER 블로그</i></a></li>
                <li class="nc"><a href="https://cafe.naver.com/gilbutqna" target="_blank" class="in flex ac"><i class="xi xi-cafe"></i><i class="tt">NAVER 카페</i></a></li>
                <li class="ts"><a href="https://gilbutacademy.tistory.com/" target="_blank" class="in flex ac"><i class="xi ico"><img src="../images/inc/sns_tistoryB.svg?v=0.0244"></i><i class="tt">TISTORY</i></a></li>
                <li class="ka"><a href="https://pf.kakao.com/_bVxjxoE" target="_blank" class="in flex ac"><i class="xi xi-kakaotalk"></i><i class="tt">카카오상담</i></a></li>
            </ul>
        </div>
    </div>
    <a href="javascript:goTop();" class="btn top_btn flex ac"><span><i class="xi xi-angle-up-thin"></i><i class="tt ffEN">TOP</i></span></a>
</div>