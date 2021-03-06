<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Twitter BookMarker</title>
<link href="../../../resources/css/index-web.css" rel="stylesheet">
<link href="../../../resources/css/index-common.css" rel="stylesheet">
<script type='text/javascript' src='http://code.jquery.com/jquery-3.6.0.js'></script>
</head>
<body>    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<c:if test="${not empty msg}">
		<script>
			alert('${msg}');
		</script>
	</c:if>
    <content>
        <div class="div-content">
            <div class="div1-box quick-insert">
                <form action="/quickInsertBookmark.do" method="post">
                <div class="title">빠른 북마크 등록</div>
                <div class="insert-box">
                    <select class="form-select" id="listVal" name="listNo">
                        <option selected>리스트 선택</option>
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
                <div class="insertBtn">
                    <input type="reset" onclick="twtInit()"class="btn btn-outline-light" value="초기화">
                    <input type="submit" class="btn btn-outline-light" value="북마크 등록">
                </div>
            </form>
            </div>
            <div class="div1-box">
            	<div class="title">나의 북마크</div>
            	<select class="form-select">
            		<option selected>리스트 선택</option>
            	</select>
            	<div class="keywordList">
            		
            	</div>
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/copyTwt.js"></script>
    <script>
        // ajax로 로그인한 아이디의 리스트 정보 불러오기
        $(function(){
        	loadList();
        })
        function loadList(){
        	const userNo = $("input#userNo").val();
        	console.log(userNo);
        	
        	$.ajax({
        		url: "/getLists.do",
        		data : {
        			userNo : userNo
        		},
        		success: function(list){
        			for(let i=0;i<list.length;i++){
        				const option = $("<option>");
        				option.val(list[i].listNo);
        				option.text(list[i].listName);
        				$("select#listVal").append(option);
        			}
        		}
        	})
        }
    </script>
</body>
</html>