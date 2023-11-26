<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.servletContext.contextPath}" />

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

<div class="content" id="contents">
    <div class="row column text-center">
        <h2 class="h1">공지사항 글쓰기</h2>
        <hr>
        <div class="container">
            <form action="${path1}/board/insert.do" method="post">
                <table id="table1">
                    <tbody>
                    <tr>
                        <th style="background-color:#dcdcdc">글 제목</th>
                        <td>
                            <input type="text" name="title" id="title" placeholder="제목 입력" maxlength="98" required>
                        </td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">글 내용</th>
                        <td>
                            <!-- 'content' textarea for CKEditor -->
                            <textarea name="content" id="content" rows="8" cols="100" required></textarea>
                            <script>
                                CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path1}/board/imageUpload.do'});
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" class="submit success button" value="글 등록">
                            <a class="button" href="${path1}/board/list.do">글 목록</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>

<!-- Footer Start -->
<jsp:include page="../include/footer.jsp" />
<!-- Footer Close -->
</body>
</html>
