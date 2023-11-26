<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />

<header class="navigation" style="background: linear-gradient(to right, #71AEE8, #77E9CE);">

  <%-- header 네비게이션 --%>
    <div class="header-top">
      <div class="container" style="padding: 9px 15px">
        <div class="columns is-gapless is-justify-content-space-between is-align-items-center">
          <div class="column is-6-desktop is-4-tablet has-text-left-desktop has-text-centered-mobile">
          </div>
          <div class="column is-6-desktop is-8-tablet">
            <div class="header-top-right has-text-right-tablet has-text-centered-mobile">
              <c:if test="${sid.equals('admin')}">
                <a href="${path1}/admin/">
                  <i class="icofont-login has-text-white" style="color: red; font-weight: bold;"> 관리자페이지</i>
                </a>
              </c:if>
              <c:if test="${empty sid }">
                <a href="${path1 }/member/login.do">
                  <i class="icofont-login has-text-white"> 로그인</i>
                </a>
                <a href="${path1 }/member/term.do">
                  <i class="icofont-user has-text-white"> 회원가입</i>
                </a>
              </c:if>
              <c:if test="${!empty sid && !sid.equals('admin') }">
                <a href="${path1 }/member/mypage.do">
                  <i class="icofont-login has-text-white"> 마이페이지</i>
                </a>
                <a href="${path1 }/course/mypageCourse?complete=0">
                  <i class="icofont-ui-clip-board has-text-white"> 학습 현황</i>
                </a>
              </c:if>
              <c:if test="${!empty sid}">
                <a href="${path1 }/member/logout.do">
                  <i class="icofont-login has-text-white"> 로그아웃</i>
                </a>
              </c:if>
              <a href="${path1 }/contact">
                <i class="icofont-google-map has-text-white"> 오시는길</i>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <nav id="navbar" class="navbar main-nav">
      <div class="container">
        <div class="navbar-brand">
          <a class="navbar-item" href="${path1}/Home">
            <img src="${path1}/resources/images/haebeop.png" alt="logo">
          </a>
          <button role="button" class="navbar-burger burger" data-hidden="true" data-target="navigation">
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
          </button>
        </div>

        <div class="navbar-menu mr-0" id="navigation">
          <ul class="navbar-start" style="flex-grow: 1; justify-content: center;">
            <li class="navbar-item has-dropdown is-hoverable">
              <a class="navbar-link">수강</a>
              <div class="navbar-dropdown">
                <a class="navbar-item" href="${path1}/course/list.do">수강신청</a>
                <a class="navbar-item" href="${path1}/course/schedule.do">개강일정</a>
                <a class="navbar-link" href="${path1}/video/list.do" style="height:47.9px;">시범강의</a>
              </div>
            </li>

            <li class="navbar-item has-dropdown is-hoverable">
              <a class="navbar-link">학부모를 위한 공간</a>
              <div class="navbar-dropdown">
                <a class="navbar-link" href="${path1}/news/list.do" style="height:47.9px;">교육 뉴스</a>
              </div>
            </li>

            <li class="navbar-item has-dropdown is-hoverable">
              <a class="navbar-link">커뮤니티</a>
              <div class="navbar-dropdown">
                <a class="navbar-item" href="${path1}/notice/list.do">공지사항</a>
                <a class="navbar-item" href="${path1}/faq/list.do">자주 묻는 질문</a>
                <a class="navbar-item" href="${path1}/review/list.do">후기</a>
              </div>
            </li>

            <li class="navbar-item has-dropdown is-hoverable">
              <a class="navbar-link">자료실</a>
              <div class="navbar-dropdown">
                <a class="navbar-link" href="${path1}/file/list.do" style="height:47.9px;">자료실</a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>
</header>
