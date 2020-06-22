<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
           prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>슬기로운 차박생활</title>
    <link href="/css/community.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <script type="text/javascript" src=" http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="/js/reviewScript.js" charset='UTF-8'></script>
    <script>
        function like() {
            var img = document.getElementById("like-img");
            img.src = "/img/community/heart2.png"
        }
    </script>

<body>
<!-- header -->
<hr>
<br>
<div class="container">
    <div class="top">
        <h1>커뮤니티</h1>
    </div>
    <div class="search">
        <input type="text" class="search_text" placeholder=" 지역 검색">
        <button type="submit" class="search_but"></button>
    </div>
    <!-- 글쓰기, 정렬 버튼 -->
    <div class="second">
        <div class="insert">
            <button type="submit" onclick="location.href='/review/writeForm'">글쓰기</button>
        </div>
        <div class="sort" onchange="ajaxReviewList()">
            <select id="sortType" name="sortType">
                <option value="regDate">최신 순</option>
                <option value="likeCount">좋아요 순</option>
                <option value="replyCount">댓글 많은 순</option>
            </select>
        </div>
    </div>

    <%--리뷰글 원형 시작--%>
    <%--            원형 복사시 수정할 부분: #dummy-review(id),#writer-id(value),#review-img(src,onclick) #review-content(value)--%>
    <div class="review" id="dummy-review" style="display: none">
        <div class="profile">
            <div class="thumbnail-wrapper">
                <div class="thumbnail">
                    <div class="centered">
                    </div>
                </div>
            </div>
            <div class="writer">
                    <span class="writer-id">

                    </span>
            </div>
        </div>
        <div class="content">

            <div class="review-img">

                <img src=""
                     onclick="">
            </div>
            <div class="review-content">
                <div class="content-title">

                </div>
                <div class="content-icon">
                    <button class="like-img"><img id="like-img" src="/img/community/heart.png"
                                                  onclick="like()"></button>
                    <button class="comment-img"><img src="/img/community/comment.png"></button>
                </div>
            </div>

        </div>
    </div>
    <%-- 리뷰글 원형 끝           --%>

<%--    reviewListDiv 시작--%>
    <div style="margin-top: 170px;" id="reviewListDiv">
        <!-- 게시글 리스트 -->
        <c:forEach var="review" items="${reviewList}">


            <div class="review">
                <div class="profile">
                    <div class="thumbnail-wrapper">
                        <div class="thumbnail">
                            <div class="centered">
                            </div>
                        </div>
                    </div>
                    <div class="writer">
                    <span class="writer-id">
                        id:${review.id}
                    </span>
                    </div>
                </div>
                <div class="content">

                    <div class="review-img">

                        <img src="${review.titleImageSrc}"
                             onclick="location.href='/review/detail?reviewNo=${review.reviewNo}'">
                    </div>
                    <div class="review-content">
                        <div class="content-title">

                                <%--                    [강원도][동해시] 망상 오토 캠핑장--%>
                            [${review.sido}][${review.gugun}] ${review.title}
                        </div>
                        <div class="content-icon">
                            <button class="like-img"><img id="like-img${review.reviewNo}" src="/img/community/heart.png"
                                                          onclick="like()"></button>
                            <button class="comment-img"><img src="/img/community/comment.png"></button>
                        </div>
                    </div>

                </div>
            </div>
        </c:forEach>
    </div>
    <%--    reviewListDiv 끝--%>
</div>
<%--/container--%>

</div>
</div>
</body>
</html>