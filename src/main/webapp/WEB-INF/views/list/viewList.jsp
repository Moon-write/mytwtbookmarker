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
				<div class="title">
					${list.listName }
				</div>
			    <div class="list-keyword keyword-box">
					<div class="keywordList">
						<c:forEach items="${list.listKeyword }" var="k" varStatus="i">
                            <span class='keywordBadge'>${k }</span>
						</c:forEach>
                   	</div>
               	</div>
               	<hr>
               	${bList}
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>