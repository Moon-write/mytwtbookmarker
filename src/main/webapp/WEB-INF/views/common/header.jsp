<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!--JQuery-->
<script src="../../../resources/js/jquery-3.6.0.js"></script>
<!--부트스트랩 CSS/JS-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!--구글폰트-->
<link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- 헤더 CSS -->
<link href="../../../resources/css/common.css" rel="stylesheet">
<link href="../../../resources/css/header-common.css" rel="stylesheet">
<link href="../../../resources/css/header-m.css" rel="stylesheet">
<link href="../../../resources/css/header-web.css" rel="stylesheet">
<header>
	<input type="hidden" id="userNo" value="${sessionScope.loginUser.userNo}">
    <div class="header-menu">
		<c:if test="${not empty sessionScope.loginUser.userId }">
	        <div id="profilePic">
		        <img src="../../../resources/upload/user/${sessionScope.loginUser.userProfile }">
	        </div>
		</c:if>
        <div class="logo-position"><a href="/"><img src="../../../resources/img/common/logo.png"></a></div>
        <div class="login-box">
        	<c:choose>
        		<c:when test="${empty sessionScope.loginUser.userId}">
		            <span class="material-symbols-outlined"><a href="/joinStep1.do">person_add</a></span>
		            <span class="material-symbols-outlined login-btn">login</span>       		
        		</c:when>
        		<c:when test="${not empty sessionScope.loginUser.userId}">
		        	<span class="material-symbols-outlined login-btn"><a href="/logout.do">logout</a></span>        		
		            <span class="material-symbols-outlined"><a href="/gotoNewB.do">bookmark_add</a></span>
        		</c:when>
        	</c:choose>
        </div>
    </div>
</header>
<div class="modal-background">
    <div class="login-modal">
        <div class="modal-title">
            <img src="/resources/img/common/logo.png">
            <span class="material-symbols-outlined close-btn">close</span>
        </div>
        <form action="/login.do" method="post">
            <input type="text" name="userId" class="form-control" placeholder="아이디">
            <input type="password" name="userPw" class="form-control" placeholder="비밀번호">
            <input type="submit" class="btn btn-outline-primary" value="LOGIN">
        </form>
    </div>
</div>
<div class="navi-menu">
    <div class="navi-profile">
        <div id="profilePic"><img src="../../../resources/upload/user/${sessionScope.loginUser.userProfile }"></div>
        <span id="profileName">${sessionScope.loginUser.userName }</span>
        <span class="material-symbols-outlined naviClose-btn">undo</span>
    </div>
    <div class="navi-button d-grid gap-2">
        <button class="btn btn-outline-primary">프로필 수정</button>
    </div>
    <ul class="navi-list">
        <li><a href="#">북마크 등록</a></li>
        <li><a href="/gotoList.do">내 북마크 리스트 관리</a></li>
        <li><a href="#">북마크 리스트 검색</a></li>
        <li><a href="#">로그아웃</a></li>
    </ul>
</div>
<script src="/resources/js/header.js"></script>