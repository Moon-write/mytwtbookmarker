<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Twitter BookMarker</title>
<link href="../../../resources/css/index.css" rel="stylesheet">
<script type='text/javascript' src='http://code.jquery.com/jquery-3.6.0.js'></script>
</head>
<body>    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <content>
        <div class="div-content">
            <div class="div1-box quick-insert">
                <form action="/insertBookmark.do" method="post">
                <div class="title">빠른 북마크 등록</div>
                <div class="insert-box">
                    <select class="form-select">
                        <option selected>리스트 선택</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                    <input type="text" class="form-control" name="markLink" placeholder="트위터 링크를 입력하세요!">
                </div>
                <div class="preview-twt">
                    <div class="content-wrap">
                        <div class="content-id">
                        </div>
                        <div class="content-text">
                        </div>
                        <div>
                            <span class="content-date">
                            </span>
                            <a class="gotolink">원본 보기</a>
                        </div>
                    </div>
                    <div class="media-wrap">
                    </div>
                    <span class="material-symbols-outlined videoBadge" style="font-size:50px;"></span>
                </div>
                <div class="insert-button d-grid gap-2">
                    <input type="submit" class="btn btn-outline-light" value="북마크 등록">
                    <input type="reset" class="btn btn-primary" value="초기화">
                </div>            
            </form>
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/index.js"></script>
</body>
</html>