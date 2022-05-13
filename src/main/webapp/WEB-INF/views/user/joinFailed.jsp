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
                <div class="title">이런!</div>
                <div class="notice-comment">뭔가 실패한거같은데 다시 해보시겠어요?</div>
				<a href="/" class="btn btn-lg btn-primary">메인 페이지로</a><a href="/joinStep1.do" class="btn btn-lg btn-primary">회원가입</a>
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>