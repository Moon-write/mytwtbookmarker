<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <content>
        <div class="div-content">
            <div class="div1-box">
                <div class="title">회원가입 성공!</div>
                <div class="notice-comment">축하합니다. 마음껏 로그인해보세용</div>
				<a href="/" class="btn btn-lg btn-primary">메인 페이지로</a>
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>