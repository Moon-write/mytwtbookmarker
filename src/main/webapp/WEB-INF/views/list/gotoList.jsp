<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .keywordBadge{
        background-color: #1d9bf0;
        color: white;
        border-radius: 15px;
        padding: 4px 10px;
        margin: 0 2px;
        font-size: 0.7em;
        font-weight: 900;
	}
    .list-element{
        border: 1px solid #1d9bf0;
        border-radius: 10px;
        padding: 5%;
    }
    .list-pic{
        width: 60px;
    }
    .list-pic>img{
        width: 100%;
        object-fit: cover;
        border-radius: 50%;
    }
    .list-title{
        width: calc( 100% - 60px - 100px );
        font-size: 1.5em;
        margin-left: 20px;
        line-height: 60px;
    }
    .list-title>span{
        margin-right: 10px;
        color: #1d9bf0;
    }
    .list-title>a{
        text-decoration: none;
        color: #1d9bf0;
    }
    .list-setting{
        width: 100px;
        text-align: right;
    }
    .list-setting>span{
        height: 60px;
        line-height: 60px;
        font-size: 30px;
    }
    .list-keyword{
        margin-top: 20px;
        width: 100%;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <content>
        <div class="div-content">
            <div class="div1-box">
				<div class="title">내 북마크 리스트</div>
				<a class="btn btn-outline-secondary" href="/gotoNewList.do">신규 리스트 등록</a>
                <hr>
                <div class="list-element">
                    <div style="display:flex;">
                        <div class="list-pic"><img src="../../../resources/img/common/돼끼.png"></div>
                        <div class="list-title">
                            <span class="material-symbols-outlined">no_encryption</span>
                            <a href="#">리스트 이름</a>
                        </div>
                        <div class="list-setting">
                            <span class="material-symbols-outlined">settings</span>
                            <span class="material-symbols-outlined">delete</span>
                        </div>
                    </div>
                    <div class="list-keyword keyword-box">
						<div class="keywordList">
                            <span class='keywordBadge'>방찬</span>
                            <span class='keywordBadge'>리노</span>
                        </div>
					</div>
                </div>
            </div>
            <div class="div1-box">
				<div class="title">즐겨찾기한 북마크 리스트</div>
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
        $(".login-box").empty();
        $(".login-box").html("<span class='material-symbols-outlined'><a href='/gotoNewList.do'>playlist_add</a></span>");
    </script>
</body>
</html>