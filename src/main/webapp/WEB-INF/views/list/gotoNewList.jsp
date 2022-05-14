<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.keyword-box{
		position: relative;
	}
	.keywordList{
		position: absolute;
		left: 0px;
		top: 6px;
		display: flex;
	}
	.keywordBadge{
		background-color: #1d9bf0;
		color: white;
		border-radius: 15px;
		padding: 4px 10px;
		margin: 0 2px;
		font-size: 0.7em;
		font-weight: 900;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <content>
        <div class="div-content">
            <div class="div1-box">
				<div class="title">새 리스트 등록</div>
				<form action="/insertNewList.do" method="post">
					<label for="listName" class="form-label">신규 리스트 이름</label>
					<input type="text" name="listName" class="form-control" id="listName">
					<input type="checkbox" name="listOpen" id="listOpen" class="form-check-input"><label for="listOpen" class="form-check-label">공개 리스트 설정</label>
					<br>공개 리스트 설정 시 다른 유저가 회원님의 리스트를 탐색할 수 있습니다.
					<br>
					<label for="listKeyword" class="form-label">리스트 키워드 설정</label>
					<div class="keyword-box">
						<div class="keywordList"></div>
						<input type="text" class="form-control" id="listKeyword" placeholder="쉼표(,)로 키워드 구분">
					</div>					
				</form>
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		let keywordArray = new Array();
		$("input#listKeyword").on("keyup",function(){
			const insert = $(this).val();
			const index = insert.indexOf(",");

			if(index>0){
				// 콤마가 있으면 분리
				const keyword = insert.substring(0,index);
				$(this).val(insert.substring(index+1));
				
				keywordArray.push(keyword);
					
				const badge = $("<div class='keywordBadge'>");
				const close = $("<span class='material-symbols-outlined closeBadge' style='font-size:0.5em; margin-left:4px; font-weight:300;'>");
				close.text("close");

				badge.append(keyword);
				badge.append(close);

				$(".keywordList").append(badge);
				
				paddingsetting();				
			}
		})

		$(document).on("click",".closeBadge",function(){
			const badge = $(this).parent();
			const keyword = badge.text();
			
			const index = keywordArray.indexOf(keyword.substring(0,keyword.length-5));
			keywordArray.splice(index,1);
			badge.css("display","none");

			paddingsetting();
		});
		function paddingsetting(){
			const width = $(".keywordList").css("width")
			$("input#listKeyword").css("padding-left", "calc( "+width+" + 10px )");
		}
	</script>
</body>
</html>