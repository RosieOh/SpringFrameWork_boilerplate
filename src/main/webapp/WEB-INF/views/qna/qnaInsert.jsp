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
    <jsp:include page="./include/head.jsp" />
</head>
<body>
<!-- Header Start -->
<jsp:include page="./include/header.jsp" />
<!-- Header Close -->

<!-- Slider Start -->
<section class="slider">
    <div class="container">
        <div class="columns is-justify-content-center">
            <div class="column is-9-desktop is-10-tablet">
                <div class="block has-text-centered">
                    <span class="is-block mb-4 text-white is-capitalized">Small help can make change</span>
                    <h1 class="mb-5">New hope for <br>near future</h1>
                    <p class="mb-6">Your small contribution means a lot. Natus officia amet <br>accusamus repellat magni reprehenderit dolorem.</p>
                    <a href="#" target="_blank" class="btn btn-main is-rounded">Donate Now</a>
                </div>
            </div>
        </div>
    </div>
</section>

<section>
    <div class="container">
        <div class="column">
            <div class="column lg-12">
                <div class="section-divider"></div>
            </div>
        </div>
    </div>
</section>

<!-- Section About End -->
<div class="cta-block section">
    <div class="container">
        <div class="columns is-justify-content-center ">
            <div class="column is-7-desktop is-12-tablet">
                <div class="cta-content has-text-centered">
                    <i class="icofont-diamond text-lg text-color"></i>
                    <h2 class="text-white text-lg mb-6 mt-4">We can’t help everyone, but everyone can help someone</h2>
                    <a href="donation.html" class="btn btn-main is-rounded">Make a donation</a>
                </div>
            </div>
        </div>
    </div>
</div>

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

        <div class="columns is-multiline is-justify-content-center">
            <div class="column is-4-desktop is-6-tablet">
                <div class="blog-item">
                    <img src="${path1}/resources/images/blog/blog_1.jpg" alt="" class="">

                    <div class="card-body mt-2">
                        <span class="text-sm text-color is-uppercase has-text-weight-bold">January 3, 2019</span>
                        <h3 class="mb-3"><a href="blog-single.html" class="">We can make a difference in families lives</a></h3>
                        <p class="mb-4">Aspernatur obcaecati unde, quasi nihil neque, voluptatem. Consectetur.</p>
                    </div>
                </div>
            </div>

            <div class="column is-4-desktop is-6-tablet">
                <div class="blog-item">
                    <img src="${path1}/resources/images/blog/blog_2.jpg" alt="" class="">

                    <div class="card-body mt-2">
                        <span class="text-sm text-color is-uppercase has-text-weight-bold">January 3, 2019</span>
                        <h3 class="mb-3"><a href="blog-single.html" class="">A place where start new life with peace</a></h3>
                        <p class="mb-4">Aspernatur obcaecati unde, quasi nihil neque, voluptatem. Consectetur.</p>
                    </div>
                </div>
            </div>

            <div class="column is-4-desktop is-6-tablet">
                <div class="blog-item">
                    <img src="${path1}/resources/images/blog/blog_3.jpg" alt="" class="">

                    <div class="card-body mt-2">
                        <span class="text-sm text-color is-uppercase has-text-weight-bold">January 3, 2019</span>
                        <h3 class="mb-3"><a href="blog-single.html" class="">Build school for poor childrens</a></h3>
                        <p class="mb-4">Aspernatur obcaecati unde, quasi nihil neque, voluptatem. Consectetur.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer Start -->
<jsp:include page="./include/footer.jsp" />
<!-- Footer Close -->
</body>
</html>