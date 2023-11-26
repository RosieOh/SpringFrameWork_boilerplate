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
<div class="content" id="contents">
    <div class="row column text-center">
        <h2 class="h1">파일 자료 등록</h2>
        <hr>
        <div class="container">
            <form method="post" enctype="multipart/form-data" action="${path1}/file/fileupload1.do">
                <div class="control">
                    <label for="title">제목</label> <input type="text" name="title" id="title" class="input" required>
                </div>
                <div class="control">
                    <label for="content">내용</label><br>
                    <textarea name="content" id="content" class="textarea" required></textarea>
                </div>
                <div class="control">
                    <label for="file1" class="file-label">
                        <span style="padding: 5px; margin: 5px">파일1 : </span>
                        <input type="file" name="file1" id="file1" class="file-input" required>
                        <span class="file-cta">
                            <span class="file-icon">
                                <i class="fas fa-upload"></i>
                            </span>
                            <span class="file-label">
                                <span id="file1Name">Choose a file...</span>
                            </span>
                        </span>
                    </label>
                </div>
                <div class="control">
                    <label for="file2" class="file-label">
                        <span style="padding: 5px; margin: 5px">파일2 : </span>
                        <input type="file" name="file2" id="file2" class="file-input">
                        <span class="file-cta">
                            <span class="file-icon">
                                <i class="fas fa-upload"></i>
                            </span>
                            <span class="file-label">
                                <span id="file2Name">Choose a file...</span>
                            </span>
                        </span>
                    </label>
                </div>
                <div class="control">
                    <label for="file3" class="file-label">
                        <span style="padding: 5px; margin: 5px">파일3 : </span>
                        <input type="file" name="file3" id="file3" class="file-input">
                        <span class="file-cta">
                            <span class="file-icon">
                                <i class="fas fa-upload"></i>
                            </span>
                            <span class="file-label">
                                <span id="file3Name">Choose a file...</span>
                            </span>
                        </span>
                    </label>
                </div>
                <div class="button-group">
                    <input type="submit" value="파일 업로드" class="button is-info">
                    <a href="${path1}/file/filelist1.do" class="button is-primary">파일 자료 목록</a>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Content Close -->

<!-- Add Bootstrap JS and jQuery script links here -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 파일 선택 시 파일 이름을 표시하는 함수
    function updateFileName(input, targetElement) {
        var fileName = input.value.split('\\').pop(); // 파일 경로에서 파일 이름 추출
        targetElement.textContent = fileName;
    }

    // 파일 선택 시 파일 이름 업데이트
    $('#file1').change(function() {
        updateFileName(this, document.getElementById('file1Name'));
    });

    $('#file2').change(function() {
        updateFileName(this, document.getElementById('file2Name'));
    });

    $('#file3').change(function() {
        updateFileName(this, document.getElementById('file3Name'));
    });
</script>

<!-- Footer Start -->
<jsp:include page="../include/footer.jsp" />
<!-- Footer Close -->
</body>
</html>
