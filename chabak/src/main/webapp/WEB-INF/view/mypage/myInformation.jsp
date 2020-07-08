<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <link href="/css/myInformation.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oldenburg&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <%--    session   --%>
    <style>
        button {
            float: left;
        }
    </style>
</head>

<body>
<div class="wrap">
    <!-- header -->
    <div id="header">
        <jsp:include page="/header"/>
    </div>
    <hr class="top_hr">
    <br>
    <div class="container">
        <div class="top">
            <!-- 클릭 시 프로필 수정 페이지 이동-->
            <div class="thumbnail-wrapper">
                <div class="thumbnail">
                    <div id="View_area" class="centered">
                        <!-- 방문 id가 세션 id랑 비교해서 같으면 나의 프로필 사진을 / 아니면 click id 프로필 선택 -->
                        <c:choose>
                            <c:when test="${empty visitor.id}">
                                <img src="${member.savePath}${member.saveName}">
                            </c:when>
                            <c:when test="${sessionScope.id ne visitor.id}">
                                <img src="${visitor.savePath}${visitor.saveName}">
                            </c:when>
                            <c:otherwise>
                                <img src="${member.savePath}${member.saveName}"><!-- 다른사람 계정에서 내 아이디 클릭한 경우 -->
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>

                <div> <!-- todo: 프로필 사진 옆 팔로우/팔로잉 버튼 -->
                    <button id="btn_profile_follow" style="display: none;"></button>
                </div>

                <div class="sessionId" id="pageOwnerId">
                    <!-- 방문 id가 세션 id랑 비교해서 같으면 나의 id를 / 다르면 click id를 선택 -->
                    <c:choose>
                        <c:when test="${empty visitor.id}">
                            <button class="updateMember"
                                    onclick="location.href='/member/memberUpdate?id=${sessionScope.id}';">
                                <span class="spanId">${sessionScope.id}</span></button>
                        </c:when>
                        <c:when test="${sessionScope.id ne visitor.id}">
                            <button class="updateMember"><span class="spanId">${visitor.id}</span></button>
                        </c:when>
                        <c:otherwise>
                            <button class="updateMember"
                                    onclick="location.href='/member/memberUpdate?id=${sessionScope.id}';">
                                <span class="spanId">${sessionScope.id}</span></button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div class="button_menu">
            <!--게시글 수 보이게, 클릭시 자기가 작성한 리뷰글 조회 + 게시글 수 추가-->
            <button type="button" id="">
                게시글
            </button>
            <!-- 팔로워 버튼 본인 id인 경우, 방문자 id인 경우 -->
            <c:choose>
                <c:when test="${empty visitor.id}">
                    <button type="button" id="follower" onclick="followList('${sessionScope.id}', 'follower')">팔로워
                    </button>
                </c:when>
                <c:when test="${sessionScope.id ne visitor.id}">
                    <button type="button" id="follower" onclick="followList('${visitor.id}', 'follower')">팔로워</button>
                </c:when>
                <c:otherwise>
                    <button type="button" id="follower" onclick="followList('${sessionScope.id}', 'follower')">팔로워
                    </button>
                </c:otherwise>
            </c:choose>

            <img class="but_img" src="/img/mypage/following.png">
            <!-- 팔로잉 버튼 본인 id인 경우, 방문자 id인 경우 -->
            <c:choose>
                <c:when test="${empty visitor.id}">
                    <button type="button" id="following" onclick="followList('${sessionScope.id}', 'following')">팔로잉
                    </button>
                </c:when>
                <c:when test="${sessionScope.id ne visitor.id}">
                    <button type="button" id="following" onclick="followList('${visitor.id}', 'following')">팔로잉</button>
                </c:when>
                <c:otherwise>
                    <button type="button" id="following" onclick="followList('${sessionScope.id}', 'following')">팔로잉
                    </button>
                </c:otherwise>
            </c:choose>

            <!--숫자 클릭시 팔로잉한 id 조회 리스트(팔로워 수 1000단위 k표현 1000000단위 m표현-->
        </div>
        <div class="content">
            <div class="listForm" id="selectedPosition"> <!-- follower, following 리스트 출력 위치-->

            </div>
        </div>
    </div>
    <div class="footer">
        <img src="/img/footer/footer.png">
    </div>
</div>

<jsp:include page="/WEB-INF/view/mypage/myInfoFrame.jsp"/>
<script type="text/javascript" src=" http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/js/myInfo.js" charset="UTF-8"></script>
<script type="text/javascript" src="/js/follow_method.js"></script>
</body>
</html>
