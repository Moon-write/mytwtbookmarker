<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        margin: 10px 0px;
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
                <c:forEach items="${list }" var="l" varStatus="i">
	                <div class="list-element">
	                    <div style="display:flex;">
	                        <div class="list-pic">
	                        	<c:choose>
	                        		<c:when test="${not empty l.listProfile }">
			                        	<img src="../../../resources/upload/list/${l.listProfile}"></div>
									</c:when>
									<c:when test="${empty l.listProfile }">
										<img src="../../../resources/img/common/돼끼.png"></div>
									</c:when>
	                        	</c:choose>
	                        <div class="list-title">
	                        	<c:choose>
	                        		<c:when test="${l.listOpen eq 1}">
			                            <span class="material-symbols-outlined" style="color: #e3e3e3;">lock_open</span>	                        		
	                        		</c:when>
	                        		<c:when test="${l.listOpen eq 0}">
			                            <span class="material-symbols-outlined" style="color: #e3e3e3;">lock</span>	                        		                        		
	                        		</c:when>
	                        	</c:choose>
	                            <a href="/viewList.do?listNo=${l.listNo }">${l.listName }</a>
	                        </div>
	                        <div class="list-setting">
	                            <span class="material-symbols-outlined" style="color : #a9d6f5">settings</span>
	                            <span class="material-symbols-outlined" style="color : #f5a9a9">delete</span>
	                        </div>
	                    </div>
	                    <div class="list-keyword keyword-box">
							<div class="keywordList">
								<c:forEach items="${l.listKeyword }" var="k">
		                            <span class='keywordBadge'>${k}</span>
								</c:forEach>
	                        </div>
						</div>
	                </div>
                </c:forEach>
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