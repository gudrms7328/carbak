<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
           prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>쪽지 보내기</title>
    <link href="/css/message_write.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <script type="text/javascript" src=" http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="/js/common.js" charset='UTF-8'></script>


</head>
<script>

    function beforeSubmit() {

        if($("#receiveId").val()==''){
            alert('보낼 아이디를 입력하세요.');
            return false;
        }
        if($("#title").val()==''){
            alert('제목을 입력하세요.');
            return false;
        }
        if($("#content").val()==''){
            alert('내용을 입력하세요.');
            return false;
        }
        alert("쪽지가 작성되었습니다.");
        return true;
    }

    function openSearchIdWindow() {
        window.open("/message/searchId", "아이디 검색", "left=900, width=500, height=300, toolbar=no, menubar=no, scrollbars=no, resizable=no" );
    }

    function openAddressIdWindow(){
        window.open("/message/address", "쪽지 주소록", "left=900, width=500, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=no" );
    }
</script>
<body>
<div class="container">
    <div class="top">
        <h1>쪽지 쓰기</h1>
    </div>
    <div>
        <form action ="/message/write" method="POST" id="writeMessageForm" onsubmit="return beforeSubmit();">
            <div class="message">
                <div class="receiveIdDiv">
                    <input type="text" name="receiveId" id="receiveId" placeholder="보낼 아이디를 입력하세요." value="${receiveId}" onkeyup="checkLengthValidate(this, 50)" >

                    <button type="button" class="search_but" onclick="openSearchIdWindow()" value="아이디 검색"></button>
<%--                    <input type="button" onclick="openAddressIdWindow()" value="주소록">--%>
                </div>
                <div>
                    <input type="text" name="title" id="title" placeholder="제목을 입력하세요." onkeyup="checkLengthValidate(this, 50)">
                </div>
                <div class="contentDiv">
                    <textarea name="content" id="content" placeholder="내용을 입력하세요." onkeyup="checkLengthValidate(this, 2000)"></textarea>
                </div>
                <div class="bottom">
                    <button type="submit" class="submitBtn">작성 완료</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
