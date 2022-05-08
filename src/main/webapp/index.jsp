<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Twitter BookMarker</title>
<style>
    body{
        margin: 0px; padding: 0px;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }
    content{
        flex-grow: 1;
        position: relative;
    }
    .div-content{
        background-color: cadetblue;
        min-width: 500px;
        max-width: 1080px;
        margin: 0 auto;
    }
</style>
</head>
<body>    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <content>
        <jsp:include page="/WEB-INF/views/common/navi.jsp"/>
        <div class="div-content">
            <div class="quick-insert">
                <div class="title">빠른 북마크 등록</div>
                <div class="insert-box">
                    <select class="form-select">
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                    <input type="text" class="form-control" name="markLink">
                </div>
                <div class="navi-button d-grid gap-2">
                    <input type="submit" class="btn btn-outline-primary" value="북마크 등록">
                </div>                
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>