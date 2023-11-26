<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path3" value="${pageContext.servletContext.contextPath }" />

<footer class="ft" id="ft">
    <div class="ft_wrap">
        <nav class="ft_link">
            <ul class="fnb">
                <li><a href="">제휴문의</a></li>
                <li><a href="">개인정보처리방침</a></li>
                <li><a href="">이용약관</a></li>
                <li><a href="">이메일무단수집거부</a></li>
            </ul>
            <ul class="snb">
                <%--<li><a href="https://www.facebook.com/geniaAcademyManager">소셜2</a></li>--%>
                <li>
                    <a href="https://www.instagram.com/canmoreapdalisal/" target="_blank">
                        <i class="xi-instagram"></i>
                    </a>
                </li>
                <li>
                    <a href="https://www.facebook.com/geniaAcademyManager" target="_blank">
                        <i class="xi-facebook"></i>
                    </a>
                </li>
                <li>
                    <a href="https://blog.naver.com/chunjae2023" target="_blank">
                        <i class="xi-naver"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <script>
            function loc() {
                var url = document.getElementById("sel").value;
                if (url != "") {
                    var win = window.open(url);
                }
            }
        </script>
    </div>
    <div class="ft_wrap2">
        <p class="copyright">
            <span>(주)TeamLimked</span>
            <span>서울시 금천구 가산로9길 54</span>
            <span>대표자 오태훈</span>
            <span>사업자등록번호 123-45-678910</span>
            <span>통신판매신고번호 제18-439호</span>
            <span class="end">부가통신사업신고 016712</span>
        </p>
        <p class="copyright">
            <span>윜 (Week) 1577-0902</span>
            <span>위클리 (Weekly) 1577-0218</span>
            <span>위켄드 (Weekend) 1577-6226</span>
            <span>윜마켓 (WeekMarket) 1577-1533</span>
        </p>
        <p class="locate">
            <select name="sel" id="sel" onchange="loc()">
                <option value="">FAMILY LINK</option>
                <option value="https://chunjaetext.co.kr/">위클리</option>
                <option value="http://www.milkt.co.kr/Main/Main_new">위켄드</option>
                <option value="http://www.prinpia.co.kr/">윜마켓</option>
            </select>
        </p>
        <p class="cp">COPYRIGHT 1981-2023 Week EDUCATION INC. ALL RIGHTS RESERVED.</p>
    </div>
</footer>
