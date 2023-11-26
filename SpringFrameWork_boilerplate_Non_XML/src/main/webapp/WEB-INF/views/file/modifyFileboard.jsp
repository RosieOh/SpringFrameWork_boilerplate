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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료실</title>
    <jsp:include page="../include/head.jsp" />
    <!-- Add Bootstrap CSS link here -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<!-- Header Start -->
<jsp:include page="../include/header.jsp" />
<!-- Header Close -->

<!-- Slider Start -->
<jsp:include page="fileBanner.jsp"/>
<!-- Slider end -->

<!-- Content Start -->
<style>
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');
    *{font-family: 'Nanum Gothic Coding', monospace;}
    .h2{font-weight: 400;line-height: 110px;text-align: center;font-size: 1.75em;margin-bottom: 0.5714em;}
    .button {text-decoration: none;border-radius: 20px;margin: 15px;padding: 10px;float: right;background-color: #008CD6;border-color: #008CD6;color: #ffffff;}
    .button3 {text-decoration: none;border-radius: 20px;margin: 15px;padding: 10px;float: right;background-color: #FF968A;border-color: #FF968A;color: #ffffff;}
    .column1 {text-align: center;display: block;flex-basis: 0;flex-grow: 1;flex-shrink: 1;padding: 0.75rem;}
</style>

<nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9" aria-label="breadcrumbs">
    <ul class="mr-5">
        <li><a style="color: black;" href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a style="color: black;">자료실</a></li>
        <li><a style="color: black; "href="${path1}/file/list.do">수정하기</a></li>
    </ul>
</nav>
<div class="container is-fullhd">
    <div class="content" id="contents">
        <div class="row column1 text-center">
            <h2 class="h2">파일 자료 수정하기</h2>
            <hr>
            <div class="container">
                <form enctype="multipart/form-data" method="post" action="${path1}/file/modifyFileboard.do">
                    <input type="hidden" name="postNo" value="${postNo}" />
                    <table id="table1">
                        <tbody>
                        <tr>
                            <th style="background-color:#dcdcdc">제목 </th>
                            <td>
                                <input type="hidden" name="no" id="no" value="${fileboard.fileBoard.title}">
                                <input type="text" name="title" id="title" class="input" placeholder="제목 입력" value="${fileboard.fileBoard.title}" maxlength="98" required>
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">내용</th>
                            <td>
                                <textarea name="content" class="textarea" id="content" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required>${fileboard.fileBoard.content}</textarea>
                                <script>
                                    CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path1}/file/imageUpload.do'});
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">내용</th>
                            <td>
                                <div class="control" style="text-align: left;">
                                    <h4 class="has-text-weight-bold">현재 파일</h4>
                                    <c:forEach var="file" items="${fileboard.fileList}">
                                        <a href="${path1}/resources/upload/${file.originFile}" title="${file.fileSize}" download>${file.originFile}</a>
                                        <button type="button" class="remove_btn" style="display:inline-block;padding:0;background-color: black;color:#fff;width:18px;height:18px;font-size:12px;line-height:18px;text-align:center;border-radius:10px;" data1="${file.no}" data2="${file.postNo}">x</button><br>
                                    </c:forEach>
                                    <c:if test="${empty fileboard.fileList}">
                                        첨부된 파일이 없습니다.
                                    </c:if>
                                </div>
                                <br>
                                <br>
                                <h4 class="has-text-weight-bold" style="text-align: left">새로운 파일</h4>
                                <div class="control">
                                    <label for="file1" class="file-label">
                                        <span style="padding: 5px; margin: 5px">파일1 : </span>
                                        <input type="file" name="file1" id="file1" class="file-input" required>
                                        <span class="file-cta">
                                                <span class="file-icon">
                                                    <i class="fas fa-upload"></i>
                                                </span>
                                                <span class="file-label">
                                                    <span id="file1Name">파일을 첨부해주세요</span>
                                                </span>
                                            </span>
                                    </label>
                                </div>
                                <div class="control">
                                    <label for="file2" class="file-label">
                                        <span style="padding: 5px; margin: 5px">파일2 : </span>
                                        <input type="file" name="file2" id="file2" class="file-input" required>
                                        <span class="file-cta">
                                                    <span class="file-icon">
                                                        <i class="fas fa-upload"></i>
                                                    </span>
                                                <span class="file-label">
                                                    <span id="file2Name">파일을 첨부해주세요</span>
                                                </span>
                                            </span>
                                    </label>
                                </div>
                                <div class="control">
                                    <label for="file3" class="file-label">
                                        <span style="padding: 5px; margin: 5px">파일3 : </span>
                                        <input type="file" name="file3" id="file3" class="file-input" required>
                                        <span class="file-cta">
                                                    <span class="file-icon">
                                                        <i class="fas fa-upload"></i>
                                                    </span>
                                                <span class="file-label">
                                                    <span id="file3Name">파일을 첨부해주세요</span>
                                                </span>
                                            </span>
                                    </label>
                                    <script>
                                        document.getElementById('file1').addEventListener('change', function () {
                                            document.getElementById('file1Name').textContent = this.files[0].name;
                                        });

                                        document.getElementById('file2').addEventListener('change', function () {
                                            document.getElementById('file2Name').textContent = this.files[0].name;
                                        });

                                        document.getElementById('file3').addEventListener('change', function () {
                                            document.getElementById('file3Name').textContent = this.files[0].name;
                                        });
                                    </script>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" class="button3" value="수정" >
                                <a class="button" href="${path1 }/file/list.do">목록으로</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>