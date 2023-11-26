<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />

<section class="section latest-blog">
    <div class="container">
        <div class="columns is-justify-content-center is-desktop">
            <div class="column is-7-desktop has-text-centered">
                <div class="section-title">
                    <span class="h6 text-color">Latest News</span>
                    <h2 class="mt-4 content-title">Latest articles to enrich knowledge</h2>
                </div>
            </div>
        </div>
        <div class="main-featured">
            <div class="item">
                <h1 class="heading">Media</h1>
                <a href="/media/press/view/1/55" class="article-card">
                    <div class="img">
                        <img src="/upload/press/20231016175231.jpg" alt="">
                    </div>
                    <div class="txt">
                        <div class="tag">
                            <ul>
                                <li>#기업</li>
                                <li>#지속가능경영</li>
                                <li>#사내문화</li>
                            </ul>
                        </div>
                        <div class="heading">우아한청년들-강남구청-딜리버리앤, 1인 취약가구에 기부 물품 전달</div>
                        <div class="date">2023.10.16</div>
                    </div>
                </a>
            </div>
            <div class="item">
                <h1 class="heading">Work</h1>
                <a href="/story/work/view/1/8" class="article-card">
                    <div class="img">
                        <img src="/upload/work/20231005135912.png" alt="">
                    </div>
                    <div class="txt">
                        <div class="tag">
                            <ul>
                                <li>#일하는 방식</li>
                                <li>#청년필진</li>
                            </ul>
                        </div>
                        <div class="heading">구성원을 우주로 데려가는 수상한 법무팀</div>
                        <div class="date">2023.10.05</div>
                    </div>
                </a>
            </div>
            <div class="item">
                <h1 class="heading">Culture</h1>
                <a href="/story/culture/view/1/10" class="article-card">
                    <div class="img">
                        <img src="/upload/culture/20231018170457.gif" alt="">
                    </div>
                    <div class="txt">
                        <div class="tag">
                            <ul>
                                <li>#우청라이프</li>
                            </ul>
                        </div>
                        <div class="heading">띵동- 주문완료 버튼 누르면 일어나는 일들</div>
                        <div class="date">2023.10.05</div>
                    </div>
                </a>
            </div>
        </div>
        <div class="main-peoples animated">
            <img src="https://www.woowayouths.com/assets/img/main/people_01.png" class="img1" alt="">
            <img src="https://www.woowayouths.com/assets/img/main/people_02.png" class="img2" alt="">
            <img src="https://www.woowayouths.com/assets/img/main/people_03.png" class="img3" alt="">
            <img src="https://www.woowayouths.com/assets/img/main/people_04.png" class="img4" alt="">
            <img src="https://www.woowayouths.com/assets/img/main/people_05.png" class="img5" alt="">
            <div class="txt">
                <p>오늘보다 더 나은 교육을 향해<br>출발 준비 완료!</p>
                <strong>우리는 <b>스마트 해법</b> 입니다.</strong>
            </div>
        </div>
        <script>

            $(window).scroll(function(e) {
                var trigger_top = $(window).scrollTop() + $(window).height() - ($(window).height() * .2);
                if (trigger_top >= $('.main-peoples').offset().top) {
                    $('.main-peoples').addClass('animated');
                }
            }).scroll();

        </script>

        <div class="main-doing">
            <div class="section">
                <a href="/business" class="video">
                    <video src="https://www.woowayouths.com/assets/img/main/doing_01.mp4" loop="" muted="" playsinline="" poster="https://www.woowayouths.com/assets/img/main/doing_01_poster.jpg" autoplay=""></video>
                </a>
                <a href="/business" class="txt">
                    <h1 class="heading">All-in-One 인프라</h1>
                    <p>미들마일부터 라스트마일까지<span class="br_tab br_desk"> </span>매끄러운<span class="br_mo"> </span>물류 경험을<span class="br_tab br_desk"> </span>통합적으로 책임집니다.</p>
                </a>
            </div>
            <div class="section">
                <a href="/social/safety" class="video">
                    <video src="https://www.woowayouths.com/assets/img/main/doing_02.mp4" loop="" muted="" playsinline="" poster="https://www.woowayouths.com/assets/img/main/doing_02_poster.jpg" autoplay=""></video>
                </a>
                <a href="/social/safety" class="txt">
                    <h1 class="heading">지속 가능한 물류</h1>
                    <p>일하는 모두의 안전과<span class="br_tab br_desk"> </span>사회적 가치를<span class="br_mo"> </span>생각하는 자세로<span class="br_tab br_desk"> </span>업계를 선도합니다.</p>
                </a>
            </div>
            <div class="section">
                <a href="/story/all" class="video">
                    <video src="https://www.woowayouths.com/assets/img/main/doing_03.mp4" loop="" muted="" playsinline="" poster="https://www.woowayouths.com/assets/img/main/doing_03_poster.jpg" autoplay=""></video>
                </a>
                <a href="/story/all" class="txt">
                    <h1 class="heading">성장하는 사람들</h1>
                    <p>협력과 도전을 통해<span class="br_tab br_desk"> </span>물류의 새로운<span class="br_mo"> </span>기준을<span class="br_tab br_desk"> </span>만들어 나갑니다.</p>
                </a>
            </div>
        </div>
    </div>
</section>
