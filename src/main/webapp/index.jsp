<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Twitter BookMarker</title>
<link href="../../../resources/css/index.css" rel="stylesheet">
</head>
<body>    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <content>
        <div class="div-content">
            <div class="quick-insert">
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
                    <blockquote class="twitter-tweet">
                        <p lang="en" dir="ltr">Sunsets don&#39;t get much better than this one over <a href="https://twitter.com/GrandTetonNPS?ref_src=twsrc%5Etfw">@GrandTetonNPS</a>. <a href="https://twitter.com/hashtag/nature?src=hash&amp;ref_src=twsrc%5Etfw">#nature</a> <a href="https://twitter.com/hashtag/sunset?src=hash&amp;ref_src=twsrc%5Etfw">#sunset</a> <a href="http://t.co/YuKy2rcjyU">pic.twitter.com/YuKy2rcjyU</a></p>&mdash; US Department of the Interior (@Interior) <a href="https://twitter.com/Interior/status/463440424141459456?ref_src=twsrc%5Etfw">May 5, 2014</a>
                    </blockquote>
                    <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                </div>
                <div class="insert-button d-grid gap-2">
                    <input type="submit" class="btn btn-outline-light" value="북마크 등록">
                </div>                
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/index.js"></script>
</body>
</html>