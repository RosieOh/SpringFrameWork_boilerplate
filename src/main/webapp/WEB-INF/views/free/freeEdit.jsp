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
    <script type="text/javascript" src="${path1 }/resources/ckeditor/ckeditor.js"></script>
    <jsp:include page="../include/head.jsp" />
</head>
<!-- Header Start -->
<jsp:include page="../include/header.jsp" />
<!-- Header Close -->

<div class="container is-fullhd">
    <div class="columns">
        <div class="column is-2">
            <aside class="menu">
				<span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5">
					커뮤니티
				</span>
                <ul class="menu-list">
                    <li>
                        <a href="${path1}/free/list.do">자유게시판</a>
                    </li>
                    <li>
                        <a href="${path1}/booktalk/list.do">교재게시판</a>
                    </li>
                </ul>
            </aside>
        </div>
        <div class="column is-10">
            <div class="conwrap">
                <div class="box">
                    <span class="title">자유게시판</span>
                </div>
            </div>

            <div class="formwrap">
                <form action="${path1 }/free/edit.do" method="post">
                    <div class="field">
                        <label class="label" for="title">제목</label>
                        <div class="control">
                            <input type="hidden" name="fno" id="fno" value="${dto.fno }" >
                            <input type="text" name="title" id="title" class="input" value="${dto.title }" maxlength="98" required>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label" for="content">내용</label>
                        <textarea name="content" class="textarea" id="content" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required>
                            ${dto.content }
                        </textarea>
                        <script>
                            CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path1}/free/imageUpload.do'});
                        </script>
                    </div>
                    <button type="submit" class="button post-btn">글 수정</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Footer Start -->
<jsp:include page="../include/footer.jsp" />
<!-- Footer Close -->
</body>
</html>